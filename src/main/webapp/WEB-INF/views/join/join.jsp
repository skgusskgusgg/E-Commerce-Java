<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
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

						<form>
							<table class="tab02">
								<tr>
									<td><label for="id" class="size-220">아이디: </label></td>
									<td class="bor19 size-100"><input
										class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
										id="id" name="id" placeholder="id *"></td>
									<td><input type="button" name="confirm_id" value="confirm"
										class="flex-c-m  cl0  bg3 bor2 hov-btn3 p-lr-15 trans-04"></td>
								</tr>
								<tr>
									<td><label for="password" class="size-220">비밀번호: </label></td>
									<td class="bor19 size-100"><input
										class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
										id="id" name="password" placeholder="password *"></td>
								</tr>
								<tr>
									<td><label for="re-password" class="size-220">비밀번호
											확인: </label></td>
									<td class="bor19 size-100"><input
										class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
										id="re-password" name="re-password"
										placeholder="password check *"></td>
								</tr>
								<tr>
									<td><label for="name" class="size-220">이름: </label></td>
									<td class="bor19 size-100"><input
										class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
										id="name" name="name" placeholder="name *"></td>
								</tr>
								<tr>
									<td><label for="email" class="size-220">이메일: </label></td>
									<td class="bor19 size-100"><input
										class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
										id="email" name="email" placeholder="email *"></td>
									<td class=" size-100"><select name="selectEmail"
										class="stext-111 cl2 plh3  p-lr-18">
											<option value="naver.com">&#64;naver.com</option>
											<option value="google.com">&#64;google.com</option>
											<option value="hanmail.net">&#64;hanmail.net</option>
											<option value="nate.com">&#64;nate.com</option>
									</select></td>
								</tr>
								<tr>
									<td><label for="address" class="size-220">주소: </label></td>
									<td class="bor19 size-100"><input
										class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
										id="address" name="address1" placeholder="address *"></td>
									<td><input type="button" id="zipcode_btn" value="zip code"
										class="flex-c-m  cl0  bg3 bor2 hov-btn3 p-lr-15 trans-04"></td>
								</tr>
								<tr>
									<td><input type="hidden" class="size-220"></td>
									<td class="bor19 size-219"><input
										class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
										name="address2" placeholder="detail *"></td>
								</tr>
								<tr>
									<td><label for="phoneNumber" class="size-220">휴대폰
											번호: </label></td>
									<td class="bor19 size-100"><input
										class="stext-111 cl2 plh3 size-126 p-lr-18" type="text"
										id="phoneNumber" name="phoneNumber"
										placeholder="phone number (do not insert ' - ') *"></td>
								</tr>
								<tr>
									<td><label for="birthDate" class="size-220">생년월일:
									</label></td>
									<td class="bor19 size-100"><input
										class="stext-111 cl2 plh3 size-126 p-lr-18" type="date"
										id="birthDate" name="birthDate"></td>
								</tr>
								<tr>
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
								</tr>
							</table>
							<div style="display: flex;justify-content: end">
								<button type="submit"
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
<%@include file="../includes/footer.jsp"%>