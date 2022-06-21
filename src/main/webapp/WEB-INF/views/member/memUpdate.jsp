<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  // 취미
  String hobby_ = (String) request.getAttribute("hobby");
  String[] hobbys = hobby_.split("/");
  String[] hobby = {"등산","낚시","수영","독서","영화감상","바둑","축구","기타"};
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memUpdate.jsp</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <script>
  	'use strict';
  	let nickCheckSw = 0;
  	
    // 회원가입폼 체크후 서버로 전송하기
    function fCheck() {
      let regPwd = /(?=.*[0-9a-zA-Z]).{4,24}/;
      let regNickName = /^[가-힣]+$/;
      let regName = /^[가-힣a-zA-Z]+$/;
      let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      let regURL = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/;
      let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
      
      let submitFlag = 0;		// 전송체크버튼으로 값이 1이면 체크완료되어 전송처리한다.
    	
    	let pwd = myForm.pwd.value;
    	let nickName = myForm.nickName.value;
    	let name = myForm.name.value;
    	let email1 = myForm.email1.value;
    	let email2 = myForm.email2.value;
      let email = email1 + '@' + email2;
      let homePage = myForm.homePage.value;
      let tel1 = myForm.tel1.value;
      let tel2 = myForm.tel2.value;
      let tel3 = myForm.tel3.value;
      let tel = myForm.tel1.value + "-" + myForm.tel2.value + "-" + myForm.tel3.value;
    	
    	// 사진 업로드 체크
    	let fName = myForm.fName.value;
    	let ext = fName.substring(fName.lastIndexOf(".")+1);	// 파일 확장자 발췌
    	let uExt = ext.toUpperCase();		// 확장자를 대문자로 변환
    	let maxSize = 1024 * 1024 * 2; 	// 업로드할 회원사진의 용량은 2MByte까지로 제한한다.
    	
    	// 기타 추가로 체크해야 할 항목들을 모두 체크하세요.....
    	if(!regPwd.test(pwd)) {
        alert("비밀번호는 4~24 자리로 작성해주세요.");
        myForm.pwd.focus();
        return false;
      }
      else if(!regNickName.test(nickName)) {
        alert("닉네임은 한글만 사용가능합니다.");
        myForm.nickName.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        myForm.name.focus();
        return false;
      }
      else if(!regEmail.test(email)) {
        alert("이메일 형식에 맞지않습니다.");
        myForm.email1.focus();
        return false;
      }
      else if((homePage != "http://" && homePage != "")) {
        if(!regURL.test(homePage)) {
	        alert("작성하신 홈페이지 주소가 URL 형식에 맞지않습니다.");
	        myForm.homePage.focus();
	        return false;
        }
        else {
	    	  submitFlag = 1;
	      }
      }
    	
      if(tel2 != "" || tel3 != "") {
	      if(!regTel.test(tel)) {
	        alert("전화번호 형식에 맞지않습니다.(000-0000-0000)");
	        myForm.tel2.focus();
	        return false;
	      }
	      else {
	    	  submitFlag = 1;
	      }
      }
    	
  		// 전송전에 '주소'를 하나로 묶어서 전송처리 준비한다.
  		let postcode = myForm.postcode.value + " ";
  		let roadAddress = myForm.roadAddress.value + " ";
  		let detailAddress = myForm.detailAddress.value + " ";
  		let extraAddress = myForm.extraAddress.value + " ";
  		myForm.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
  		
  		// 전송전에 파일에 관한 사항체크...
  		if(fName.trim() == "") {
  			myForm.photo.value = "noimage"
				submitFlag = 1;
  		}
  		else {
  			let fileSize = document.getElementById("file").files[0].size;
  			
  			if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG") {
  				alert("업로드 가능한 파일은 'JPG/GIF/PNG'파일 입니다.");
  				return false;
  			}
  			else if(fName.indexOf(" ") != -1) {
  				alert("업로드 파일명에 공백을 포함할 수 없습니다.");
  				return false;
  			}
  			else if(fileSize > maxSize) {
  				alert("업로드 파일의 크기는 2MByte를 초과할수 없습니다.");
  				return false;
  			}
    		submitFlag = 1;
    	}
    	
  		// 전송전에 모든 체크가 끝나서 submitFlag가 1이되면 서버로 전송한다.
  		let nickName_ = '${sNickName}';
    	if(submitFlag == 1) {
    		if(nickName_ != nickName && nickCheckSw == 0) {
    			alert("닉네임 중복체크버튼을 눌러주세요!");
    		}
    		else {
	  			// 묶여진 필드(email/tel)를 폼태그안에 hidden태그의 값으로 저장시켜준다.
	  			myForm.email.value = email;
	  			myForm.tel.value = tel;
	  			
	  			myForm.submit();
    		}
    	}
    	else {
    		alert("회원가입 실패~~");
    	}
    }
    
    // nickName 중복체크
    function nickCheck() {
    	let nickName = myForm.nickName.value;
    	let url = "${ctp}/memNickCheck.mem?nickName="+nickName;
    	
    	if(nickName == "") {
    		alert("닉네임을 입력하세요!");
    		myForm.nickName.focus();
    	}
    	else {
    		nickCheckSw = 1;
    		window.open(url,"nWin","width=580px,height=250px");
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<div class="container" style="padding:30px">
  <%-- <form name="myForm" method="post" action="${ctp}/memJoinOk.mem" class="was-validated" enctype="Multipart/form-data"> --%>
  <form name="myForm" method="post" action="${ctp}/memUpdateOk.mem" class="was-validated">
    <h2>회 원 정 보 수 정</h2>
    <div><font color="blue">(회원정보를 수정하려면 회원비밀번호를 정확히 입력하셔야 합니다.)</font></div>
    <br/>
    <div class="form-group">
      아이디 : ${sMid}
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" id="pwd" name="pwd" required autofocus />
    </div>
    <div class="form-group">
      <label for="nickName">닉네임 : &nbsp; &nbsp;<input type="button" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickCheck()"/></label>
      <input type="text" class="form-control" id="nickName" value="${sNickName}" name="nickName" required />
    </div>
    <div class="form-group">
      <label for="name">성명 :</label>
      <input type="text" class="form-control" id="name" value="${vo.name}" name="name" required />
    </div>
    <div class="form-group">
      <label for="email1">Email address:</label>
				<div class="input-group mb-3">
				  <input type="text" class="form-control" value="${email1}" id="email1" name="email1" required />
				  <div class="input-group-append">
				    <select name="email2" class="custom-select">
					    <option value="naver.com" 	<c:if test="${email2=='naver.com'}">selected</c:if>>naver.com</option>
					    <option value="hanmail.net"	<c:if test="${email2=='hanmail.net'}">selected</c:if>>hanmail.net</option>
					    <option value="hotmail.com"	<c:if test="${email2=='hotmail.com'}">selected</c:if>>hotmail.com</option>
					    <option value="gmail.com"		<c:if test="${email2=='gmail.com'}">selected</c:if>>gmail.com</option>
					    <option value="nate.com"		<c:if test="${email2=='nate.com'}">selected</c:if>>nate.com</option>
					    <option value="yahoo.com"		<c:if test="${email2=='yahoo.com'}">selected</c:if>>yahoo.com</option>
					  </select>
				  </div>
				</div>
	  </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">성별 :</span> &nbsp; &nbsp;
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="gender" value="남자" <c:if test="${vo.gender=='남자'}">checked</c:if>>남자
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="gender" value="여자" <c:if test="${vo.gender=='여자'}">checked</c:if>>여자
			  </label>
			</div>
    </div>
    <div class="form-group">
      <label for="birthday">생일</label>
      <%-- <c:set var="now" value="<%=new java.util.Date() %>"/>
      <fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/> --%>
			<input type="date" name="birthday" value="${birthday}" class="form-control"/>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
			      <select name="tel1" class="custom-select">
					    <option value="010"	${tel1=="010" ? selected : ""}>010</option>
					    <option value="02"	${tel1=="02"  ? selected : ""}>서울</option>
					    <option value="031"	${tel1=="031" ? selected : ""}>경기</option>
					    <option value="032"	${tel1=="032" ? selected : ""}>인천</option>
					    <option value="041"	${tel1=="041" ? selected : ""}>충남</option>
					    <option value="042"	${tel1=="042" ? selected : ""}>대전</option>
					    <option value="043"	${tel1=="043" ? selected : ""}>충북</option>
			        <option value="051"	${tel1=="051" ? selected : ""}>부산</option>
			        <option value="052"	${tel1=="052" ? selected : ""}>울산</option>
			        <option value="061"	${tel1=="061" ? selected : ""}>전북</option>
			        <option value="062"	${tel1=="062" ? selected : ""}>광주</option>
					  </select>-
	      </div>
	      <input type="text" name="tel2" value="${tel2}" size=4 maxlength=4 class="form-control"/>-
	      <input type="text" name="tel3" value="${tel3}" size=4 maxlength=4 class="form-control"/>
	    </div> 
    </div>
    <div class="form-group">
      <label for="address">주소</label>
			<input type="hidden" name="address" id="address">
			<div class="input-group mb-1">
				<input type="text" name="postcode" id="sample6_postcode" value="${postcode}" placeholder="우편번호" class="form-control">
				<div class="input-group-append">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
				</div>
			</div>
			<input type="text" name="roadAddress" id="sample6_address" value="${roadAddress}" size="50" class="form-control mb-1">
			<div class="input-group mb-1">
				<input type="text" name="detailAddress" id="sample6_detailAddress" value="${detailAddress}" class="form-control"> &nbsp;&nbsp;
				<div class="input-group-append">
					<input type="text" name="extraAddress" id="sample6_extraAddress" value="${extraAddress}" class="form-control">
				</div>
			</div>
    </div>
    <div class="form-group">
	    <label for="homepage">Homepage address:</label>
	    <input type="text" class="form-control" name="homePage" value="${vo.homePage}" id="homePage"/>
	  </div>
    <div class="form-group">
      <label for="name">직업</label>
      <select class="form-control" id="job" name="job">
        <option value="학생"		${vo.job=="학생" 	? selected : ""}>학생</option>
        <option value="회사원"	${vo.job=="회사원" ? selected : ""}>회사원</option>
        <option value="공무원"	${vo.job=="공무원" ? selected : ""}>공무원</option>
        <option value="군인"		${vo.job=="군인" 	? selected : ""}>군인</option>
        <option value="의사"		${vo.job=="의사" 	? selected : ""}>의사</option>
        <option value="법조인"	${vo.job=="법조인" ? selected : ""}>법조인</option>
        <option value="세무인"	${vo.job=="세무인" ? selected : ""}>세무인</option>
        <option value="자영업"	${vo.job=="자영업" ? selected : ""}>자영업</option>
        <option value="기타"		${vo.job=="기타" 	? selected : ""}>기타</option>
      </select>
    </div>
    <div class="form-group">
			취미 :
<%    for(int i=0; i<hobby.length; i++) { %>
				<input type="checkbox" name="hobby" value="<%=hobby[i]%>" 
<%      if(hobby_.contains(hobby[i])) { %>
						checked
<%     	} %>
				/><%=hobby[i] %>
<%    } %>
    </div>
    <div class="form-group">
      <label for="content">자기소개</label>
      <textarea rows="5" class="form-control" id="content" name="content">${vo.content}</textarea>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">정보공개</span>  &nbsp; &nbsp; 
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="userInfor" value="공개" ${vo.userInfor=="공개" ? 'checked' : ''}/>공개
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="userInfor" value="비공개" ${vo.userInfor=="비공개" ? 'checked' : ''}/>비공개
			  </label>
			</div>
    </div>
    <div  class="form-group">
      회원 사진(파일용량:2MByte이내) : <img src="${ctp}/data/member/${vo.photo}" width="80px"/>
      <input type="file" name="fName" id="file" class="form-control-file border"/>
    </div>
    <button type="button" class="btn btn-secondary" onclick="fCheck()">회원정보수정</button> &nbsp;
    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/memMain.mem';">돌아가기</button>
    <input type="hidden" name="photo"/>
    <input type="hidden" name="email"/>
    <input type="hidden" name="tel"/>
  </form>
  <p><br/></p>
</div>
<br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>