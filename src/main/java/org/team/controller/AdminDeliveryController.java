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
@RequestMapping("/admin/deliveryManagement")
@Log4j
public class AdminDeliveryController {
	
	@Autowired
	private AdminService adminservice;
	
	@GetMapping(value= {"/","","deliveryManagement"})
	public void deliveryManagement(
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
	}


	   

}
   