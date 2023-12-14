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
import org.team.delivery.deliveryDTO;
import org.team.join.MemberDTO;
import org.team.mypage.orderDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/orderManagement")
@Log4j
public class AdminOrderController {
	
	@Autowired
	private AdminService adminservice;
	
	@GetMapping(value= {"/","","orderManagement"})
	public void orderManagement(
			 @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
				@RequestParam(name = "amount", defaultValue = "10") Integer amount,
				Model model) {
		int total = adminservice.orderTotal();
		log.info(total);
		AdminCriteria cri = new AdminCriteria(pageNum, amount);
		List<orderDTO> oDTO = adminservice.orderList(cri);
		 AdminPageDTO pDTO = new AdminPageDTO(cri, total);
		 model.addAttribute("orderList",oDTO);
	      model.addAttribute("pageManagement",pDTO);
	}
	
	
	@RequestMapping(value="/deleteOrder/", method=RequestMethod.POST)
	public String deleteOrder(
			@RequestParam(name = "id") Integer id,
			@RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
			@RequestParam(name = "amount", defaultValue = "10") Integer amount,
			Model model) {
		
		int result = adminservice.deleteOrder(id);
		 log.info("result번호 : 오더 "+result+"개 지워짐");
		
		int total = adminservice.orderTotal();
		log.info(total);
		AdminCriteria cri = new AdminCriteria(pageNum, amount);
		List<orderDTO> oDTO = adminservice.orderList(cri);
		 AdminPageDTO pDTO = new AdminPageDTO(cri, total);
		 model.addAttribute("orderList",oDTO);
	      model.addAttribute("pageManagement",pDTO);
		
		return "/admin/orderManagement";
	}
	
	@RequestMapping(value="/modifyOrder/", method=RequestMethod.POST)
	public String modifyOrder(
			@RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
			@RequestParam(name = "amount", defaultValue = "10") Integer amount,
			orderDTO order,
			Model model) {
		// 오더 수정 부분
		
		log.info("orderDTO : " + order);
		int result = adminservice.modifyOrder(order);
		log.info("오더 수정은" + result + "개 수정됨");

		// 오더 수정 부분 끝

		Integer delivery_id = order.getDelivery_id();
		// 오더 가격 기준으로 딜리버리 토탈 가격 수정 부분
		int result2 = adminservice.updateDeliveryTotalPrice(delivery_id);
		log.info("딜리버리 수정은" + result2 + " 수정됨");
		int deliveryModifyResult = 0;
		// 토탈 가격 수정 끝
		
		//오더 배달상태 기준으로 딜리버리 토탈 배달상태 수정
			
			//배송전 숫자
			int dB = adminservice.deliveryPreparing(delivery_id);
			//배송중 숫자
			int dI = adminservice.deliveryIng(delivery_id);
			//배송완료 숫자
			int dA = adminservice.deliveryEnd(delivery_id);
			//확인
			log.info("배송전 : "+dB);
			log.info("배송중 : "+dI);
			log.info("배송후 : "+dA);
			
			//로직 구현
			if(dB>0&&dI==0&&dA==0) {
			log.info("전부 배송 전 상태");
			deliveryModifyResult = adminservice.totalDeliveryPre(delivery_id); //0
			}else if(dA>0&&dB==0&&dI==0){
			log.info("전부 배송 완료 상태");
			log.info("delivery 배송 2 으로 세팅하기");
			deliveryModifyResult = adminservice.totalDeliveryComplete(delivery_id); //2
			}else if(dI>0){
			log.info("배송중 상태 숫자 확인 : "+dI);
			log.info("delivery 배송 1 으로 세팅하기");	
			deliveryModifyResult = adminservice.totalDeliveryIng(delivery_id); //1
			}else {
				log.info("생각지 못한 변수! 애러 확인하기");
				log.info("배송중 상태 숫자 확인 : "+dI);
				deliveryModifyResult = adminservice.totalDeliveryIng(delivery_id); //1
				log.info("delivery 배송 1 으로 세팅하기");
			}
			
		//토탈 배달상태 수정 끝

		int total = adminservice.orderTotal();
		AdminCriteria cri = new AdminCriteria(pageNum, amount);
		List<orderDTO> oDTO = adminservice.orderList(cri);
		 AdminPageDTO pDTO = new AdminPageDTO(cri, total);
		 model.addAttribute("orderList",oDTO);
	      model.addAttribute("pageManagement",pDTO);
		
		return "/admin/orderManagement";
	}
	
	@GetMapping(value="/orderKeywordSearch/")
	public String orderKeywordSearch(
			 @RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, 
				@RequestParam(name = "amount", defaultValue = "10") Integer amount,
				@RequestParam(name = "orderSort") String orderSort,
				@RequestParam(name = "keyword") String keyword,
				Model model) {
		
		int total = adminservice.orderKeywordSearchTotal(orderSort, keyword);
		log.info("total : "+total);
		log.info("orderSort : "+orderSort);
		log.info("keyword : "+ keyword);
		AdminCriteria cri = new AdminCriteria(pageNum, amount);
		List<orderDTO> oDTO = adminservice.orderKeywordSearch(orderSort, keyword, cri);
		 AdminPageDTO pDTO = new AdminPageDTO(cri, total);
		 log.info("oDTO : "+oDTO);
		 model.addAttribute("orderSort",orderSort);
		 model.addAttribute("keyword",keyword);
		 model.addAttribute("orderList",oDTO);
	      model.addAttribute("pageManagement",pDTO);
		
		return "/admin/orderManagement";

	}
	
	@GetMapping(value="/orderDetail/")
	@ResponseBody
	public  deliveryDTO orderKeywordSearch(
			@RequestParam(name="id") String id
			) {
		log.info("deliveryID : "+id);
		deliveryDTO dDTO = adminservice.getDeliveryById(id);
		
		log.info(dDTO);
		
		return dDTO;
	}
	


}
