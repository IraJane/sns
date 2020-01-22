package user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import user.model.Follow;
import user.model.FollowDao;
import user.model.User;
import user.model.UserDao;
import write.model.Like;
import write.model.LikeDao;
import write.model.Story;
import write.model.StoryDao;
import write.model.Write;
import write.model.WriteDao;

@Controller
public class UserController {
	
	private static final boolean False = false;

	@Autowired
	UserDao userDao;
	
	@Autowired
	WriteDao writeDao;
	
	@Autowired
	StoryDao storyDao;
	
	@Autowired
	LikeDao likeDao;
	
	@Autowired
	FollowDao followDao;
	
	@Autowired
	ServletContext sc;

	
	@RequestMapping("/main.er")
	public String main() {
		
		
		return "main";
	}
	
	@RequestMapping(value = "signup.er", method=RequestMethod.GET)
	public String signup() {
		
		return "signup";
	}
	@RequestMapping(value = "signup.er", method=RequestMethod.POST)
	public String signup2(User user) {
		System.out.println(user);
		
		String first = user.getM_firstname();
		String last = user.getM_lastname();
		user.setM_name(first +" "+ last);
		
		int maxnum = userDao.getMaxNum()+1;
		
		String path = sc.getRealPath("/resources/"+ maxnum);
		System.out.println(path);
		File file = new File(path + File.separator + user.getM_image());
		MultipartFile multi = user.getImglist();
		
		 if(file.exists()==false) {
	         file.mkdirs();
	      }
		
		 try {
			multi.transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int cnt = userDao.signup(user);
		System.out.println("signup:"+ cnt);
		
		
		
		
		return "redirect:/main.er";
	}
	
	
	@RequestMapping(value = "login.er")
	public String login(User user,HttpSession session,Model model) {
		System.out.println("jj"+user);
		System.out.println("jyj"+session.getAttribute("userLoginfo"));
		
				
				
				System.out.println("else if true");
				
				if(session.getAttribute("userLoginfo")!=null) {
					user = (User) session.getAttribute("userLoginfo");
				}
				
				
				User login = userDao.loginThis(user);
				System.out.println("kk:"+login);
				if(login == null) {
					
					return "redirect:/main.er"; 
				}
				
				
				
				//스토리 
				List<Story> texts = storyDao.getStories(login.getM_num());
				System.out.println(texts);
				
				
				
				session.setAttribute("userLoginfo", login);
				model.addAttribute("login",login);
				model.addAttribute("texts",texts);
				return "usermMain";
			
	
	}
	
	@RequestMapping("info.er")
	public String info(HttpSession session,Model model) {
		User login = (User) session.getAttribute("userLoginfo");
		
		String[] name = login.getM_name().split(" ");
		System.out.println(name);
		if(name.length>1) {
			String first = name[0];
			String second = name[1];
			model.addAttribute("first",first);
			model.addAttribute("second",second);
		}
		
		model.addAttribute("login",login);
		return "userInfo";
	}
	
	@RequestMapping("changeInfo.er")
	public String change(@RequestParam(value="allData", required=False) String allData,
			@RequestParam(value="eData",required=false) String eData,
			HttpSession session) {
		
		User login = (User) session.getAttribute("userLoginfo");
		
		if(allData != null) {
			System.out.println("지나감:" + allData);
			User mm = new User();
			mm.setM_name(allData);
			mm.setM_num(login.getM_num());
			userDao.updateName(mm);
			
		}
		
		if(eData != null) {
			System.out.println("email:" + eData);
			User mm = new User();
			mm.setM_email(eData);
			mm.setM_num(login.getM_num());
			userDao.updateEmail(mm);
		}
		
		return "redirect:info.er";
	}
	
	@RequestMapping(value = "search.er")
	public String userpage(@RequestParam(value="m_num",required=false) String m_num,
			@RequestParam(value="keyword",required=false) String keyword,HttpSession session,
			Model model) {
		List<Write> keylist = new ArrayList<Write>();
		List<User> keymember = new ArrayList<User>();
		System.out.println(m_num +"and"+keyword);
		
		
		if(m_num != null) {
			List<Write> list = new ArrayList<Write>();
			User login = new User();
			
			list = writeDao.selectUserPost(m_num);
			login = userDao.selectUser(m_num);
			
			User user = (User)session.getAttribute("userLoginfo");
			List<Like> mylikes = likeDao.selectLikelists(user.getM_num());
			System.out.println(user.getM_num());
			System.out.println(mylikes);
			int mnum = Integer.parseInt(m_num);
			int followlist = -1;
			
			if(mnum == user.getM_num()) {
				followlist = 5;
				
			} else {
				
				followlist = followDao.getMyFollows(m_num,user.getM_num());
				
			}
			
			System.out.println("followlist:"+followlist);
			System.out.println("mnum:"+mnum);
			System.out.println("user num:"+user.getM_num());
			
			model.addAttribute("followlist", followlist);
			model.addAttribute("mylikes", mylikes);
			model.addAttribute("thisUser", login);
			model.addAttribute("login", user);
			model.addAttribute("list", list);
			return "userpage";
		}
		
		
		User user = (User)session.getAttribute("userLoginfo");
		System.out.println("keyword:"+keyword);
		List<User> key = userDao.searchUser(keyword);
		
		for(int i =0; i<key.size();i++) {
			if(key.get(i).getM_num() != user.getM_num()) {
				
				keymember.add(key.get(i));
				
			}
			
			
			
		}
		
		keylist = writeDao.searchUserPost(keyword);
		
		List<Follow> followlist =  followDao.getAllFollows(user.getM_num());
		
		User login = (User) session.getAttribute("userLoginfo");
		model.addAttribute("login",login);
		model.addAttribute("keyword", keyword);
		model.addAttribute("followlist", followlist);
		model.addAttribute("keymember", keymember);
		model.addAttribute("keylist", keylist);
		return "searchPage";
	}
	
	@RequestMapping("logout.er")
	public String logout(HttpSession session) {
		session.invalidate();
		

		return "redirect:/main.er";
	}
	
	
	@RequestMapping("addfriend.er")
	public String addfriend(@RequestParam("f_theirNum") String f_theirNum,HttpSession session) {
		Follow follow = new Follow();
		
		User login = (User) session.getAttribute("userLoginfo");
		String mnum = Integer.toString(login.getM_num());
		
		
		
		followDao.addFriend(mnum, f_theirNum);
		
		return "redirect:/search.er?m_num="+f_theirNum;
		
	}
	
	@RequestMapping("deletefriend.er")
	public String deletefriend(@RequestParam("f_theirNum") String f_theirNum,HttpSession session) {
		Follow follow = new Follow();
		
		User login = (User) session.getAttribute("userLoginfo");
		String nn = Integer.toString(login.getM_num());
		
		follow.setM_num(nn);  // 나의 번호 
		follow.setF_theirNum(f_theirNum); // 친구 번호
		
		followDao.deleteFriend(follow);
		
		return "redirect:/search.er?m_num="+f_theirNum;
	}
	
	@RequestMapping("friends.er")
	public String myfriends(HttpSession session, Model model) {
		
		User login = (User) session.getAttribute("userLoginfo");
		model.addAttribute("login",login);
		
		// get friends 
		List<User> frii = userDao.getAllFollows(login.getM_num());
		List<User> friends = new ArrayList<User>();
		for(int i = 0; i<frii.size(); i++) {
			System.out.println(frii.get(i).getM_num()+","+ login.getM_num());
			if(frii.get(i).getM_num() != login.getM_num()) {
				friends.add(frii.get(i));
				
			}
			
		}
		
		System.out.println(friends);
		
		model.addAttribute("friends",friends);
		return "myfriendpage";
	}
	
	
	
	
	
	
	
}
