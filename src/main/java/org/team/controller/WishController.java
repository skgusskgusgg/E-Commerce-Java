package org.team.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/wish/*")
@Log4j
@AllArgsConstructor
public class WishController {
	@GetMapping(value =  "/wishList",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE					
			})
	public ResponseEntity<List<WishItem>> wish() {
		log.info("위시리스트 페이지");
	
		return new ResponseEntity<List<WishItem>>(getWithListData(),HttpStatus.OK);
	}
	// 이건 나중에 service에서 직접 데이터를 가져올거임
	// 그냥 예시 
	private List<WishItem> getWithListData(){
		List<WishItem> wishList = new ArrayList<WishItem>();
		 wishList.add(new WishItem("White Shirt Pleat", "$19.00", "/resources/images/item-cart-01.jpg"));
	        wishList.add(new WishItem("Converse All Star", "$39.00", "/resources/images/item-cart-02.jpg"));
	        wishList.add(new WishItem("Nixon Porter Leather", "$17.00", "/resources/images/item-cart-03.jpg"));
		return wishList;
	}
	@Data
	public static class WishItem{
		private String name;
		private String price;
		private String imagePath;
		
		public WishItem(String name, String price, String imagePath) {
			this.name = name;
			this.price = price;
			this.imagePath = imagePath;
		}
	}
}
