<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>productMenu.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
<div class="container">
	<h2>상품 소개</h2>
		<hr/>
		<div class="row" style="text-align:center; border:solid; border-color: gray; border-radius:20px; width:600px; height: 300px">
		<div class="col">상품명</div>
		<div class="col">가격</div>
		<div class="col">제목</div>
		<div class="col">상품 설명</div>
		</div><br/>
		<input type="button" value="돌아가기" onclick="location.href='${ctp}/';"class="btn btn-warning" style="margin-left:200px">
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>