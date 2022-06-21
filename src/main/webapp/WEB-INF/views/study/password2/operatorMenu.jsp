<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>passMenu.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
    'use strict';
    function operatorInput() {
    	let str = '';
    	str += '<div id="operatorInputView">';
    	str += '<form method="post" action="${ctp}/study/password2/operatorInputOk">';
    	str += '<table class="table p-2">';
    	str += '<tr><th>성명</th><td><input type="text" name="name" class="form-control"/></td></tr>';
    	str += '<tr><th>아이디</th><td><input type="text" name="oid" class="form-control"/></td></tr>';
    	str += '<tr><th>비밀번호</th><td><input type="password" name="pwd" value="asdf1234" class="form-control"/></td></tr>';
    	str += '<tr><td colspan="2" class="text-center">';
    	str += '<input type="submit" value="등록하기" class="btn btn-info"/> &nbsp;';
    	str += '<input type="reset"  value="취소하기" class="btn btn-secondary" /> &nbsp;';
    	str += '<input type="button" value="등록창닫기" onclick="operatorClose()" class="btn btn-primary"/>';
    	str += '</td></tr>';
    	str += '</table>';
    	str += '</form>';
    	str += '</div>';
    	$("#demo").html(str);    	
    }
    
    function operatorClose() {
    	$("#operatorInputView").hide();
    }
    
    function operatorSearchForm() {
    	let str = '';
    	str += '<div id="operatorSearchView">';
    	str += '<form method="post" action="${ctp}/study/password2/operatorSearch">';
    	str += '<table class="table p2">';
    	str += '<tr><th>아이디</th><td><input type="text" name="oid" id="oid" class="form-control"/></td></tr>';
    	str += '<tr><th>비밀번호</th><td><input type="password" name="pwd" id="pwd" class="form-control"/></td></tr>';
    	str += '<tr><td colspan="2" class="text-center">';
    	str += '<input type="button" value="검색하기" onclick="operatorSearch()" class="btn btn-info"/> &nbsp;';
    	str += '<input type="reset" value="취소하기" class="btn btn-secondary" /> &nbsp;';
    	str += '<input type="button" value="검색창닫기" onclick="operatorSearchClose()" class="btn btn-primary"/>';
    	str += '</td></tr>';
    	str += '</table>';
    	str += '</form>';
    	str += '<div id="demo2"></div>';
    	str += '</div>';
    	$("#demo").html(str);
    }
    
    function operatorSearchClose() {
    	$("#operatorSearchView").hide();
    }
    
    function operatorSearch() {
    	let oid = $("#oid").val();
    	let pwd = $("#pwd").val();
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/study/password2/operatorSearch",
    		data : {
    			oid : oid,
    			pwd : pwd
    		},
    		success:function(res) {
    			let str = "<font size='5' color='red'><b>";
    			if(res == "1") {
    				alert("인증 성공!!");
    				str += "인증 성공!!";
    			}
    			else {
    				alert("인증 실패~~");
    				str += "인증 실패~~";
    			}
    			str += "</b></font>";
  				$("#demo2").html(str);
    		},
    		error : function() {
    			alert("전송오류");
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
  <h2 class="text-center">운영자 관리</h2>
  <hr/>
  <div class="row">
    <div class="col"></div>
    <div class="col"><input type="button" value="운영자 등록" onclick="operatorInput()" class="btn btn-success"/></div>
    <div class="col"><input type="button" value="운영자 인증" onclick="operatorSearchForm()" class="btn btn-success"/></div>
    <div class="col"><input type="button" value="운영자 전체조회" onclick="location.href='${ctp}/study/password2/operatorList';" class="btn btn-success"/></div>
    <div class="col"></div>
  </div>
  <hr/>
  <div id="demo" class="text-center"></div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>