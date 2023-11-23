package org.team.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team.domain.ProductVO;
import org.team.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product/*")
@Log4j
public class ProductController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@GetMapping(value = "/productList")
	public void list(Model model) {
		List<ProductVO> list = service.getList();
		model.addAttribute("product",list);
		log.info("상품 리스트 페이지");
	}
	@GetMapping(value = "/productList",params = {"category_id"})
	public List<ProductVO> selectList(@RequestParam("category_id") String category_id, Model model) {
 
		List<ProductVO> list = service.selectList(category_id);
		model.addAttribute("product",list);
		log.info(category_id + "번 상품 리스트 페이지");
		return list;
	}
	@GetMapping("/productDetail")
	public void detail(Model model) {
		log.info("상품 디테일 페이지");
	}

}
