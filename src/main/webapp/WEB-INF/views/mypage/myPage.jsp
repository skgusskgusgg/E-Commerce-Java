<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
	style="background-image: url('/resources/images/bg-02.jpg');">
	<h2 class="ltext-105 cl0 txt-center">My Page</h2>

</section>



<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row" style="width: 100%">
			<div style="width: 100%">
				<div class="p-r-0-lg">
					<!-- My Page -->
					<div class="mypage-wrap">
						     
						<ul>
							<li class="p-b-80">
								<h2>MY PAGE</h2>
							</li>
							<li  style="padding: 10px 0; background-color:#717fe0;color: #fff; padding-left: 5px; box-sizing: border-box; text-align: left;">
								Order processing status
							</li>
						</ul>
						
						<div class="mypage-order">

							<ul style="display: flex; justify-content: space-around;">
								<li>
										<strong style=" margin-bottom: 5px; display: inline-block;">배송준비중</strong> <P><span> <span>${dP}</span>
									</span></P>
							
								</li>
								<li>
										<strong style=" margin-bottom: 5px; display: inline-block;" >배송중</strong><P> <span> <span>${dI}</span>
									</span></P>
								</li>
								<li>
										<strong style=" margin-bottom: 5px; display: inline-block;" >배송완료</strong> <P><span> <span>${dC}</span>
									</span></P>
								</li>
								
							</ul>
						</div>

						<div class="mypage-benefit">
							<ul class="mypage-benefit-left">
								
								<li >적립금</li>
							</ul>
							<ul class="mypage-benefit-right">
								

								<li><P>${mVO.point}</P></li>
							</ul>
						</div>
						<div class="mypage-sub-menu">
							<ul>
								<li class="hov-btn3 trans-04 ">
								<a href="orderTracking?id=${mVO.id}"
									class="js-show-modal-Orderhistory"> <span>Order Tracking</span>주문내역
										조회
								</a></li>
								<li class="hov-btn3 trans-04"><a href="#"
									class="js-show-modal-modify"> <span>Profile</span>회원 정보
								</a></li>
							
								<li class="hov-btn3 trans-04"><a href="#"
									class="js-show-cart"> <span>Wishlist</span>관심상품
								</a></li>
								<li class="hov-btn3 trans-04"><a href="/mypage/replyManagement"
									class="js-show-cart"> <span>Reply</span>리뷰관리
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	

	
	

	<!-- Modal Profile -->
	<div class="wrap-modal-login js-modal-modify p-t-60 p-b-20">
		<div class="overlay-modal-login js-hide-modal-modify"></div>

		<div id="modalContainer">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-modify">
					<img src="/resources/images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="authincation h-100">
				
					<div class="container-fluid h-100">
					
						<div class="row justify-content-center h-100 align-items-center">
						
							<div>
							
								<div class="authincation-content">
								
									<div class="row no-gutters">
									
										<div class="col-xl-12">
										
											<div class="auth-form">
												<h4 class="text-center mb-4">프로필수정</h4>
												
													<form action="memberUpdate" id="memberUpdateForm"
													method="post" name="form369" accept-charset="UTF-8">

														<input type="hidden" value="${mVO.id }" name="id" id="id">
														<table class="tab02 how-pos3-parent">
															
															
															<tr>
																<td><label for="CurrentPassword" class="size-220">현재비밀번호:
																</label></td>
																<td><span class="currentPassword_input_re_1">v</span> <span
																class="currentPassword_input_re_2">x</span></td>
																<td colspan="2" class="bor19 size-219"><input
																class="stext-111 cl2 plh3 size-126 p-lr-18" type="password"
																id="CurrentPassword" name="CurrentPassword"
																placeholder="password *"></td>
															</tr>
															<tr>
																<td></td>
																<td colspan="2" style="font-size: 9px;">비밀번호 8자 이상
																	숫자,영어,특수문자 조합 해주세요</td>
															</tr>

															<tr>
																<td><label for="newPassword" class="size-220">새비밀번호:
																</label></td>
																<td><span class="password_input_re_1">v</span> <span
																class="password_input_re_2">x</span></td>
																<td colspan="1" class="bor19 size-100"><input
																class="stext-111 cl2 plh3 size-126 p-lr-18" type="password"
																id="newPassword" name="password"
																placeholder="password *"></td>
															</tr>
															<tr>
																<td><label for="newPassword2" class="size-220">비밀번호
																		확인: </label></td>
																<td><span class="password2_input_re_1">v</span> <span
																class="password2_input_re_2">x</span></td>
																<td colspan="1" class="bor19 size-100"><input
																class="stext-111 cl2 plh3 size-126 p-lr-18" type="password"
																id="newPassword2" name="newPassword2"
																placeholder="password check *"></td>
															</tr>
															

															<tr>
																<td><label for="newAddress" class="size-220">주소:
																</label></td>
																<td><span class="address_input_re_1">v</span> <span
																class="address_input_re_2">x</span></td>
																<td colspan="1" class="bor19 size-100"><input
																class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
																id="newAddress" name="address" value="${mVO.address }"
																readonly></td>
																
															</tr>
															<tr>
															<td colspan="2"></td>
															<td><input type="button" id="zipcode_btn"
																value="Address Search"
																class="flex-c-m  cl0  bg3 bor2 hov-btn3 p-lr-15 trans-04"></td>
															</tr>
														
															<tr>
																<td><label for="newPhone" class="size-220">휴대폰
																		번호: </label></td>
																<td><span class="phone_input_re_1">v</span> <span
																class="phone_input_re_2">x</span></td>
																<td colspan="1" class="bor19 size-100"><input
																class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
																id="newPhone" name="phone" value="${mVO.phone }"></td>
															</tr>
															
															
														</table>
														<div style="display: flex; justify-content: center">
															<button type="submit" id="submit_btn"
															class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
															style="position: relative; right: 0; display: block;">
																Update</button>
														</div>

													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>





</section>

<%@include file="../includes/footer.jsp"%>

<script>

var CurrentPasswordCheck = false;
var NewPassswordcheck = false;
var NewPasswordCheck2 = false;
var NewAddress = true;
var NewPhone = true;

    	
$('.js-hide-modal-Orderhistory').on('click', function() {
	$('.js-modal-Orderhistory').removeClass('show-modal-Orderhistory');
	  
});


// 개인정보 수정 모달 열고 닫기

$('.js-show-modal-modify').on('click', function(e) {
	e.preventDefault();
	$('.js-modal-modify').addClass('show-modal-modify');
});

$('.js-hide-modal-modify').on('click', function() {
	$('.js-modal-modify').removeClass('show-modal-modify');
});

// 주소 찾기 - 오픈에이피아이 
$("#zipcode_btn")
.on(
      "click",
      function() {
         window
               .open("openApiAddress",
                     "myWindow",
                     "width=500,height=300,resizable=no");

      });



//현재 비밀번호 중복 확인
$('#CurrentPassword').on("propertychange change key up paste input",
        function(){
     var CurrentPassword = $('#CurrentPassword').val();
     var id = $('#id').val();

     $.ajax({ // 아작스 시작
        type : "post",
        url : "passwordCheck",
        //async : false,
        //dataType : "json",
        data : {password : CurrentPassword, id : id},
        //cache : false,
        success : function(result){
           console.log("성공여부 : " + result);
           if(result != 'fail'){
              $('.currentPassword_input_re_1').css("display","inline-block"); //v
              $('.currentPassword_input_re_2').css("display", "none");       //x
              CurrentPasswordCheck = true;
           } else {
              $('.currentPassword_input_re_2').css("display","inline-block");    //v
              $('.currentPassword_input_re_1').css("display", "none");         //x
              
              CurrentPasswordCheck = false;
           }
        }
        
     });//아작스 종료
     
     
  }); //현재 비밀번호 중복 확인 종료    
    
  

// 뉴 패스워드1 유효성 시작
$('#newPassword').on("propertychange change key up paste input",
      
      function chkPW(){

          var pw = $("#newPassword").val();
          var num = pw.search(/[0-9]/g);
          var eng = pw.search(/[a-z]/ig);
          var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

          if(pw.length < 8 || pw.length > 20){
             $('.password_input_re_2').css("display","inline-block");
               $('.password_input_re_1').css("display", "none");
               NewPassswordcheck = false;
               
            
             }else if(pw.search(/\s/) != -1){
                $('.password_input_re_2').css("display","inline-block");
                  $('.password_input_re_1').css("display", "none");
                  NewPassswordcheck = false;
             
             }else if(num < 0 || eng < 0 || spe < 0 ){
                $('.password_input_re_2').css("display","inline-block");
                  $('.password_input_re_1').css("display", "none");
                  NewPassswordcheck = false;
             
             }else {
                $('.password_input_re_1').css("display","inline-block");
                  $('.password_input_re_2').css("display", "none");
                  NewPassswordcheck = true;
             }

   }); //뉴패스워드 1 유효성종료
   
   //뉴패스워드 2 유효성 시작
   $('#newPassword2').on("propertychange change key up paste input",
         function(){
         var password1 = $('#newPassword').val().trim();
         //console.log(password1);
         var password2 = $('#newPassword2').val().trim();
         //console.log(password2);
         
         if(password1==password2){
                        $('.password2_input_re_1').css("display","inline-block");
                        $('.password2_input_re_2').css("display", "none");      
                        NewPasswordCheck2 = true;
                        } else {
                           $('.password2_input_re_2').css("display","inline-block");
                           $('.password2_input_re_1').css("display", "none");
                           NewPasswordCheck2 = false;
                        }
          
      });//뉴패스워드 2 유효성 종료
      //휴대폰 번호 유효성 검사 (숫자온리)
      $('#newPhone').on("propertychange change key up paste input",
              function(){
              var phone = $('#newPhone').val();
              
              
              if(phone.length>9 && validatePhone(phone) ){
                 $('.phone_input_re_1').css("display","inline-block"); //v
                 $('.phone_input_re_2').css("display", "none");       //x
                 NewPhone = true;
              } else {
                    $('.phone_input_re_2').css("display","inline-block");
                    $('.phone_input_re_1').css("display", "none");
                    NewPhone = false;
                 }
               
           });//휴대폰 유효성 검사 종료
           
         //수정 전 최종 유효성 검사
           $('#submit_btn').on("click",
              function() {
           
              if ($("#newAddress ").val().length === 0) {
                  alert("주소를 입력하세요");
                  $('.address_input_re_2').css("display","inline-block");
                 $('.address_input_re_1').css("display", "none");   
                 NewAddress = false;
                 
                  return false;
                }
              if(!CurrentPasswordCheck){
                  console.log("CurrentPasswordCheck false");
               }
               if(!NewPassswordcheck){
                  console.log("NewPassswordcheck=false");
               }
               if(!NewPasswordCheck2){
                  console.log("NewPasswordCheck2=false");
               }
               if(!NewAddress){
                  console.log("NewAddress=false");
               }
               if(!NewPhone){
                  console.log("NewPhone=false");
               }
              

          
              if(CurrentPasswordCheck  && NewPassswordcheck  && NewPasswordCheck2  && NewAddress  && NewPhone){
                 alert("회원정보 수정 성공");
                 return true;
              }
              

              alert("회원정보 수정 실패");
               return false;
           }); // submit 유효성 검사 종료

//phone 숫자only 확인                  
function validatePhone(phone) {
     var re = /^\d+$/;
     return re.test(phone);
} // phone 숫자only 확인 종료
   
</script>
<style>
.tab02 {
	position: relative;
	border-collapse: separate;
	border-spacing: 10px 10px;
	display: flex;
	overflow-x: auto;
	width: 100%;
}


.show-modal-Orderhistory {
	visibility: visible;
	opacity: 1;
}

.show-modal-modify {
	visibility: visible;
	opacity: 1;
}
.currentPassword_input_re_1{
	color: green;
	display: none;
}
.currentPassword_input_re_2{
	color: red;
	display: none;
}

.password_input_re_1 {
	color: green;
	display: none;
}

.password_input_re_2 {
	color: red;
	display: none;
}

.password2_input_re_1 {
	color: green;
	display: none;
}

.password2_input_re_2 {
	color: red;
	display: none;
}

.address_input_re_1 {
	color: green;
	display: inline-block;
}

.address_input_re_2 {
	color: red;
	display: none;
}

.phone_input_re_1 {
	color: green;
	display: inline-block;
}

.phone_input_re_2 {
	color: red;
	display: none;
}

</style>
