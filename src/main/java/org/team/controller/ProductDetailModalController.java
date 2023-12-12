package org.team.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.team.domain.AddProducts;
import org.team.domain.ProductDetailResponse;
import org.team.domain.ProductVO;

import org.team.member.MemberVO;
import org.team.service.ProductService;

import lombok.AllArgsConstructor;

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
	public ResponseEntity<ProductDetailResponse> detailModal(@PathVariable("product_id") int product_id){
		log.info("modal item : "  + product_id);
		ProductVO pVo = service.detail(product_id);
		
		ProductDetailResponse response = new ProductDetailResponse();
		response.setProductDetail(pVo);
		response.setSizeTotal(service.sizeTotal(pVo));
		response.setColorTotal(service.colorTotal(pVo));

		return new ResponseEntity<>(response,HttpStatus.OK);
	}

	
	@GetMapping(value = "/checkWishStatus/{product_id}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> checkWishStatus(@PathVariable("product_id") int product_id, HttpSession session) {
	     MemberVO memberVo = (MemberVO) session.getAttribute("mVO");

        if (memberVo == null) {
            // 로그인 정보가 없는 경우
            return new ResponseEntity<>("unauthenticated", HttpStatus.OK);
        }

        int userId = memberVo.getId();

        // 위시리스트에 아이템이 있는지 확인
        boolean existsInWishlist = service.countWish(product_id, userId);

        return existsInWishlist ? new ResponseEntity<>("exists", HttpStatus.OK)
                                : new ResponseEntity<>("notExists", HttpStatus.OK);
    }
	
	
	@DeleteMapping(value = "/deleteWish",
					produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteWish(@RequestBody ProductVO pVo, HttpSession session){
	
		MemberVO memberVo =(MemberVO) session.getAttribute("mVO");
		int userId = memberVo.getId();
		
		log.info("delete wish : " + pVo.getProduct_name());	
		log.info("user : " +  userId);
		
		if (userId == 0) { 
			 // 로그인 정보가 없는 경우 처리 log.warn("User not logged in.");
			 return new ResponseEntity<>(HttpStatus.UNAUTHORIZED); 
		 }
		
		int result = service.deleteWish(pVo, userId);
		
		return result == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
							: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value = "/postCart",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> postCart(@RequestBody AddProducts aVo, HttpSession session){

		MemberVO memberVo = (MemberVO)session.getAttribute("mVO");
		
		ProductVO pVo = new ProductVO();
		pVo.setProduct_name(aVo.getProduct().getProduct_name());
		pVo.setSize_id(aVo.getProduct().getSize_id());
		pVo.setColor_id(aVo.getProduct().getColor_id());
	
		int userId = memberVo.getId();
		
		log.info("post Cart : " + aVo.getProduct().getProduct_name());	
		log.info("user : " +  userId);
		
		
		 if (userId == 0) { 
			 // 로그인 정보가 없는 경우 처리 
			 log.warn("User not logged in.");
			 return new ResponseEntity<>(HttpStatus.UNAUTHORIZED); 
		 }
		 
		 int checkProduct = service.checkCartProduct(pVo, userId);
		 int count = aVo.getCount();
		 
		 if(checkProduct > 0) {
			 service.updateCart(pVo, count, userId);
			 return new ResponseEntity<String>("update", HttpStatus.OK);
		 }else {
			service.postCart(aVo, userId);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
	}
	
	@PostMapping(value = "/postWish",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> postWish(@RequestBody AddProducts aVo, HttpSession session){

		MemberVO memberVo = (MemberVO)session.getAttribute("mVO");
		
		ProductVO pVo = new ProductVO();
		pVo.setProduct_name(aVo.getProduct().getProduct_name());
		pVo.setSize_id(aVo.getProduct().getSize_id());
		pVo.setColor_id(aVo.getProduct().getColor_id());
	
		int userId = memberVo.getId();
		
		log.info("post wish : " + aVo.getProduct().getProduct_name());	
		log.info("user : " +  userId);

		
		 if (userId == 0) { 
			 // 로그인 정보가 없는 경우 처리 log.warn("User not logged in.");
			 return new ResponseEntity<>(HttpStatus.UNAUTHORIZED); 
		 }
		 
		 int checkProduct = service.checkWishProduct(pVo, userId);
		 int count = aVo.getCount();
		 
		 if(checkProduct > 0) {
			 service.updateWish(pVo, count, userId);
			 return new ResponseEntity<String>("update", HttpStatus.OK);
		 }else {
			service.postWish(aVo, userId);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		 
	}
	
}
