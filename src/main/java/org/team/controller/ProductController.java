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
	public void selectList(
			@RequestParam(name = "category_id",required = false) String category_id,
			@RequestParam(name = "color_id", defaultValue = "1") String color_id, 
			@RequestParam(name = "size_id", defaultValue = "1") String size_id,
			@RequestParam(name = "sort",defaultValue = "asc") String sort,
			@RequestParam(name = "pageStart", defaultValue = "1") Integer pageStart ,
			@RequestParam(name = "row" ,defaultValue = "0")Integer row,
			@RequestParam(name = "high", defaultValue = "500000") Integer high,
			@RequestParam(name="keyword", defaultValue = "") String keyword,
			Model model) {
		
		PageDTO pDto = null;
		int total = 0;
		if(category_id.equals("0")) {
			Criteria cri = new Criteria(pageStart,8,keyword);
			List<ProductVO> list = service.getList(cri);
			total = service.getTotal();
			pDto = new PageDTO(cri, total);
			model.addAttribute("product", list);
			model.addAttribute("pageMaker", pDto);
			log.info("상품 리스트 페이지");
		}else {
			ProductVO vo = new ProductVO();
			vo.setCategory_id(category_id);
			vo.setColor_id(color_id);
			vo.setSize_id(size_id);
	
			Criteria cri = new Criteria(pageStart,8,keyword); 
			total = service.selectTotal(vo, cri, sort, row, high);
			
			pDto = new PageDTO(cri, total);
			
			List<ProductVO> list = service.selectList(vo,cri,sort,row, high);
			model.addAttribute("product", list);
			model.addAttribute("pageMaker", pDto);
			
			log.info(category_id + "번 상품 리스트 페이지");
			log.info(color_id + " : 색상");
			log.info(size_id + " : 사이즈");
			log.info(sort + " : 정렬 순서");
			log.info("row price : " + row);
			log.info("high price : " + high);
		}
	}

	@GetMapping("/productDetail")
	public void detail(Model model) {
		log.info("상품 디테일 페이지");
	}

}
