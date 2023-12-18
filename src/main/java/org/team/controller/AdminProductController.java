package org.team.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.team.domain.Criteria;
import org.team.domain.PageDTO;
import org.team.domain.ProductVO;
import org.team.service.AdminProductService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/product/*")
@Log4j
public class AdminProductController {
	@Setter(onMethod_ = @Autowired)
	private AdminProductService service;

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
	@GetMapping(value = "/productModifyForm")
	public void productModifyForm(@RequestParam(name = "id") int product_id, Model model) {
		ProductVO vo = service.detail(product_id);
		model.addAttribute("product", vo);
	}
	@GetMapping(value = "/productRegisterForm")
	public void productRegisterForm() {
		
	}
	
	@PostMapping("/productRegister")
	public String register(@RequestParam MultipartFile file,
			@ModelAttribute ProductVO pVo) {   
		// 로그 추가
	    log.info("file: " + file);

	    if (!file.isEmpty()) {
	        String uploadFolder = "D:/sourceTree/project_1/src/main/webapp/resources/images/products" + pVo.getCategory_id();
	        File saveFile = new File(uploadFolder, file.getOriginalFilename());

	        try {
	            file.transferTo(saveFile);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    service.register(pVo);
	    return "redirect:/admin/product/productList?category_id=0";
	}



	
	@PostMapping(value = "/productUpdate")
	public String update(@RequestParam MultipartFile file,@ModelAttribute ProductVO pVo) {
		  if (!file.isEmpty()) {
		        String uploadFolder = "C:/Users/Admin/Desktop/1st_project/src/main/webapp/resources/images/products/" + pVo.getCategory_id();
		        File saveFile = new File(uploadFolder, file.getOriginalFilename());

		        try {
		            file.transferTo(saveFile);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
		
		service.update(pVo);
		return "redirect:/admin/product/productManagement";
	}
	@PostMapping(value = "/productDelete")
	public String delete(@RequestParam(name = "product_id")int pVo) {
		service.delete(pVo);
		return "redirect:/admin/product/productManagement";
	}
	
	@GetMapping(value= "/productManagement")
	public void productManagement(
			@RequestParam(name = "color_id", required = false) String color_id,
			@RequestParam(name = "size_id", required = false) String size_id,
			@RequestParam(name = "sort", defaultValue = "asc") String sort,
			@RequestParam(name = "pageStart", defaultValue = "1") Integer pageStart,
			@RequestParam(name = "row", defaultValue = "0",required = false) Integer row,
			@RequestParam(name = "high", defaultValue = "500000",required = false) Integer high,
			@RequestParam(name = "keyword", defaultValue = "") String keyword, Model model) {
		ProductVO vo = new ProductVO();
		
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

		Criteria cri = new Criteria(pageStart,10,keyword);
		List<ProductVO> list = service.getList(vo,cri,sort,row,high);
		int total = service.getTotal(vo,cri,sort,row,high);
		PageDTO pDto = new PageDTO(cri, total);
		model.addAttribute("product", list);
		model.addAttribute("pageMaker", pDto);
	}
}