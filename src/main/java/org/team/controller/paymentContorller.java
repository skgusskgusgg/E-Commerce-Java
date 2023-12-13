package org.team.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.team.cart.CartVO;
import org.team.domain.DeliveryVO;
import org.team.domain.OrderVO;
import org.team.domain.PaymentInfoVO;
import org.team.domain.PaymentVO;
import org.team.member.MemberVO;
import org.team.service.CartService;
import org.team.service.DeliveryService;
import org.team.service.POrderService;
import org.team.service.PaymentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/payment/*")
@Log4j
public class paymentContorller {

	private CartService cService;
	private DeliveryService dService;
	private POrderService oService;
	private PaymentService pService;
	
	@GetMapping("/payment")
    public String getCartList(HttpSession session, Model model) {
		MemberVO mVO = (MemberVO)session.getAttribute("mVO");
		if (mVO != null) {
		    int memberId = mVO.getId();
		    
		    model.addAttribute("memberInfo", getMemberInfo(mVO));
            model.addAttribute("cartList", getCartListService(memberId));
            
            return "/payment/payment";
        }
		return "redirect:/";
    }
	public Map<String, Object> getMemberInfo(MemberVO mVO){
		Integer memberId = mVO.getId();
		String memberUser_name = mVO.getUser_name();
	    String memberEmail = mVO.getEmail();
	    String memberAddress = mVO.getAddress();
	    Integer memberGender = mVO.getGender();
	    String memberPhone = mVO.getPhone();
	    double memberPoint = mVO.getPoint();
	    
	    DecimalFormat decimalFormat = new DecimalFormat("0");
	    String formattedNumber = decimalFormat.format(memberPoint);
	    
		Map<String, Object> resultAsMap = new HashMap<>();
		resultAsMap.put("member_id", memberId);
		resultAsMap.put("member_user_name", memberUser_name);
        resultAsMap.put("member_email", memberEmail);
        resultAsMap.put("member_address", memberAddress);
        resultAsMap.put("member_gender", memberGender);
        resultAsMap.put("member_phone", memberPhone);
        resultAsMap.put("member_point", formattedNumber);

		return resultAsMap;
	}
	
	public List<Map<String, Object>> getCartListService(int member_id){
		List<CartVO> cartListResult = cService.getCartList(member_id);
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
	@PostMapping(path = "/paymentSubmit", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getpaymentSubmit(@RequestBody PaymentInfoVO paymentInfo,
    								HttpSession session) {
		
		MemberVO mVO = (MemberVO)session.getAttribute("mVO");
		int mVOId = mVO.getId();
		int	paymentInfoId = paymentInfo.getMemberId();
		
		String message = "";
		HttpHeaders headers = new HttpHeaders();
		
		if (mVOId == paymentInfoId) {
			PaymentVO pVO = setPVO(paymentInfo);
			pService.updatePoint(paymentInfo);
			pVO = pService.insertPayment(pVO);
			DeliveryVO dVO = setDVO(paymentInfo,pVO);
			dVO = dService.insertDelivery(dVO);
			List<OrderVO> oVOList = setOVOList(dVO);
			oService.insertOrder(oVOList);
			cService.deleteCurrentCart(paymentInfoId);

			headers.add("Location", "/payment/paymentResult");
            return new ResponseEntity<>(message,headers, HttpStatus.OK);
        }
		headers.add("Location", "/");
		return new ResponseEntity<>(message,headers, HttpStatus.NOT_FOUND);
    }
	
	public PaymentVO setPVO(PaymentInfoVO paymentInfo) {
		PaymentVO pVO = new PaymentVO();
		pVO.setMember_id(paymentInfo.getMemberId());
		pVO.setTotal_price(paymentInfo.getTotalpaymentAmount());
		if(paymentInfo.getPaymentMethod().equals("point")) {
			pVO.setPayment_method("1");
		}else if(paymentInfo.getPaymentMethod().equals("creditCard")){
			pVO.setPayment_method("2");
		}else if(paymentInfo.getPaymentMethod().equals("bankTransfer")){
			pVO.setPayment_method("3");
		}else if(paymentInfo.getPaymentMethod().equals("naverpay")){
			pVO.setPayment_method("4");
		}else if(paymentInfo.getPaymentMethod().equals("kakaopay")){
			pVO.setPayment_method("5");
		}
		pVO.setPoint(paymentInfo.getUsePoint());
		pVO.setCanceled(1);
		return pVO;
	}
	
	public DeliveryVO setDVO(PaymentInfoVO paymentInfo,PaymentVO pVO) {
		DeliveryVO dVO = new DeliveryVO();
		dVO.setMember_id(paymentInfo.getMemberId());
		dVO.setPayment_id(pVO.getPayment_id());
		dVO.setTotal_status("1");
		dVO.setAddress(paymentInfo.getRoadAddr());
		dVO.setExtraAddress(paymentInfo.getExtraAddress());;
		dVO.setZipcode(paymentInfo.getPostCode());
		return dVO;
	}

	public List<OrderVO> setOVOList(DeliveryVO dVO) {
		List<CartVO> cartListResult = cService.getCartList(dVO.getMember_id());
		List<OrderVO> orderListResult = new ArrayList<>();
        for (CartVO cVO : cartListResult) {
		OrderVO oVO = new OrderVO();
		oVO.setDelivery_id(dVO.getDelivery_id());
		oVO.setProduct_id(cVO.getProduct_id());
		oVO.setProduct_count(cVO.getCount());
		oVO.setPrice(cVO.getPrice());
		oVO.setStatus("1");
		orderListResult.add(oVO);
        }
		return orderListResult;
	}
	
	@GetMapping("/paymentResult")
    public String getCartList(HttpSession session) {
		MemberVO mVO = (MemberVO)session.getAttribute("mVO");
		if (mVO != null) {
            
            return "/payment/paymentResult";
        }
		return "redirect:/";
    }
}
