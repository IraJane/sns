package user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import user.model.User;
import user.model.UserDao;

@Controller
public class UserController {
	
	private static final boolean False = false;

	@Autowired
	UserDao userDao;
	
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
				
				
				session.setAttribute("userLoginfo", login);
				model.addAttribute("login",login);
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
	
	
	
	
	
}