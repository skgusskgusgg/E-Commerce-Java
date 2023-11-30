<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
   .email_input_re_1{
      color : green;
      display : none;
      
   }
   /* 중복아이디 존재하는 경우 */
   .email_input_re_2{
      color : red;
      display : inline-block;
   
   }
   .password_input_re_1{
      color : green;
      display : none;
   }
   .password_input_re_2{
      color : red;
      display : inline-block;
   }
   .password2_input_re_1{
      color : green;
      display : none;
   }
   .password2_input_re_2{
      color : red;
      display : inline-block;
   }
   .name_input_re_1{
      color : green;
      display : none;
   }
   .name_input_re_2{
      color : red;
      display : inline-block;
   }
   .gender_input_re_1{
      color : green;
   }
   .address_input_re_1{
      color : green;
      display : none;
   }
   .address_input_re_2{
      color : red;
      display : inline-block;
   }
   .phone_input_re_1{
      color : green;
      display : none;
   }
   .phone_input_re_2{
      color : red;
      display : inline-block;
   }
   .birth_date_input_re_1{
      color : green;
      display : none;
   }
   .birth_date_input_re_2{
      color : red;
      display : inline-block;
   }
   
   
</style>
<!-- Content page -->
<section class="bg0 p-t-52 p-b-20">
   <div class="container">
      <div class="row" style="justify-content: center;">
         <div class="col-md-8 col-lg-9 p-b-80">
            <div class="p-r-0-lg">
               <!--  -->
               <div class="p-t-40">
                  <h5 class="mtext-113 cl2 p-b-12">Join us</h5>

                  <p class="stext-107 cl6 p-b-40">Your email address will not be
                     published. Required fields are marked *</p>

                  
                  <form action="register" id="register" method="post" name="frm1" accept-charset="UTF-8">
                  
                  <input type="hidden" id="id" name="id">
                  <input type="hidden" id="email" name="email">
                  <input type="hidden" id="join_date" name="join_date" value="now()">
                     <table class="tab02">
                        <tr>
                           <td><label for="email1" class="size-220">이메일: </label></td>
                           <td><span class="email_input_re_1">v</span>
                           <span class="email_input_re_2">x</span></td>
                           <td class="bor19 size-208"><input
                              class="stext-111 cl2 plh3 size-107 p-lr-18" type="text"
                              id="email1" name="email1" placeholder="email1 *"></td>
                           <td>@</td>
                           <td class="bor19 size-208"><input
                              class="stext-111 cl2 plh3 size-107 p-lr-18" type="text"
                              id="email2" name="email2" id="email2" placeholder="abc.com"></td>
                           <td class=" size-100"><select name="selectEmail" id="selectEmail"
                              class="stext-111 cl2 plh3  p-lr-18">
                                 <option value="">이메일 선택</option>
                                 <option value="naver.com">naver.com</option>
                                 <option value="google.com">google.com</option>
                                 <option value="hanmail.net">hanmail.net</option>
                                 <option value="nate.com">nate.com</option>
                           </select></td>
                     <!--       <td><input type="button" name="confirm_email" id="confirm_email"
                              value="Email Check"
                              class="flex-c-m  cl0  bg3 bor2 hov-btn3 p-lr-15 trans-04 js-register"></td>
                        </tr> -->
                        <tr>
                        <td colspan="2"></td><td colspan="4" style="font-size:10px;">비밀번호 8자 이상 숫자,영어,특수문자 조합 해주세요</td>
                        </tr>
                     
                        <tr>
                           <td ><label for="password" class="size-220">비밀번호: </label></td>
                           <td><span class="password_input_re_1">v</span>
                           <span class="password_input_re_2">x</span></td>
                           <td colspan="4" class="bor19 size-100"><input
                              class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
                              id="password" name="password" placeholder="password *"></td>
                        </tr>
                        <tr>
                           <td><label for="password2" class="size-220">비밀번호
                                 확인: </label></td>
                           <td><span class="password2_input_re_1">v</span>
                           <span class="password2_input_re_2">x</span></td>
                           <td colspan="4" class="bor19 size-100"><input
                              class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
                              id="password2" name="password2"
                              placeholder="password check *"></td>
                        </tr>
                        <tr>
                           <td><label for="user_name" class="size-220">이름: </label></td>
                           <td><span class="name_input_re_1">v</span>
                           <span class="name_input_re_2">x</span></td>
                           <td colspan="4" class="bor19 size-100"><input
                              class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
                              id="user_name" name="user_name" placeholder="name *"></td>
                        </tr>
                        <tr>
                           <td><label for="gender" class="size-220">성별: </label></td>
                           <td><span class="gender_input_re_1">v</span>
                           </td><td colspan="4" class="size-100">
                           <select name="gender" id="gender"
                              class="stext-111 cl2 plh3  p-lr-18">
                                 <option value=1>남자</option>
                                 <option value=2>여자</option>
                           </select></td>
                        </tr>
                        
                        <tr>
                           <td><label for="address" class="size-220">주소: </label></td>
                           <td><span class="address_input_re_1">v</span>
                           <span class="address_input_re_2">x</span></td>
                           <td colspan="4" class="bor19 size-100"><input
                              class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
                              id="address" name="address" placeholder="address *" value="" readonly></td>
                           <td><input type="button" id="zipcode_btn" value="Address Search"
                              class="flex-c-m  cl0  bg3 bor2 hov-btn3 p-lr-15 trans-04"></td>
                        </tr>
                        <!--<tr>
                           <td><input type="hidden" class="size-220"></td>
                           <td colspan="4" class="bor19 size-219"><input
                              class="stext-111 cl2 plh3 size-126 p-lr-18" type="text" id="address2"
                              name="address2" placeholder="detail *"></td>
                        </tr>-->
                        <tr>
                           <td><label for="phone" class="size-220">휴대폰
                                 번호: </label></td>
                           <td><span class="phone_input_re_1">v</span>
                           <span class="phone_input_re_2">x</span></td>
                           <td colspan="4" class="bor19 size-100"><input
                              class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
                              id="phone" name="phone"
                              placeholder="phone number (do not insert ' - ') *"></td>
                        </tr>
                        <tr>
                           <td><label for="birth_date" class="size-220">생년월일:
                           </label></td>
                           <td><span class="birth_date_input_re_1">v</span>
                           <span class="birth_date_input_re_2">x</span></td>
                           <td colspan="4" class="bor19 size-100"><input
                              class="stext-111 cl2 plh3 size-126 p-lr-18" type="date"
                              id="birth_date" name="birth_date"></td>
                        </tr>
                     <!--   <tr>
                           <td><label for="smsReceive" class="size-220">SMS
                                 receive: </label></td>
                           <td><input class="stext-111 cl2 plh3 size-216"
                              type="checkbox" id="smsReceive" name="smsReceive"></td>
                        </tr>
                        <tr>
                           <td><label for="emailReceive" class="size-220">Email
                                 receive: </label></td>
                           <td><input class="stext-111 cl2 plh3 size-216"
                              type="checkbox" id="emailReceive" name="emailReceive"></td>
                        </tr>-->
                     </table>
                     <div style="display: flex; justify-content: center">
                        <button type="submit" id="submit_btn"
                           class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
                           style="position: relative; right: 0; display: block;">
                           submit</button>
                     </div>

                  </form>
               </div>
            </div>
         </div>


      </div>
   </div>
</section>
<script>

var emailCheck = false;
var pwCheck = false;
var pwCheck2 = false;
var nameCheck = false;
var addressCheck = false;
var phoneCheck = false;
var birthdateCheck = false;



   $(document)
         .ready(
               function() {
                  $("#confirm_email")
                        .on(
                              "click",
                              
                              
                              function() {
                                 
                                 
                                 var email1 = $('#email1').val();
                                  var email2 = $('#email2').val();
                                  var email = email1 +"@"+ email2; // 변수명 수정
                                  if(email1===''||email2===''){
                                     alert("이메일을 입력해주세요.");
                                     return false;
                                  }

                                  var url = "emailCheck?email=" + email;
                                 window
                                       .open(url, "_black_1",
                                             "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
                              });

                        

                  $("#zipcode_btn")
                        .on(
                              "click",
                              function() {
                                 window
                                       .open("openApiAddress",
                                             "myWindow",
                                             "width=500,height=300,resizable=no");

                              });
                  
                  $('#selectEmail').change(function() {
                     
                      $('#selectEmail option:selected').each(function() {
                           var selectedEmail = $(this).val();
                           $('#email2').val(selectedEmail);
                           var email1 = $('#email1').val();
                        var email2 = $('#email2').val();
                        var email = email1+"@"+email2;
                        var data = {email : email}
                        //console.log(email);
                        //console.log(data);
                        $.ajax({
                           type : "post",
                           url : "emailCheck",
                           data : data,
                           success : function(result){
                              //console.log("성공여부 : " + result);
                              if(result != 'fail' && email1.length > 0 && email2.length > 0 && email2.includes('.')){
                                 $('.email_input_re_1').css("display","inline-block"); //v
                                 $('.email_input_re_2').css("display", "none");       //x
                                 emailCheck=true;
                              } else {
                                 $('.email_input_re_2').css("display","inline-block");
                                 $('.email_input_re_1').css("display", "none");
                                 emailCheck=false;
                              }
                           }
                           
                        });
                          
                       });
                   });
                  
               
                  $('#register').submit(function(event) {
                       event.preventDefault(); // 기본 제출 동작을 막습니다.

                     
                       var password = $('#password').val().trim();
                     
                       // 유효성 검사 - 사용자 이름과 이메일 필드가 비어 있는지 확인합니다.
                       if (password === '') {
                           alert('비밀번호를 입력하세요');
                           return false; // 제출을 막습니다.
                       }
                      

         
                       // 유효성 검사가 통과하면 폼을 제출합니다.
                       this.submit();
                   });
                  //이메일 중복 체크 1번 포맷
                  $('#email1').on("propertychange change key up paste input",
                  function(){
                     var email1 = $('#email1').val();
                     var email2 = $('#email2').val();
                     var email = email1+"@"+email2;
                     var data = {email : email}
                     //console.log(email);
                     //console.log(data);
                     $.ajax({
                        type : "post",
                        url : "emailCheck",
                        data : data,
                        success : function(result){
                           //console.log("성공여부 : " + result);
                           if(result != 'fail' && email1.length > 0 && email2.length > 0 && email2.includes('.')){
                              $('.email_input_re_1').css("display","inline-block"); //v
                              $('.email_input_re_2').css("display", "none");       //x
                              emailCheck=true;
                           } else {
                              $('.email_input_re_2').css("display","inline-block");
                              $('.email_input_re_1').css("display", "none");
                              emailCheck=false;
                           }
                        }
                        
                     });//아작스 종료
                     
                  }); 
                  //이메일 2번 포맷
                  $('#email2').on("propertychange change key up paste input",
                        function(){
                     var email1 = $('#email1').val();
                     var email2 = $('#email2').val();
                     var email = email1+"@"+email2;
                     var data = {email : email}
                     //console.log(email);
                     //console.log(data);
                     $.ajax({
                        type : "post",
                        url : "emailCheck",
                        data : data,
                        success : function(result){
                           //console.log("성공여부 : " + result);
                           if(result != 'fail' && email1.length > 0 && email2.length > 0 && email2.includes('.')){
                              $('.email_input_re_1').css("display","inline-block"); //v
                              $('.email_input_re_2').css("display", "none");       //x
                              emailCheck=true;
                           } else {
                              $('.email_input_re_2').css("display","inline-block");    //v
                              $('.email_input_re_1').css("display", "none");         //x
                              emailCheck=false;
                           }
                        }
                        
                     });//아작스 종료
                     
                     
                  }); //이메일 중복 체크 종료
               
                  
                  
                  
                  //페스워드 유효성 시작
                  $('#password').on("propertychange change key up paste input",
                        
                        function chkPW(){

                            var pw = $("#password").val();
                            var num = pw.search(/[0-9]/g);
                            var eng = pw.search(/[a-z]/ig);
                            var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

                            if(pw.length < 8 || pw.length > 20){
                               $('.password_input_re_2').css("display","inline-block");
                                 $('.password_input_re_1').css("display", "none");
                                 pwCheck=false;
                                 
                              
                               }else if(pw.search(/\s/) != -1){
                                  $('.password_input_re_2').css("display","inline-block");
                                    $('.password_input_re_1').css("display", "none");
                                    pwCheck=false;
                               
                               }else if(num < 0 || eng < 0 || spe < 0 ){
                                  $('.password_input_re_2').css("display","inline-block");
                                    $('.password_input_re_1').css("display", "none");
                                    pwCheck=false;
                               
                               }else {
                                  $('.password_input_re_1').css("display","inline-block");
                                    $('.password_input_re_2').css("display", "none");
                                    pwCheck=true;
                               }

                              
                            
                     
                         
                     }); //패스워드 1 유효성종료
                  
                  //패스워드 2 유효성 시작
                  $('#password2').on("propertychange change key up paste input",
                        function(){
                        var password1 = $('#password').val().trim();
                        //console.log(password1);
                        var password2 = $('#password2').val().trim();
                        //console.log(password2);
                        
                        if(password1==password2){
                                       $('.password2_input_re_1').css("display","inline-block");
                                       $('.password2_input_re_2').css("display", "none");      
                                       pwCheck2=true;
                                       } else {
                                          $('.password2_input_re_2').css("display","inline-block");
                                          $('.password2_input_re_1').css("display", "none");
                                          pwCheck2=false;
                                       }
                         
                     });
                     // 이름 유효성 검사 이름 1자 이상일 때 V 
                  $('#user_name').on("propertychange change key up paste input",
                        function(){
                        var name = $('#user_name').val().trim();
                        
                        
                        if(name.length>1){
                           $('.name_input_re_1').css("display","inline-block"); //v
                           $('.name_input_re_2').css("display", "none");       //x
                           nameCheck=true;
                        } else {
                              $('.name_input_re_2').css("display","inline-block");
                              $('.name_input_re_1').css("display", "none");
                              nameCheck=false;
                           }
                         
                     });//이름 유효성 검사 종료
                     //주소 유효성 검사 => 검색실행하면 v
                  $('#zipcode_btn').on("click",
                        function(){
                        
                        $('.address_input_re_1').css("display","inline-block");
                        $('.address_input_re_2').css("display", "none");      
                        addressCheck = true;

                     });
                  // 휴대폰 유효성 검사 10자 이상 && 숫자만 
                  $('#phone').on("propertychange change key up paste input",
                        function(){
                        var phone = $('#phone').val();
                        
                        
                        if(phone.length>9 && validateAge(콜) ){
                           $('.phone_input_re_1').css("display","inline-block"); //v
                           $('.phone_input_re_2').css("display", "none");       //x
                           phoneCheck=true;
                        } else {
                              $('.phone_input_re_2').css("display","inline-block");
                              $('.phone_input_re_1').css("display", "none");
                              phoneCheck=false;
                           }
                         
                     });//휴대폰 유효성 검사 종료
                     
                  //주소 유효성 검사 => 검색실행하면 v
                  $('#birth_date').on("click",
                        function(){
                        
                        $('.birth_date_input_re_1').css("display","inline-block");
                        $('.birth_date_input_re_2').css("display", "none");      
                        birthdateCheck = true;

                     });//주소 유효성 종료
                     
                     //회원가입 버튼 최종 유효성 검사 / submit 유효성 검사
                     $('#submit_btn').on("click",
                        function() {
                        var email1 = $('#email1').val();
                        var email2 = $('#email2').val();
                        var email = email1+"@"+email2;
                        $('#email').val(email);
                        
                        if ($("#address").val().length === 0) {
                            alert("주소를 입력하세요");
                            $('.address_input_re_2').css("display","inline-block");
                           $('.address_input_re_1').css("display", "none");   
                            addressCheck=false;
                            return false;
                          }
                        if ($("#birth_date").val().length === 0) {
                           alert("생일을 입력하세요.");
                           birthdateCheck=false;
                           $('.birth_date_input_re_2').css("display","inline-block");
                           $('.birth_date_input_re_1').css("display", "none");   
                            return false;
                          }

                        if(!emailCheck){
                           console.log("emailCheckfalse");
                        }
                        if(!pwCheck){
                           console.log("pwCheck=false");
                        }
                        if(!pwCheck2){
                           console.log("pwCheck2=false");
                        }
                        if(!nameCheck){
                           console.log("nameCheck=false");
                        }
                        if(!addressCheck){
                           console.log("addressCheck=false");
                        }
                        if(!phoneCheck){
                           console.log("phoneCheck=false");
                        }
                        if(!birthdateCheck){
                           console.log("birthdateCheck=false");
                        }
                        if(emailCheck && pwCheck && pwCheck2 && nameCheck && addressCheck && phoneCheck && birthdateCheck){
                           alert("회원가입 성공");
                           return true;
                        }
                        

                     
                         return false;
                     }); // submit 유효성 검사 종료
                     

   });//document ready 종료
   
   //phone 숫자only 확인                  
   function validateAge(콜) {
        var re = /^\d+$/;
        return re.test(콜);
   } // phone 숫자only 확인 종료
   
</script>
<%@include file="../includes/footer.jsp"%>