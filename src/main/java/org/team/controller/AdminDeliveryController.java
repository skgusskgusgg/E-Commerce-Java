package org.team.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.team.admin.AdminCriteria;
import org.team.admin.AdminPageDTO;
import org.team.admin.AdminService;
import org.team.delivery.deliveryDTO;
import org.team.join.MemberDTO;
import org.team.mypage.orderDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/deliveryManagement")
@Log4j
public class AdminDeliveryController {
	
	@Autowired
	private AdminService adminservice;
	
	@GetMapping(value= {"/","","deliveryManagement"})
	public String deliveryManagement(
			 @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
				@RequestParam(name = "amount", defaultValue = "10") Integer amount,
				Model model) {
		int total = adminservice.deliveryTotal();
		log.info(total);
		AdminCriteria cri = new AdminCriteria(pageNum, amount);
		List<deliveryDTO> dDTO = adminservice.deliveryList(cri);
		 AdminPageDTO pDTO = new AdminPageDTO(cri, total);
		 model.addAttribute("deliveryList",dDTO);
	      model.addAttribute("pageManagement",pDTO);
	      return "admin/deliveryManagement";
	}

	@GetMapping(value="deliveryKeywordSearch")
	public String deliveryKeywordSearch (
			@RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
			@RequestParam(name = "amount", defaultValue = "10") Integer amount,
			@RequestParam(name = "deliverySort")String deliverySort,
			@RequestParam(name="keyword")String keyword,
			Model model) {
		log.info("Delivery페이지 Sort 입력 : "+deliverySort);
		log.info("Delivery페이지 키워드 입력 : "+keyword);
		
		int total = adminservice.deliveryKeywordSearchTotal(deliverySort, keyword);
		AdminCriteria cri = new AdminCriteria(pageNum, amount);
		List<deliveryDTO> dDTO = adminservice.deliveryKeywordSearch(deliverySort, keyword, cri);
		AdminPageDTO pDTO = new AdminPageDTO(cri, total);
		 model.addAttribute("deliverySort",deliverySort);
		 model.addAttribute("keyword",keyword);
		 model.addAttribute("deliveryList",dDTO);
	      model.addAttribute("pageManagement",pDTO);
		
		
		return "admin/deliveryManagement";
	}
	@PostMapping(value="modifyDelivery")
	public String modifyDelivery (
			@RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
			@RequestParam(name = "amount", defaultValue = "10") Integer amount,
			@RequestParam(name = "deliverySort")String deliverySort,
			@RequestParam(name="keyword")String keyword,
			deliveryDTO mDTO,
			Model model) {
		log.info("Delivery페이지 Sort 입력 : "+deliverySort);
		log.info("Delivery페이지 키워드 입력 : "+keyword);
		log.info("mDTO 입력 : "+mDTO);
		int result = adminservice.modifyDelivery(mDTO);
		log.info("result : "+result+"개 딜리버리 수정");
		int delivery_id = mDTO.getDelivery_id();
		int status = mDTO.getTotal_status();
		int result2 = adminservice.modifyOrders(delivery_id, status);
		log.info("result2 : "+result2+"개 오더 배송상태 수정");
		
		
		if(keyword.length()>0&&deliverySort.length()>0) {
		
		int total = adminservice.deliveryKeywordSearchTotal(deliverySort, keyword);
		AdminCriteria cri = new AdminCriteria(pageNum, amount);
		List<deliveryDTO> dDTO = adminservice.deliveryKeywordSearch(deliverySort, keyword, cri);
		AdminPageDTO pDTO = new AdminPageDTO(cri, total);
		 model.addAttribute("deliverySort",deliverySort);
		 model.addAttribute("keyword",keyword);
		 model.addAttribute("deliveryList",dDTO);
	      model.addAttribute("pageManagement",pDTO);
		return "admin/deliveryManagement";
		
		}else {
			
			int total = adminservice.deliveryTotal();
			AdminCriteria cri = new AdminCriteria(pageNum, amount);
			List<deliveryDTO> dDTO = adminservice.deliveryList(cri);
			 AdminPageDTO pDTO = new AdminPageDTO(cri, total);
			 model.addAttribute("deliveryList",dDTO);
		      model.addAttribute("pageManagement",pDTO);
			return "admin/deliveryManagement";
			
		}
	}
	@PostMapping(value="deleteDelivery")
	public String deleteDelivery(
			@RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
			@RequestParam(name = "amount", defaultValue = "10") Integer amount,
			@RequestParam(name = "deliverySort")String deliverySort,
			@RequestParam(name="keyword")String keyword,
			@RequestParam(name="id")String delivery_id,
			Model model		
			) {
		log.info(pageNum);
		log.info(deliverySort);
		log.info(keyword);
		log.info(delivery_id);
		
		int result = adminservice.deleteOrders(delivery_id);
		log.info("오더"+result+"개 삭제");
		int result2 = adminservice.deleteDelivery(delivery_id);
		log.info("딜리버리"+result2+"개 삭제");
		if(keyword.length()>0&&deliverySort.length()>0) {
			
			int total = adminservice.deliveryKeywordSearchTotal(deliverySort, keyword);
			AdminCriteria cri = new AdminCriteria(pageNum, amount);
			List<deliveryDTO> dDTO = adminservice.deliveryKeywordSearch(deliverySort, keyword, cri);
			AdminPageDTO pDTO = new AdminPageDTO(cri, total);
			 model.addAttribute("deliverySort",deliverySort);
			 model.addAttribute("keyword",keyword);
			 model.addAttribute("deliveryList",dDTO);
		      model.addAttribute("pageManagement",pDTO);
			return "admin/deliveryManagement";
			
			}else {
				
				int total = adminservice.deliveryTotal();
				AdminCriteria cri = new AdminCriteria(pageNum, amount);
				List<deliveryDTO> dDTO = adminservice.deliveryList(cri);
				 AdminPageDTO pDTO = new AdminPageDTO(cri, total);
				 model.addAttribute("deliveryList",dDTO);
			      model.addAttribute("pageManagement",pDTO);
				return "admin/deliveryManagement";
				
			}
	}
	

	@GetMapping(value="/deliveryDetail/")
	@ResponseBody
	public List<deliveryDTO> deliveryDetail(
			@RequestParam(name="id") String id
			) {
		log.info("deliveryID : "+id);
		List<deliveryDTO> dDTO = adminservice.getordersById(id);
		
		log.info(dDTO);
		
		return dDTO;
	}
	   

}
   