package org.team.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product/*")
@Log4j
public class ProductController {
	@GetMapping("/productList")
	public void list(Model model) {
		log.info("상품 리스트 페이지");
	}
	@GetMapping("/productDetail")
	public void detail(Model model) {
		log.info("상품 디테일 페이지");
	}

}
