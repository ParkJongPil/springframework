<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ajaxTest4.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script>
	'use strict';
		//개별 검색(vo 사용)
		function idCheck() {
				let oid = myForm.oid.value;
				if(oid == "") {
					alert("아이디를 입력하세요!");
					myForm.oid.focus();
					return false;
				}
				$.ajax({
					type : "post",
					url : "${ctp}/study/ajax/ajaxTest4",
					data : {oid :oid},
					success: function(vo){
						let str= '<b>전송결과</b><hr/>';
						if(vo != ''){
							str +='아이디 : '+vo.oid+'<br/>';
							str +='성명 : '+vo.name+'<br/>';
							str +='비밀번호 : '+vo.pwd+'<br/>';
							str +='키 인덱스 : '+vo.keyIdx+'<br/> ';
						}
						else {
							str += '<font color="red"><b>찾는 자료가 없습니다.</b></font>';
						}
						$("#demo").html(str);
					},
					error : function() {
						alert("전송오류!");
					}
				});
		}
		// 포함된 아이디 검색(vos 사용)
		function idList() {
			let oid = myForm.oid.value;
			if(oid == "") {
				alert("아이디를 입력하세요!");
				myForm.oid.focus();
				return false;
			}
			$.ajax({
				type : "post",
				url : "${ctp}/study/ajax/ajaxTest5",
				data : {oid :oid},
				success: function(vos){
					let str= '<b>전송결과</b><hr/>';
					if(vos != ''){
						str +='<table class="table table-hover">';
						str +='<tr class="table-dark text-dark">';
						str +='<th>아이디</th><th>성명</th><th>키인덱스</th><th>비밀번호</th>';
						str +='</tr>';
					for(let i = 0; i<vos.length; i++) {
						str +='<tr class="text-center">';
						str +='<td>'+ vos[i].oid +'</td>';			// vos(i)
						str +='<td>'+ vos[i].name +'</td>';			
						str +='<td>'+ vos[i].keyIdx +'</td>';			
						str +='<td>'+ vos[i].pwd +'</td>';			
						str +='</tr>';
					}
						str +='</table>';
					}
					else {
						str += '<font color="red"><b>찾는 자료가 없습니다.</b></font>';
					}
					$("#demo").html(str);
				},
				error : function() {
					alert("전송오류!");
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
	<div class="container">
 		<form name="myForm">
 			<h2>aJax를 활용한 '회원 아이디' 검색하기</h2>
 			<hr/>
 			<p>아이디
 				<input type="text" name="oid" autofocus /> &nbsp;
 				<input type="button" value="아이디일치 검색" onclick="idCheck()" class="btn btn-secondary"/> &nbsp;
 				<input type="button" value="아이디일부 검색" onclick="idList()" class="btn btn-secondary"/> &nbsp;
 				<input type="reset" value="다시 입력" class="btn btn-secondary"/> &nbsp;
 				<input type="button" value="돌아가기" onclick="location.href='${ctp}/study/ajax/ajaxMenu';" class="btn btn-secondary"/> &nbsp;
 			</p>
 			<hr/>
 			<p id="demo"></p> 
 		</form>
  </div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>