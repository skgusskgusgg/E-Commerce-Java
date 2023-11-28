package org.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.team.domain.ProductVO;
import org.team.join.MemberDTO;
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
	
	@PostMapping(value = "/postWish",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	//public ResponseEntity<String> postWish(@RequestBody ProductVO pVo, HttpSession session){
	public ResponseEntity<String> postWish(@RequestBody ProductVO pVo){	
	log.info("post wish : " + pVo.getProduct_name());
		//MemberDTO mDto = (MemberDTO)session.getAttribute("mVO");
		MemberDTO mDto = new MemberDTO();
		mDto.setId(2);
		/*
		 * if (mDto == null) { // 로그인 정보가 없는 경우 처리 log.warn("User not logged in.");
		 * return new ResponseEntity<>(HttpStatus.UNAUTHORIZED); }
		 */
		int result = service.postWish(pVo, mDto);
		
		return result == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
							: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/deleteWish",
					produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> deleteWish(@RequestBody ProductVO pVo, HttpSession session){
	public ResponseEntity<String> deleteWish(@RequestBody ProductVO pVo){
		// MemberDTO mDto =(MemberDTO) session.getAttribute("mVO");
		MemberDTO mDto = new MemberDTO();
		mDto.setId(2);
		/*
		 * if (mDto == null) { // 로그인 정보가 없는 경우 처리 log.warn("User not logged in.");
		 * return new ResponseEntity<>(HttpStatus.UNAUTHORIZED); }
		 */
		
		int result = service.deleteWish(pVo, mDto);
		
		return result == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
							: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
