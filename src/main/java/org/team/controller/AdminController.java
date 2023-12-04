package org.team.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team.admin.AdminCriteria;
import org.team.admin.AdminPageDTO;
import org.team.admin.AdminService;
import org.team.join.MemberDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService adminservice;

	@GetMapping(value = {"/admin","/memberManagement"})
	 public String memberManagement(
			 @RequestParam(name = "id",required = false) String id,
			 @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
			@RequestParam(name = "amount", defaultValue = "12") Integer amount,
			@RequestParam(name = "email", defaultValue = "") String email, 
			@RequestParam(name = "user_name", defaultValue = "") String user_name, 
			@RequestParam(name = "address", defaultValue = "") String address,
			@RequestParam(name = "gender",defaultValue = "") Integer gender,
			@RequestParam(name = "birth_date", defaultValue = "") String birth_date ,
			@RequestParam(name = "phone" ,defaultValue = "")String phone,
			@RequestParam(name = "point", defaultValue = "") String point,
			@RequestParam(name="join_date", defaultValue = "") String join_date,
			Model model
			 ) {
	      log.info("memberManagement get 페이지");
	      
	      int total = adminservice.memberTotal();
	      AdminCriteria cri = new AdminCriteria(pageNum, 12);
	      log.info(total);
	      
	      List<MemberDTO> mDTO = adminservice.memberList(cri);;
	      AdminPageDTO pDTO = new AdminPageDTO(cri, total);
	      
	      
	    
	      model.addAttribute("memberList",mDTO);
	      model.addAttribute("pageManagement",pDTO);
	      return "admin/admin";
	}
	

	   

}
   
