<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>guestInput.jsp</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
  <script>
    function fCheck() {
    	'use strict';
    	let regName = /^[가-힣a-zA-Z]{2,20}$/g;	// ^ : 뒤의 []안의 문자들로 문자열이 시작, {}안의 숫자는 길이체크(2~20자), $ : 앞의 []안의 문자들로 끝남
    	let regEmail = /^[a-zA-Z0-9_+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+/g;	// + : 앞의 []안의 문자들이 1번이상 반복
    	// 예) http://localhost:9090/  ,  https://www.naver.com  , http://192.168.50.20:9090/javagreenJ
    	let regHomepage = /^(((http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?/;	// s? : s가 존재하거나 존재하지 않거나(?), S* : 공백이 0번이상올수있다.
    	
    	let name = myForm.name.value;
    	let email = myForm.email.value;
    	let homepage = myForm.homepage.value;
    	let content = myForm.content.value;
    	
    	if(!regName.test(name)) {
        alert("이름을 확인하세요!(2자이상의 영문자이거나 한글만 가능)");
        document.getElementById("name").select();
        document.getElementById("name").focus();
        return false;
      }
    	if(email != "") {
    		console.log("email : " + email);
	      if(!regEmail.test(email)) {
	        alert("이메일 주소를 확인하세요!");
	        document.getElementById("email").select();
	        document.getElementById("email").focus();
	        return false;
	      }
    	}
    	if(homepage.substring(0,7)=="http://" && homepage.length>7 || homepage.substring(0,8)=="https://" && homepage.length>8) {
	      if(!regHomepage.test(homepage)) {
	        alert("홈페이지(블로그) 주소를 확인하세요!");
	        document.getElementById("homepage").select();
	        document.getElementById("homepage").focus();
	        return false;
	      }
    	}
    	if(content.trim() == "") {
    		alert("방문소감을 입력하세요");
    		document.getElementById("content").select();
    		document.getElementById("content").focus();
    		return false;
    	}
    	
   	  myForm.submit();
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
<div class="container">
  <form name="myForm" method="post" class="was-validated">
    <h2>방명록 글쓰기</h2>
    <div class="form-group">
      <label for="name">성명</label>
      <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요." required autofocus />
      <div class="valid-feedback">입력성공</div>
      <div class="invalid-feedback">성명은 필수 입력사항입니다.</div>
    </div>
    <div class="form-group">
      <label for="email">E-mail</label>
      <input type="text" class="form-control" name="email" id="email" placeholder="E-mail을 입력하세요."/>
      <div class="invalid-feedback">이메일은 선택 입력사항입니다.</div>
    </div>
    <div class="form-group">
      <label for="homepage">Homepage</label>
      <input type="text" class="form-control" name="homepage" id="homepage" value="http://"/>
      <div class="invalid-feedback">홈페이지는 선택 입력사항입니다.</div>
    </div>
    
    <div class="form-group">
      <label for="content">방문소감</label>
      <textarea rows="5" class="form-control" name="content" id="content" required placeholder="Homepage를 입력하세요."></textarea>
      <div class="valid-feedback">통과~~</div>
      <div class="invalid-feedback">방문소감은 필수 입력사항입니다.</div>
    </div>
    <div class="form-group">
	    <button type="button" class="btn btn-secondary" onclick="fCheck()">방명록 등록</button> &nbsp;
	    <button type="reset" class="btn btn-secondary">방명록 다시작성</button> &nbsp;
	    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/guest/guestList';">돌아가기</button>
    </div>
    <input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>