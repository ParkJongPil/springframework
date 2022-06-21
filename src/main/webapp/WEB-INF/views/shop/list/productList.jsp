<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>productList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
    'use strict';
  </script>
  <style>
    
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br></p>
<div class="container">
	<div class="row">
	  <div class="col text-left"><h3><a href="${ctp}/shop/input/productMenu">상품등록하기</a></h3></div>
	  <div class="col text-right"><h3><a href="${ctp}/shop/list/productList">상품목록보기</a></h3></div>
	</div>
  <hr/>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>상품명</th>
      <th>가격</th>
      <th>제목</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${vo.idx}</td>
        <td>${vo.product}</td>
        <td><fmt:formatNumber value="${vo.price}"/></td>
        <td>${vo.title}</td>
        <td>
          <a href="#" class="btn btn-primary btn-sm">수정</a>/
          <a href="#" class="btn btn-danger btn-sm">삭제</a>
        </td>
      </tr>
    </c:forEach>
    <tr><td colspan="5" class="p-0"></td></tr>
  </table>
  <div class="text-center">
	  <form name="searchForm">
	    상품명검색 :
	    <input type="text" name="product"/> &nbsp;
	    <input type="button" value="상품검색" onclick="productSearch()" class="btn btn-info"/>
	  </form>
	  <script>
	    function productSearch() {
	    	let product = document.searchForm.product.value;
	    	if(product.trim() == "") {
	    		alert("검색할 품명을 입력하세요");
	    		searchFrom.product.focus();
	    	}
	    	else {
	    		location.href = "${ctp}/shop/list/productSearch?product="+product;
	    	}
	    }
	  </script>
  </div>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>