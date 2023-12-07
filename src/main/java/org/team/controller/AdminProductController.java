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
import org.team.domain.Criteria;
import org.team.domain.PageDTO;
import org.team.domain.ProductVO;
import org.team.join.MemberDTO;
import org.team.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/productManagement")
@Log4j
public class AdminProductController {
	
	@Autowired
	private AdminService adminservice;
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@GetMapping(value= {"/","","/productManagement/","productmanagement","productManagement/"})
	public void productManagement(
			@RequestParam(name = "category_id",required = false) String category_id,
			@RequestParam(name = "color_id", defaultValue = "1") String color_id, 
			@RequestParam(name = "size_id", defaultValue = "1") String size_id,
			@RequestParam(name = "sort",defaultValue = "asc") String sort,
			@RequestParam(name = "pageStart", defaultValue = "1") Integer pageStart ,
			@RequestParam(name = "row" ,defaultValue = "0")Integer row,
			@RequestParam(name = "high", defaultValue = "500000") Integer high,
			@RequestParam(name="keyword", defaultValue = "") String keyword,
			Model model) {
		
		Criteria cri = new Criteria(pageStart,10,keyword);
		List<ProductVO> list = service.getList(cri);
		int total = service.getTotal();
		PageDTO pDto = new PageDTO(cri, total);
		model.addAttribute("product", list);
		model.addAttribute("pageMaker", pDto);
		
//		PageDTO pDto = null;
//		int total = 0;
//		if(category_id.equals("0")||category_id==null) {
//			Criteria cri = new Criteria(pageStart,10,keyword);
//			List<ProductVO> list = service.getList(cri);
//			total = service.getTotal();
//			pDto = new PageDTO(cri, total);
//			model.addAttribute("product", list);
//			model.addAttribute("pageMaker", pDto);
//			log.info("상품 리스트 페이지");
//			log.info("keyword : " + keyword);
//		}else {
//			ProductVO vo = new ProductVO();
//			vo.setCategory_id(category_id);
//			vo.setColor_id(color_id);
//			vo.setSize_id(size_id);
//	
//			Criteria cri = new Criteria(pageStart,8,keyword); 
//			total = service.selectTotal(vo, cri, sort, row, high);
//			
//			pDto = new PageDTO(cri, total);
//			
//			List<ProductVO> list = service.selectList(vo,cri,sort,row, high);
//			model.addAttribute("product", list);
//			model.addAttribute("pageMaker", pDto);
//			
//			log.info(category_id + "번 상품 리스트 페이지");
//			log.info(color_id + " : 색상");
//			log.info(size_id + " : 사이즈");
//			log.info(sort + " : 정렬 순서");
//			log.info("row price : " + row);
//			log.info("high price : " + high);
//			log.info("keyword : " + keyword);
//		}

	}
	

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
		model.addAttribute("memberList",mDTO);
	      model.addAttribute("pageManagement",pDTO);
		
		return "admin/memberManagement";
	 }
	

	   

}
   
