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
import org.team.domain.Criteria;
import org.team.domain.PageDTO;
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
	public void selectList(@RequestParam(name = "category_id", required = false) String category_id,
			@RequestParam(name = "color_id", required = false) String color_id,
			@RequestParam(name = "size_id", required = false) String size_id,
			@RequestParam(name = "sort", defaultValue = "asc") String sort,
			@RequestParam(name = "pageStart", defaultValue = "1") Integer pageStart,
			@RequestParam(name = "row", defaultValue = "0",required = false) Integer row,
			@RequestParam(name = "high", defaultValue = "500000",required = false) Integer high,
			@RequestParam(name = "keyword", defaultValue = "") String keyword, Model model) {

		PageDTO pDto = null;
		int total = 0;
		ProductVO vo = new ProductVO();
		if (category_id == null || category_id.equals("0")) {
			
			
			if (color_id != null && !color_id.isEmpty()) {
				vo.setColor_id(color_id);
			}else {
				vo.setColor_id("99");
			}
			
			if (size_id != null && !size_id.isEmpty()) {
				vo.setSize_id(size_id);
			}else {
				vo.setSize_id("99");
			}
			Criteria cri = new Criteria(pageStart, 8, keyword);
			List<ProductVO> list = service.getList(vo,cri,sort,row,high);
			total = service.getTotal(vo, cri, sort, row, high);
			pDto = new PageDTO(cri, total);
			
			model.addAttribute("product", list);
			model.addAttribute("pageMaker", pDto);
			log.info("상품 리스트 페이지");
			log.info("keyword : " + keyword);
		} else {
			
			vo.setCategory_id(category_id);

			if (color_id != null && !color_id.isEmpty()) {
				vo.setColor_id(color_id);
			}else {
				vo.setColor_id("99");
			}
			
			if (size_id != null && !size_id.isEmpty()) {
				vo.setSize_id(size_id);
			}else {
				vo.setSize_id("99");
			}

			Criteria cri = new Criteria(pageStart, 8, keyword);
			total = service.selectTotal(vo, cri, sort, row, high);

			pDto = new PageDTO(cri, total);

			List<ProductVO> list = service.selectList(vo, cri, sort, row, high);
			model.addAttribute("product", list);
			model.addAttribute("pageMaker", pDto);

		}
	}

	@GetMapping(value = "/productDetail")
	public void detail(@RequestParam(name = "id") int product_id, Model model) {
		ProductVO vo = service.detail(product_id);
		
		
		model.addAttribute("product", vo);
		
		log.info("상품 디테일 페이지 : " + vo);
	}

}
