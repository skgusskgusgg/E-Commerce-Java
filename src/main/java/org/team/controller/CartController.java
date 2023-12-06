package org.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team.cart.CartVO;
import org.team.member.MemberVO;
import org.team.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart/*")
@Log4j
@AllArgsConstructor
public class CartController {
	
	private CartService service;
	
	@GetMapping("/cartList")
    public String getCartList(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO)session.getAttribute("mVO");
		if (mVO != null) {
		    int memberId = mVO.getId();
		    
            model.addAttribute("member_id", memberId);
            model.addAttribute("cartList", getCartListService(memberId));
            
            return "/cart/cartList";
        }
		 return "redirect:/";
    }
	
	public List<Map<String, Object>> getCartListService(int member_id){
		List<CartVO> cartListResult = service.getCartList(member_id);
        List<Map<String, Object>> resultAsMapList = new ArrayList<>();
        
        for (CartVO cart : cartListResult) {
            Map<String, Object> cartMap = new HashMap<>();
            cartMap.put("cart_id", cart.getCart_id());
            cartMap.put("member_id", cart.getMember_id());
            cartMap.put("product_id", cart.getProduct_id());
            cartMap.put("count", cart.getCount());
            cartMap.put("product_name", cart.getProduct_name());
            cartMap.put("price", cart.getPrice());
            cartMap.put("img", cart.getImg());
            cartMap.put("color_id", cart.getColor_id());
            cartMap.put("size_id", cart.getSize_id());

            resultAsMapList.add(cartMap);
        }
		return resultAsMapList;
	}
	
	@GetMapping("/headerIcon")
    public ResponseEntity<?> getCartCount(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO)session.getAttribute("mVO");
		HttpHeaders headers = new HttpHeaders();
		String message = "";
		if (mVO != null) {
		    int memberId = mVO.getId();
		    message=Integer.toString(service.getCartCount(memberId));

            return new ResponseEntity<>(message,headers, HttpStatus.OK);
        }
		message="fail";
		return new ResponseEntity<>(message,headers, HttpStatus.OK);
    }
	
	@PostMapping(value = "/delete")
	public ResponseEntity<?> delete(@RequestParam("cartSelectList") List<String> cartSelectList,
    						@RequestParam("memberId") Integer memberId,
    						HttpSession session) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		MemberVO mVO = (MemberVO)session.getAttribute("mVO");
		if(mVO.getId()==memberId) {
            service.deleteCartList(cartSelectList);
            
            headers.add("Location", "/cart/cartList");
            return new ResponseEntity<>(headers, HttpStatus.OK);
        }
		headers.add("Location", "/");
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }
	
	@PostMapping(value = "/update")
	public ResponseEntity<?> update(@RequestParam("numProduct") String productAmount,
							@RequestParam("cart_id") String cart_id,
    						HttpSession session) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		MemberVO mVO = (MemberVO)session.getAttribute("mVO");
		if(mVO.getId()!=null) {
			String memberId = Integer.toString(mVO.getId());
			Map<String, String> amountMap = new HashMap<>();
			amountMap.put("member_id",memberId);
			amountMap.put("cart_id",cart_id);
			amountMap.put("productAmount",productAmount);
            service.updateCartAmount(amountMap);
            List<Map<String,Object>> message = getCartListService(mVO.getId());
            return new ResponseEntity<>(message,headers, HttpStatus.OK);
        }
		headers.add("Location", "/");
        return new ResponseEntity<>(null,headers, HttpStatus.NOT_FOUND);
    }
}
