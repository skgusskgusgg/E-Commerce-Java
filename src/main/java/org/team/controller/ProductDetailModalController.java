package org.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.management.loading.PrivateClassLoader;

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
@RequestMapping("/productDetail/*")
@Log4j
@AllArgsConstructor
public class ProductDetailModalController {
	
	@GetMapping(value = "/productDetailModal",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ModalItem> detailModal(){
		log.info("modal item : " );

		return new ResponseEntity<ModalItem>(getModalItems(),HttpStatus.OK);
	}
	
	private ModalItem getModalItems(){
		List<String> imagePath = new ArrayList<String>();
		imagePath.add("/resources/images/product-detail-01.jpg");
		imagePath.add("/resources/images/product-detail-02.jpg");
		imagePath.add("/resources/images/product-detail-03.jpg");
		
		ModalItem modalItem = new ModalItem("밝고 가벼운 자켓","$58.79", imagePath);
	
		return modalItem;
	}
	
	@Data
	public static class ModalItem{
		private String name;
		private String price;
		private List<String> imagePath;
		
		public ModalItem(String name,String price, List<String>imagePath) {
			this.name = name;
			this.price = price;
			this.imagePath = imagePath;

		}
	}
}
