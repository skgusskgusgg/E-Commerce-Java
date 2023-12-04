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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.team.domain.AddProducts;
import org.team.domain.ProductVO;
import org.team.member.MemberVO;
import org.team.service.WishService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/wish/*")
@Log4j
@AllArgsConstructor
public class WishController {
	
	@Setter(onMethod_ = @Autowired)
	private WishService service;
	
	@GetMapping(value =  "/wishList",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE					
			})
	public ResponseEntity<List<ProductVO>> getWishList(HttpSession session) {
		log.info("위시리스트 페이지");
		MemberVO memberVO = (MemberVO)session.getAttribute("mVO");
		return new ResponseEntity<List<ProductVO>>(service.getWishList(memberVO.getId()),HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/deleteWishList",
					produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteWishList(@RequestBody List<Integer> pVo, HttpSession session){
		
		MemberVO mVo = (MemberVO)session.getAttribute("mVO");
		log.info("pVo: " + pVo);
		if(mVo.getId() == 0) {
			return new ResponseEntity<String>(HttpStatus.UNAUTHORIZED);
		}
		int result = service.deleteWish(pVo, mVo.getId());
		
		return result == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
							: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@PostMapping(value = "/addCart",
					consumes = "application/json",
					produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> addCart(@RequestBody List<AddProducts> aVo, HttpSession session){
		MemberVO mVo = (MemberVO)session.getAttribute("mVO");
		log.info(aVo);
		if(mVo.getId() == 0) {
			return new ResponseEntity<String>(HttpStatus.UNAUTHORIZED);
		}
		try {
			service.addCart(aVo, mVo.getId());
			return new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (DuplicateKeyException e) {
			return new ResponseEntity<String>("Duplicate key update",HttpStatus.CONFLICT);
		}catch (Exception e) {
			return new ResponseEntity<String>("Internal server error", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	@GetMapping(value = "/wishTotal",produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE					
	})
	public ResponseEntity<Integer> wishTotal(HttpSession session){
		MemberVO mVo = (MemberVO) session.getAttribute("mVO");
		log.info("success wishTotal");
		return new ResponseEntity<Integer>(service.wishTotal(mVo.getId()),HttpStatus.OK);
		
	}
	
	@GetMapping(value = "/cartTotal", produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<Integer> cartTotal(HttpSession session){
		MemberVO mVo = (MemberVO) session.getAttribute("mVO");
		log.info("success cartTotal");
		return new ResponseEntity<Integer>(service.cartTotal(mVo.getId()),HttpStatus.OK);
	}
}
