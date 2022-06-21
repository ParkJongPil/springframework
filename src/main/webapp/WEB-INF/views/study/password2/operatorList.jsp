<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>operatorList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
    'use strict';
    function operatorDelete(oid) {
    	let ans = confirm("선택하신 운영자를 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/study/password2/operatorDelete",
    		data : {oid : oid},
    		success:function(res) {
    			if(res == 1) alert("삭제 되었습니다.");
    			location.reload();
    		},
    		error : function() {
    			alert("전송오류~~");
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
  <h2 class="text-center">전체 운영자 리스트</h2>
  <br/>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>아이디</th>
      <th>성명</th>
      <th>색인키</th>
      <th>비밀번호</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
    	<tr>
    	  <td>${vo.oid}</td>
    	  <td>${vo.name}</td>
    	  <td>${vo.keyIdx}</td>
    	  <td>${vo.pwd}</td>
    	  <td><button type="button" onclick="operatorDelete('${vo.oid}')" class="btn btn-danger btn-sm">삭제</button></td>
    	</tr>
    </c:forEach>
    <tr><td colspan="5" class="p-0"></td></tr>
  </table>
  <p class="text-center"><input type="button" value="돌아가기" onclick="location.href='${ctp}/study/password2/operatorMenu';" class="btn btn-info"/></p>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>