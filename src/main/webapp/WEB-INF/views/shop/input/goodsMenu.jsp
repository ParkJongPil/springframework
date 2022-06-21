<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>shopInput.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>
'use strict';
$(function() {
	$("#large").change(function() {
		let large = $(this).val();
		
		$.ajax({
			type : "post",
			url : "${ctp}/shop/input/goodsMenu",
			data : {large : large},
			success : function(vos) {
				let str ="";
				str += "<option>대분류</option>";
				for(let i=0; i<vos.length; i++) {
					str += '<option value =" + vos[i].product2 +">' +vos[i].product2 +'</option>';
			}
				document.getElementById("middle").innerHTML = str;
			},
			error: function() {
				alert("전송오류");
			}
		});
	});
});

/* 	//reset버튼 클릭했을때 
$(document).ready(function({
	$("#reset").click(function(){
		$("#formReset").each(function(){
			this.reset();
		});
	});
}); */

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
<form id="formReset">
	<div id="goods" class="text-center" style="width: 700px; height:650px; border: solid; border-color: gray; border-radius:10px; margin-left:500px; padding-top:40px">
		<div class="container">
			<h2>상품등록</h2><br/>
			<hr/>
				<p>
				대분류
					<select name="large" id="large" class="btn btn-secondary btn-sm">
					
				<!-- 		<option value="">대분류</option>
						<option value="전자제품">전자제품</option>
						<option value="신발류">신발류</option>
						<option value="의류">의류</option> -->
						<option value="">대분류</option>
						<c:forEach var="vo" items="${vos}" varStatus="st">
							<option value="${vo.product1}">${vo.product1}</option>
						</c:forEach>
					</select> &nbsp;
					중분류
					<select name="middle" id="middle" class="btn btn-secondary btn-sm">
						<option value="">중분류</option>
					<!-- 	<option value="삼성" >삼성</option>
						<option value="LG" >LG</option>
						<option value="현대" >현대</option>
						<option value="나이키" >나이키</option>
						<option value="아디다스" >아디다스</option>
						<option value="블랙야크" >블랙야크</option>
						<option value="K2" >K2</option>
						<option value="노스페이스" >노스페이스</option> -->
					</select> &nbsp;
				소분류
					<select name="small" id="small" class="btn btn-secondary btn-sm">
						<option value="">소분류</option>
					<!-- 	<option value="냉장고">냉장고</option>
						<option value="에어컨">에어컨</option>
						<option value="세탁기">세탁기</option>
						<option value="건조기">건조기</option>
						<option value="식기세척기">식기세척기</option>
						<option value="스타일러">스타일러</option>
						<option value="등산화">등산화</option>
						<option value="슬리퍼">슬리퍼</option>
						<option value="운동화">운동화</option>
						<option value="축구화">축구화</option>
						<option value="욕실화">욕실화</option>
						<option value="언더웨어">언더웨어</option>
						<option value="바지">바지</option>
						<option value="자켓">자켓</option>
						<option value="점퍼">점퍼</option>
						<option value="상의">상의</option> -->
					</select>
					</p>
					<hr/>
					<p class=text-left style= "width:500px; margin-left:80px; ">
					상품명 : <input type="text" name="product" id="product" class="form-control" placeholder="상품명을 입력하세요" autofocus style="border-radius:15px;"/><br/>
					가격 : <input type="text" name="product" id="price" class="form-control" placeholder="가격을 입력하세요" style="border-radius:15px;"/><br/>
					제목 : <input type="text" name="product" id="title" class="form-control" placeholder="제목을 입력하세요" style="border-radius:15px;"/><br/>
					상품 설명 : <input type="text" name="product" id="content" class="form-control" placeholder="상품설명을 입력하세요" style="border-radius:15px;"/>
					</p>
					<hr/>
				<div class="row" style= "padding-right:130px; margin-top:30px;">
					<div class="col"></div>
					<div class="col"><input type="button" value="상품 등록" onclick="fCheck()" class="btn btn-secondary" /></div>
					<div class="col"><input type="reset" value="등록 취소" id= "reset"class="btn btn-danger"/></div>
					<div class="col"><input type="button" value="뒤로가기" onclick="location.href='${ctp}/';" class="btn btn-warning"/></div>
				</div>
			<!-- 	
				야간모드 버튼
				<input type="button" value="night" class="btn btn-secondary" onclick="
				document.querySelector('body').style.backgroundColor='black';
				document.querySelector('body').style.color='white';
				">
				
				주간모드 버튼
				<input type="button" value="day" class="btn btn-secondary" onclick="
				document.querySelector('body').style.backgroundColor='white';
				document.querySelector('body').style.color='black';
				">
				 -->
		</div>
	</div>
</form>

<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>