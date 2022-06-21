<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memIdPwdSearch.jsp</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
  	'use strict';
  	
  	$(document).ready(function(){
  		$(".titleTab").click(function(){
  			$("#demo").html('');
  		});
  		
  		$("#idTab").click(function(){
  			$("#idEmail").val('');
  		});
  		
  		$("#pwdTab").click(function(){
  			$("#passwordSearch").show();
  			$("#pwdMid").val('');
  			$("#pwdEmail").val('');
  		});
  		
  		$("#noticeTab").click(function(){
  			$("#passwordSearch").hide();
  		});
  	});  	
  	
  	// 아이디 검색하기
    function idSearch() {
    	let email = $("#idEmail").val();
    	
    	if(email == "") {
    		alert("이메일 주소를 입력하세요");
    		$("#idEmail").focus();
    		return false;
    	}
    	
    	$.ajax({
    		type   : "post",
    		url    : "${ctp}/memIdPwdSearchOk",
    		data   : {email : email},
    		success: function(data) {
    			let str = "";
    			if(data == "") {
    				alert("등록된 자료가 없습니다.");
    			}
    			else {
    				let arrayData = data.split("/");
    				for(let i=0; i<arrayData.length; i++) {
    					let imsi = "";
    					for(let j=0; j<arrayData[i].length; j++) {
    						if(arrayData[i].charAt(j) == " ") {
    							imsi += arrayData[i].substring(arrayData[i].indexOf(" "));
    							break;
    						}
    						if((j+1)%3 != 0) imsi += arrayData[i].charAt(j);
    						else imsi += "*";
    					}
    					str += (i+1) + " : <font color='blue'>" + imsi + "</font><br/>";
    				}
    				$("#demo").html("검색된 아이디 : <br/>" + str + "<hr/>");
    			}
    		},
    		error : function() {
    			alert("전송오류~~");
    		}
    	});
    }
    
  	// 비밀번호 검색하기
    function pwdSearch() {
    	let mid = $("#pwdMid").val();
    	let email = $("#pwdEmail").val();
    	
    	if(mid == "") {
    		alert("아이디를 입력하세요");
    		$("#pwdMid").focus();
    		return false;
    	}
    	else if(email == "") {
    		alert("이메일 주소를 입력하세요");
    		$("#pwdEmail").focus();
    		return false;
    	}
    	
    	$.ajax({
    		type   : "post",
    		url    : "${ctp}/memIdPwdSearchOk",
    		data   : {
    			mid  : mid,
    			email: email
    		},
    		success: function(data) {
    			let str = "";
    			if(data == "") {
    				alert("등록된 자료가 없습니다.");
    			}
    			else {
    				if(data.indexOf("탈퇴회원") != -1) {
    					alert("이미 탈퇴하신 회원입니다.(현재 아이디로 사용불가)");
    				}
    				else {
	    				alert("회원확인 Ok! 신규비밀번호를 등록하세요.");
	    				$("#pwdMid").prop("readonly",true);
	    				$("#passwordBtn").hide();
	    				str += '<div><font color="brown"><b>신규비밀번호로 등록합니다. 새로 작성할 비밀번호와 확인비밀번호를 입력하세요.</b></font></div>';
	    				str += '<input type="password" name="newPwd1" id="newPwd1" placeholder="신규 비밀번호를 입력하세요." class="form-control m-1" />';
	    				str += '<input type="password" name="newPwd2" id="newPwd2" placeholder="신규 비밀번호를 한번더 입력하세요." class="form-control m-1" />';
	    				str += '<input type="button" value="신규 비밀번호 등록" onclick="pwdInputCheck()" class="btn btn-primary form-control m-1" />';
	    				$("#demo").html(str + "<hr/>");
    				}
    			}
    		},
    		error : function() {
    			alert("전송오류~~");
    		}
    	});
    }
    
  	// 신규비밀번호 등록
  	function pwdInputCheck() {
  		let mid = $("#pwdMid").val();
  		let newPwd1 = $("#newPwd1").val();
  		let newPwd2 = $("#newPwd2").val();
  		
  		if(newPwd1.trim() == "") {
  			alert("신규 비밀번호를 입력하세요");
  			$("#newPwd1").focus();
  			return false;
  		}
  		else if(newPwd2.trim() == "") {
  			alert("신규 비밀번호 확인란를 입력하세요");
  			$("#newPwd2").focus();
  			return false;
  		}
  		else if(newPwd1 != newPwd2) {
  			alert("신규비밀번호가 틀립니다. 확인하세요.");
  			$("#newPwd2").focus();
  			return false;
  		}
  		
  		$.ajax({
    		type   : "post",
    		url    : "${ctp}/memPwdUpdate",
    		data   : {
    			mid  : mid,
    			pwd: newPwd1
    		},
    		success: function(data) {
    			if(data == "1") {
    				alert("신규비밀번호가 등록되었습니다.");
    				location.href = "memLogin.mem";
    			}
    			else {
    				alert("신규비밀번호 등록 실패~~");
    			}
    		},
    		error : function() {
    			alert("전송오류~~");
    		}
    	});
  	}
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<form>
  <h2>아이디 / 비밀번호 찾기</h2>
  <br/><br/>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active titleTab" data-toggle="tab" href="#idSearch" id="idTab">아이디찾기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link titleTab" data-toggle="tab" href="#passwordSearch" id="pwdTab">비밀번호찾기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link titleTab" data-toggle="tab" href="#notice" id="noticeTab">안내사항</a>
    </li>
    <li class="nav-item">
      <a class="nav-link btn-outline-secondary" href="memLogin.mem">돌아가기</a>
    </li>
  </ul>


  <!-- Tab panes -->
  <div class="tab-content">
    <div id="idSearch" class="container tab-pane active"><br/>
      <h4>아이디찾기</h4>
      <p>
        <div>회원가입시에 등록하셨던 <font color="brown"><b>이메일 주소</b></font> 를 입력해주세요.</div>
        <div class="input-group">
        	<input type="text" name="email" id="idEmail" class="form-control m-1">
        	<div><input type="button" value="아이디찾기" onclick="idSearch()" class="btn btn-primary input-group-append m-1"/></div>
        </div> 
      </p>
    </div>
    <div id="passwordSearch" class="container tab-pane fade"><br/>
      <h4>비밀번호찾기</h4>
      <p>
      	<div>회원가입시에 등록하셨던 <font color="brown"><b>아이디 / 이메일 주소</b></font> 를 입력해주세요.</div>
        <div><input type="text" name="mid" id="pwdMid" placeholder="아이디를 입력하세요" class="form-control m-1"></div>
        <div><input type="text" name="email" id="pwdEmail" placeholder="이메일 주소를 입력하세요" class="form-control m-1"></div>
        <div><input type="button" value="비밀번호찾기" id="passwordBtn" onclick="pwdSearch()" class="btn btn-primary form-control m-1"/></div>
      </p>
    </div>
    <div id="notice" class="container tab-pane fade"><br/>
      <h4>안내사항</h4>
      <p>
        아이디나 비밀번호 분실시는 기존에 가입하셨던 이메일주소를 이용하여 검색이 가능합니다.<br/>
        보다 더 좋은 서비스를 위하여 건의사항이 있으시면 1:1문의나 방명록/게시판에 글 올려주시면 빠른시일내에 반영하도록 하겠습니다.
      </p>
    </div>
  </div>
  
  <hr/>
  <div id="demo" class="container"></div>
  <div class="container"><input type="button" value="로그인창으로 이동" onclick="location.href='memLogin.mem';" class="btn btn-info form-control"/></div>
</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>