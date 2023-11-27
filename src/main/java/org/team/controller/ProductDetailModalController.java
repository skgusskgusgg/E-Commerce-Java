package org.team.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.team.domain.ProductVO;
import org.team.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RestController
@RequestMapping("/productDetail")
@Log4j
@AllArgsConstructor
public class ProductDetailModalController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@GetMapping(value = "/productDetailModal/{product_id}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ProductVO> detailModal(@PathVariable("product_id") int product_id){
		log.info("modal item : "  + product_id);

		return new ResponseEntity<>(service.detail(product_id),HttpStatus.OK);
	}
	
}
