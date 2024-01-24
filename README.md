![header](https://capsule-render.vercel.app/api?type=waving&color=717fe0&fontColor=fff&height=300&section=header&text=Ecommerce-Project%20&fontSize=80)
- 부트 스트랩을 이용한 남성 의류를 판매하는 홈페이지 프로젝트입니다.

# 개발 기간
- 2023/11/15 ~ 2023/12/18 (4주)

# 개발 인원 및 파트
|개발자                 |파트                |
|---------------------|-------------------|
|윤찬수                 |search기능<br>cartList페이지<br>product review기능<br>payment기능|
|권나현                 |productList페이지<br>productDetail페이지<br>productDetailModal페이지<br>관리자&일반유저interceptor<br>cart담기 기능<br>wishList페이지<br>메인페이지<br>리뷰 관리|
|노솔진                 |1:1문의 게시판(CRUD)<br>Notice 게시판(CRUD)<br>로그인 기능 (Modal)<br>1:1문의 게시판 댓글 기능<br>관리자 전용 Notice 게시판<br>관리자 전용 1:1문의 게시판|
|강현규                 |mypage(주문내역기능)<br>회원정보수정<br>배송관리페이지<br>오더관리페이지<br>멤버관리페이지|
# 기술 스텍
<img src="https://img.shields.io/badge/Java-3766AB?style=flat-square&logo=OpenJDK&logoColor=white"/> <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/>
<img src="https://img.shields.io/badge/HTML-E34F26?style=flat-square&logo=HTML5&logoColor=white"/> <img src="https://img.shields.io/badge/CSS-1572B6?style=flat-square&logo=CSS3&logoColor=white"/> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=white"/>
<img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=white"/>
# 서비스 소개
- 메인 페이지에서 가장 많이 팔린 상품을 우선순위로 보여주어 유저들이 인기있는 상품에 쉽게 접근할 수 있습니다.
  
- 상품페이지에서 유저들이 원하는 카테고리별로 편리하게 접근할 수있습니다.
  
- 상품 디테일 페이지에서 로그인을 한 유저들이 원하는 상품마다 댓글을 달고 해당하는 상품의 평을 보고 쉽게 접근할 수 있습니다.
  
- notice페이지에서 유저들이 홈페이지에 새롭게 업데이트된 소식을 실시간으로 전달 받을수있습니다.
  
- 돋보기 창을 눌러 페이지 내 어디서든 유저들이 원하는 상품을 검색할 수 있습니다.
  
- 하트 아이콘을 누르면 페이지 내 어디서든 위시리스트를 확인할 수 있습니다.
  
- mypage로 이동시 유저들이 주문한 내역, 배송, 회원정보 수정, 리뷰 관리를 쉽게 접근할 수 있습니다.
  
- 관리자 페이지와 유저 페이지를 따로 나누어 관리자의 역할을 수월히 가능하게 하였습니다.
  
- 관리자는 모든 게시물을 수정, 삭제, 등록할 수 있으며, 회원 관리뿐만아니라 회원에게 보낼 상품들의 배송관리 또한 맡고 있습니다.
  
# 협업 툴
<img src="https://img.shields.io/badge/WBS-00AC47?style=flat-square&logo=Wbs&logoColor=white"/> <img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/>

# 구현 기능
### 상품 리스트 페이지
1) 상품 리스트 pagination 기능
2) 가격, 색상, 사이즈, 검색, 최신순 필터링 구현
3) 모달 창을 통해 페이지 랜더링 없이 편하게 볼 수 있다.
4) 위시리스트에 추가된 아이템을 직접 확인하러 페이지에 들어가지않아도 이모티콘 활성화를 통해 한눈에 알아볼 수 있다.

### 상품 디테일 페이지 & 상품 디테일 모달 창
1) 원하는 상품을 위시리스트 or 카트에 원하는 수량 또는 사이즈, 색상별로 보내는 기능

### 위시리스트
1) 사용자가 담은 상품을 카트에 보내거나, 또는 삭제할 수있다.

### 로그인 인터셉터
1) 로그인한 사용자의 정보를 토대로 사용자가 넣었던 위시리스트, 카트리스트, 사용자가 쓴 리뷰를 그대로 보여줄 수 있다.

### 메인 페이지
1) 가장 많이 팔린 상품을 토대로 BestProdecut 필터링 구현

