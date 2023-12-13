package org.team.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.team.admin.AdminCriteria;
import org.team.admin.AdminPageDTO;
import org.team.admin.AdminService;
import org.team.join.MemberDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminManagementController {
	
	@Autowired
	private AdminService adminservice;

	@GetMapping(value = {"/memberManagement"})
	 public String memberManagement(
			 @RequestParam(name = "id",required = false) String id,
			 @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
			@RequestParam(name = "amount", defaultValue = "10") Integer amount,
			@RequestParam(name = "point", defaultValue = "") Double point,
		
			Model model
			 ) {
	      log.info("memberManagement get 페이지");
	      
	      int total = adminservice.memberTotal();
	      AdminCriteria cri = new AdminCriteria(pageNum, amount);
	      log.info(total);
	      
	      List<MemberDTO> mDTO = adminservice.memberList(cri);
	      AdminPageDTO pDTO = new AdminPageDTO(cri, total);
	      
	      
	    
	      model.addAttribute("memberList",mDTO);
	      model.addAttribute("pageManagement",pDTO);
	      return "admin/memberManagement";
	}
	
	 @RequestMapping(value="/memberManagement/modifyMember/", method=RequestMethod.POST)
	 public String modifyMember(
			 @RequestParam(name = "id",required = false) String id,
			 @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
			@RequestParam(name = "amount", defaultValue = "10") Integer amount,
			@RequestParam(name = "point", defaultValue = "") Double point,
		
			Model model,
			 MemberDTO member)throws Exception {
		 log.info("modify 시작");
		 log.info("memberDTO :"+member);
		 int result = adminservice.modifyMember(member);
		 log.info("수정은 "+result+"개");
		 
		 int total = adminservice.memberTotal();
		 AdminCriteria cri = new AdminCriteria(pageNum, amount);
		 List<MemberDTO> mDTO = adminservice.memberList(cri);
	      AdminPageDTO pDTO = new AdminPageDTO(cri, total);
	
		 model.addAttribute("memberList",mDTO);
	      model.addAttribute("pageManagement",pDTO);
		 return "admin/memberManagement";
	}
	 @RequestMapping(value="/memberManagement/deleteMember/", method=RequestMethod.POST)
	 public String deleteMember(
			 @RequestParam(name = "id",required = false) String id,
			 @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
			@RequestParam(name = "amount", defaultValue = "10") Integer amount,
			@RequestParam(name = "email", defaultValue = "") String email, 
			@RequestParam(name = "user_name", defaultValue = "") String user_name, 
			@RequestParam(name = "address", defaultValue = "") String address,
			@RequestParam(name = "gender",defaultValue = "") Integer gender,
			@RequestParam(name = "birth_date", defaultValue = "") String birth_date ,
			@RequestParam(name = "phone" ,defaultValue = "")String phone,
			@RequestParam(name = "point", defaultValue = "") String point,
			@RequestParam(name="join_date", defaultValue = "") String join_date,
			Model model
			 )throws Exception {
		 
		 log.info("delete 시작");
		 log.info("deleteID : "+id);
		 
		 int result = adminservice.deleteMember(id);
		 log.info("result번호 : "+result+"개 지워짐");
		 
		 int total = adminservice.memberTotal();
		 AdminCriteria cri = new AdminCriteria(pageNum, amount);
		 List<MemberDTO> mDTO = adminservice.memberList(cri);
	      AdminPageDTO pDTO = new AdminPageDTO(cri, total);
		 model.addAttribute("memberList",mDTO);
	      model.addAttribute("pageManagement",pDTO);
	      
		 return "admin/memberManagement";
	}
	 @RequestMapping(value="/memberManagement/memberKeywordSearch/", method=RequestMethod.GET)
	 public String keywordsearch(
			 @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
			@RequestParam(name = "amount", defaultValue = "10") Integer amount,
			 @RequestParam(name="keyword", defaultValue = "") String keyword,
			 Model model) {
		log.info("키워드 : "+keyword);
		int total = adminservice.keywordMemberTotal(keyword);
		
		log.info("결과 : "+total);
		 AdminCriteria cri = new AdminCriteria(pageNum, amount);
		 log.info("cri : "+cri);
		List<MemberDTO>mDTO = adminservice.keywordMemberList(cri, keyword);
		AdminPageDTO pDTO = new AdminPageDTO(cri, total);
	      model.addAttribute("keyword",keyword);
		model.addAttribute("memberList",mDTO);
	      model.addAttribute("pageManagement",pDTO);
		
		return "admin/memberManagement";
	 }
	

	   

}