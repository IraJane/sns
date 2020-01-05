package write.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TextController {
	
	@RequestMapping("insertText.ing")
	public String insert() {
		System.out.println("text insert ");
		
		
		return "redirect:/login.er";
	}
	
	
	
	
}
