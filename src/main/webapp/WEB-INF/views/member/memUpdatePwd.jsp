<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memUpdatePwd.jsp</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
  	'use strict';
    function fCheck() {
    	let regPwd = /^[A-Za-z0-9]{4,24}$/;
    	
    	let originalPwd = document.getElementById("originalPwd").value;
    	let newPwd = document.getElementById("newPwd").value;
    	let rePwd = document.getElementById("rePwd").value;
    	
    	if(originalPwd.trim() == "") {
    		alert("기존 비밀번호를 입력하세요.");
    		document.getElementById("originalPwd").focus();
    	}
    	else if(newPwd.trim() == "") {
    		alert("새 비밀번호를 입력하세요.");
    		document.getElementById("newPwd").focus();
    	}
    	else if(rePwd.trim() == "") {
    		alert("새 비밀번호를 한번더 입력하세요.");
    		document.getElementById("rePwd").focus();
    	}
    	else if(newPwd != rePwd) {
    		alert("새로 입력한 비밀번호가 같지 않습니다. 확인하세요.");
    		document.getElementById("rePwd").focus();
    	}
    	else if(!regPwd.test(newPwd)) {
    		alert("비밀번호는 4~24자를 입력하세요.(특수문자 제외)");
    		document.getElementById("newPwd").focus();
    	}
    	else {
    		myForm.submit();
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
<div class="container">
  <form name="myForm" method="post" action="${ctp}/memUpdatePwdOk.mem" class="was-validated">
	  <h2 class="text-center">비밀번호 변경</h2>
	  <br/>
	  <table class="table table-bordered">
	    <tr>
	      <th>기존 비밀번호</th>
	      <td>
	        <input type="password" name="originalPwd" id="originalPwd" autofocus required class="form-control"/>
      		<div class="invalid-feedback">기존 비밀번호를 입력하세요.</div>
	        <!-- <div class="valid-feedback"></div> -->
	      </td>
	    </tr>
	    <tr>
	      <th>새 비밀번호</th>
	      <td>
	      	<input type="password" name="newPwd" id="newPwd" required  class="form-control"/>
      		<div class="invalid-feedback">새 비밀번호를 입력하세요.</div>
	      </td>
	    </tr>
	    <tr>
	      <th>새 비밀번호 한번더</th>
	      <td>
	      	<input type="password" name="rePwd" id="rePwd" required  class="form-control"/>
      		<div class="invalid-feedback">새 비밀번호를 한번더 입력하세요.</div>
	      </td>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-center">
	        <input type="button" value="비밀번호변경" onclick="fCheck()" class="btn btn-secondary"/> &nbsp;
	        <input type="reset" value="다시입력" class="btn btn-secondary"/> &nbsp;
	        <input type="button" value="돌아가기" class="btn btn-secondary" onclick="location.href='${ctp}/memMain.mem';"/> &nbsp;
	      </td>
	    </tr>
	  </table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>