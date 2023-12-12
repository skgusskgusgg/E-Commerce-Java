<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
  request.setCharacterEncoding("UTF-8");
  
  //사용할 결과 Parameter 값
  String inputYn = request.getParameter("inputYn"); 
  String roadFullAddr = request.getParameter("roadFullAddr"); 
  String jibunAddr = request.getParameter("jibunAddr"); 
  String zipNo = request.getParameter("zipNo"); 
  String addrDetail = request.getParameter("addrDetail");    
%>
</head>
<script language="javascript">
/* 주의사항 (IP차단 시 웹브라우저 사용 불가)
  모의 해킹 테스트 시 팝업API를 호출하시면 IP가 차단 될 수 있습니다. 
  주소팝업API를 제외하시고 테스트 하시기 바랍니다.
*/
function init(){
  var url = location.href;
  
  //팝업api 승인키 입력
  var confmKey = "devU01TX0FVVEgyMDIzMTEzMDEwMDUxODExNDMyMTU=";  
    
  // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 
  //    3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
  var resultType = "4"; 
  var inputYn= "<%=inputYn%>";
  if(inputYn != "Y"){
    /* 입력 파라미터 
        confmKey : 승인키(필수), returnUrl : 주소 검색 결과를 리턴받을 URL (통합 검색창을 호출한 페이지/필수),
        resultType : 도로명주소 검색결과 화면 출력 유형 */
    document.form.confmKey.value = confmKey;
    document.form.returnUrl.value = url;
    document.form.resultType.value = resultType;
    //인터넷망
    document.form.action="https://www.juso.go.kr/addrlink/addrLinkUrl.do"; 
    //모바일 웹인 경우, 인터넷망 : "https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do";
    
    document.form.submit();
    
  }else{
    //zipNo:우편번호, roadFullAddr:도로명주소, jibunAddr:지번주소, addrDetail:상세주소 (사용자 입력)
    setContent("<%=zipNo%>","<%=roadFullAddr%>","<%=jibunAddr%>","<%=addrDetail%>");
  }
  function setContent(zipcode,addr,addrjibun,addrDetail)
  {
  //var str = zipcode +"," + addr + "," + addrjibun + ","+ addrDetail; 

  //nexacro platform onusernotify  이벤트 발생
  //alert(str);
    opener.document.frm1.address.value = zipcode+","+addr;
    
     this.close();
  }  
}


</script>
<body onload="init();">
  <form id="form" name="form" method="post">
    <input type="hidden" id="confmKey" name="confmKey" value=""/>
    <input type="hidden" id="returnUrl" name="returnUrl" value=""/>
    <input type="hidden" id="resultType" name="resultType" value=""/>
    <!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
    <!-- 
    <input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
     -->
    <!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
  </form>
</body>
</html>