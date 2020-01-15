package message.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String page(HttpSession session, Model model) {
		User login = (User) session.getAttribute("userLoginfo");
		
		int m_num = login.getM_num();
		List<User> friends = userDao.myfriends(m_num);
		
		//메세지 전체 들고 오기 
		List<Message> mlist = mDao.getChats(m_num);
		
		
		model.addAttribute("mlist",mlist);
		model.addAttribute("friends",friends);
		model.addAttribute("login",login);
		return "messagePage";
	}
	
	
	@ResponseBody
	@RequestMapping("insertmsg.mess")
	public List<Message> insert(Message message, HttpSession session) {
		
		User login = (User) session.getAttribute("userLoginfo");
		String m_num = Integer.toString(login.getM_num());
		message.setS_fromnum(m_num);
		System.out.println("was here"+message);
		mDao.insertChat(message);
		
		
		int mm_num = login.getM_num();
		List<Message> mlist = mDao.getChats(mm_num);
		
		
		
		
		
		
		
		
		return mlist;
	}
}
