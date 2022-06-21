<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ajaxTest2.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script>
	'use strict';
		$(function() {	//jquery 사용방법
			$("#dodo").change(function() {
				let dodo = $(this).val();
				if(dodo == ""){
					alert("지역을 선택하세요.")
					return false;
				}
				$.ajax({
					type : "post",
					url	 : "${ctp}/study/ajax/ajaxTest2",
					data : {dodo : dodo},
					success : function(res) {
						let str = '';
						str += '<option value="">도시선택</option>';
						for(let i=0; i<res.length; i++) {
							if(res[i]== null) break;
							str += '<option>'+res[i]+'</option>';
						}	
						
						$("#city").html(str);
					},
						error : function() {
						alert("전송오류!");
						}
				});
			});
		});
		function fCheck() {
			let dodo2 = $("#dodo").val();
			let city = $("#city").val();
			
			if(dodo2 == "" || city == "") { 
				alert("지역을 선택하세요!");
				return false;
			}
			alert("선택하신 지역은? " + dodo2 + " / " + city);
		}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
	<div class="container">
   <h2>AJax를 활용한 값의 전달2(ArrayList<String> 배열을 이용한 예제)</h2>
   <hr/>
   <h3>도시를 선택하세요</h3>
   <form name="myForm">
   	<select name="dodo" id="dodo">
   		<option value="">지역선택</option>
   		<option value="서울">서울</option>
   		<option value="경기">경기</option>
   		<option value="충북">충북</option>
   		<option value="충남">충남</option>
 		</select>
 		<select id="city">
 			<option value="">도시선택</option>
 		</select>
 		<input type="button" value="선택" onclick="fCheck()"/> &nbsp;
 		<input type="button" value="돌아가기" onclick="location.href='${ctp}/study/ajax/ajaxMenu';"/> &nbsp;
   </form>
   
  </div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>