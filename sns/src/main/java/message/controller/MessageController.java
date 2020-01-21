package message.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import message.model.Message;
import message.model.MessageDao;
import user.model.User;
import user.model.UserDao;

@Controller
public class MessageController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	MessageDao mDao;
	
	@RequestMapping("tomessenger.mess")
	public String page(HttpSession session, Model model,
			@RequestParam(value="f_num", required=false) String f_num) {
		User login = (User) session.getAttribute("userLoginfo");
		
		int m_num = login.getM_num();
		List<User> friends = userDao.myfriends(m_num);
		List<User> realFriends = new ArrayList<User>();
		
		for(int i = 0; i<friends.size();i++) {
			if(m_num != friends.get(i).getM_num()) {
				realFriends.add(friends.get(i));
				
			}
			
		}
		
		
		//메세지 전체 들고 오기 
		List<Message> mlist = mDao.getChats(m_num);
		
		
		model.addAttribute("mlist",mlist);
		model.addAttribute("friends",realFriends);
		model.addAttribute("login",login);
		if(f_num != null) {
			
			model.addAttribute("f_num",f_num);
			
			
			return "messagePage.jsp?f_num="+f_num;
		}
		return "messagePage";
	}
	
	@ResponseBody
	@RequestMapping("getMessage.mess")
	public List<Message> getList(@RequestParam("s_tonum") String s_tonum,
			@RequestParam("s_fromnum") String s_fromnum){
		
		List<Message> texts = mDao.getChatList(s_tonum,s_fromnum);
		
		return texts;
	}
	
	
	@ResponseBody
	@RequestMapping("insertmsg.mess")
	public List<Message> insert(Message message, HttpSession session) {
		
		User login = (User) session.getAttribute("userLoginfo");
		String s_fromnum = Integer.toString(login.getM_num());
		message.setS_fromnum(s_fromnum);
		System.out.println("was here"+message);
		mDao.insertChat(message);
		
		
		String s_tonum = message.getS_tonum();
		List<Message> mlist = mDao.getChatList(s_tonum,s_fromnum);
		
		System.out.println("s_fromnum:"+s_fromnum+ ","+s_tonum);
		
		
		
		
		
		
		
		return mlist;
	}
}
