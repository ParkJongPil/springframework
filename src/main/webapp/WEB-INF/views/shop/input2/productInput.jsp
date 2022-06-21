<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>productInput.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
    $(function() {
    	// 대분류 선택시 수행
    	$("#product1").change(function(){
    		var product1 = $(this).val();
    		var query = {product1 : product1};
    		$.ajax({
    			type : "post",
    			url  : "${ctp}/shop/input/product2Get",
    			data : query,
    			success:function(product2s) {
    				var str = "";
    				str += "<option value=''>중분류</option>";
    				for(var i=0; i<product2s.length; i++) {
    					str += "<option>"+product2s[i]+"</option>";
    				}
    				$("#product2").html(str);
    			},
    			error : function() {
    				alert("전송오류!");
    			}
    		});
    	});
    	
    	// 중분류 선택시 수행
    	$("#product2").change(function(){
    		var product1 = $("#product1").val();
    		var product2 = $(this).val();
    		var query = {
    				product1 : product1,
    				product2 : product2
    			};
    		$.ajax({
    			type : "post",
    			url  : "${ctp}/shop/input/product3Get",
    			data : query,
    			success:function(product3s) {
    				var str = "";
    				str += "<option value=''>소분류</option>";
    				for(var i=0; i<product3s.length; i++) {
    					str += "<option>"+product3s[i]+"</option>";
    				}
    				$("#product3").html(str);
    			},
    			error : function() {
    				alert("전송오류!");
    			}
    		});
    	});
    });
    
    function productInput() {
    	var product1 = $("#product1").val();
    	var product2 = $("#product2").val();
    	var product3 = $("#product3").val();
    	var product = $("#product").val();
    	
    	if(product1=="" || product2=="" || product3=="" || product=="") {
    		alert("대/중/소/품목 을 고르시거나 입력하셔야 합니다.");
    	}
    	else {
    		//alert("선택하신 대/중/소/품목은? " + product1 + "/" + product2 + "/" + product3 + "/" + product);
    		myForm.submit();
    	}
    }
  </script>
  <style>
    th {text-align:center}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br></p>
<div class="container">
	<div class="row">
	  <div class="col text-left"><h2><a href="${ctp}/shop/input/productMenu">상품등록하기</a></h2></div>
	  <div class="col text-right"><h2><a href="${ctp}/shop/list/productList">상품목록보기</a></h2></div>
	</div>
  <hr/>
  <form name="myForm" method="post">
    <div class="text-center">
	    대분류선택
	    <select id="product1" name="product1">
	      <option value="">대분류</option>
	      <c:forEach var="product1" items="${product1s}">
	        <option>${product1}</option>
	      </c:forEach>
	    </select> - &nbsp;
	    중분류선택
	    <select id="product2" name="product2">
	    	<option value="">중분류</option>
	    </select> - &nbsp;
	    소분류선택
	    <select id="product3" name="product3">
	    	<option value="">소분류</option>
	    </select>
    </div>
    <br/>
    <table class="table table-bordered">
      <tr>
        <th>상품명</th>
        <td><input type="text" name="product" id="product" class="form-control"/></td>
      </tr>
      <tr>
        <th>가격</th>
        <td><input type="number" name="price" id="price" class="form-control"/></td>
      </tr>
      <tr>
        <th>간단설명</th>
        <td><input type="text" name="title" id="title" class="form-control"/></td>
      </tr>
      <tr>
        <th>상세설명</th>
        <td><textarea rows="4" name="content" class="form-control"></textarea></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
			    <input type="button" value="상품등록" onclick="productInput()" class="btn btn-info"/>
        </td>
      </tr>
    </table>
  </form>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>