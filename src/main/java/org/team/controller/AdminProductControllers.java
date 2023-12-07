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
@RequestMapping("/admin/*")
@Log4j
public class AdminProductControllers {
	@Autowired
	private AdminService adminservice;
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@GetMapping(value= {"/","","/productManagement/","productmanagement","productManagement/"})
	public String productManagement(
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
		return "admin/productManagement";

	}
	

}
