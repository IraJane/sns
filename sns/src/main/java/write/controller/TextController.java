package write.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import user.model.User;
import write.model.Categ;
import write.model.CategDao;
import write.model.LikeDao;
import write.model.Write;
import write.model.WriteDao;

@Controller
public class TextController {
	
	@Autowired
	WriteDao writeDao;
	
	@Autowired
	CategDao categDao;
	
	@Autowired
	LikeDao likeDao;
	
	@Autowired
	ServletContext sc;
	
	@RequestMapping("/insertText.ing")
	public String insert(@RequestParam(value="categ",required=false) String[] categ,
			MultipartHttpServletRequest mpfRequest,
			HttpSession session,
			Write write) {
		
		System.out.println("text insert ");
		System.out.println(categ.length);
		System.out.println(write.getFile());
		System.out.println(mpfRequest.getFile("file"));
		
		String[] nums= new String[categ.length];
		
		String all="";
		
		

		for(int i = 0; i<categ.length;i++) {
			String cc = categ[i].replace("#", "");
			cc = cc.replace(" ", "");
			System.out.println("cc"+cc);
			
			Categ cnt = categDao.getNum(cc);  //이 카테고리의 번호 가지고 오기
			System.out.println(cnt);
			int c_num = -1;
			if(cnt == null) {
				categDao.insertCateg(cc);  //카테고리 추가 하기
				c_num = categDao.getCNum();
				System.out.println("cnum:"+c_num);
			} else {
				c_num = cnt.getC_num();
				
			}
			
			nums[i] = Integer.toString((c_num));
			
		}
		System.out.println("nums:"+nums);
		for(String ff : nums) {
			all = all+ff + ",";
		}
		
		
		//날짜 형식 	
	
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String to = transFormat.format(from);
		write.setT_todate(to);

		
		//사진저장
		User login = (User) session.getAttribute("userLoginfo");
		int cnt = writeDao.getMaxNum();
		cnt = cnt + 1;
		
		if(mpfRequest.getFile("file") != null){
			String uploadPath = sc.getRealPath("/resources/"+login.getM_num()+"/posts/"+cnt+"/");
			List<MultipartFile> fileList = mpfRequest.getFiles("file");
			System.out.println(uploadPath);
			
			File file=new File(uploadPath);
		      System.out.println(uploadPath);
		      if(file.exists()==false) {
		         file.mkdirs();
		      }
			
			for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);

	            String safeFile = uploadPath + originFileName;
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }

			
		}
			
	
		
		write.setC_num(all);
		System.out.println("total Write:"+write);
		writeDao.insertText(write);
		
		return "redirect:/login.er";
	}
	
	
	
	
	@RequestMapping("/heartThis.ing")
	public String heart(@RequestParam("t_num") String t_num,
			 Model model, HttpSession session) {
		System.out.println("heart:"+ t_num);
		
		User login = (User) session.getAttribute("userLoginfo");
		
		String m_num = Integer.toString(login.getM_num());
		
		int cnt = likeDao.checkThis(t_num,m_num);
		if(cnt == 0) {
			likeDao.heartThis(t_num,m_num);
			
		}
		
		
		return "redirect:/search.er?m_num="+m_num;
		
	}
	
	
	@RequestMapping("/dontheartThis.ing")
	public String dontheart(@RequestParam("t_num") String t_num,
			HttpSession session) {
		System.out.println("heart:"+ t_num);
		
		User login = (User) session.getAttribute("userLoginfo");
		
		String m_num = Integer.toString(login.getM_num());
		
		
			likeDao.dontheartThis(t_num,m_num);
			
		
		
		
		
		return "redirect:/search.er?m_num="+m_num;
		
	}
	
	
	
	
}
