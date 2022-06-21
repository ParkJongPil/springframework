<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memLogin.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
<p><br/></p>
<div class="container">
	<div class="modal-dialog">
	  <div class="modal-content">
		  <div class="container p-3 border">
			  <form name="myForm" method="post" class="was-validated">
			    <h2>회원 로그인</h2>
			    <p>회원 아이디와 비밀번호를 입력해 주세요</p>
			    <div class="form-group">
			      <label for="mid">회원 아이디 :</label>
			      <input type="text" class="form-control" name="mid" id="mid" value="${mid}" placeholder="아이디를 입력하세요." required autofocus />
			      <div class="valid-feedback">입력성공</div>
			      <div class="invalid-feedback">회원 아이디는 필수 입력사항입니다.</div>
			    </div>
			    <div class="form-group">
			      <label for="pwd">비밀번호 : </label>
			      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요." required />
			      <div class="invalid-feedback">비밀번호는 필수 입력사항입니다.</div>
			    </div>
			    <div class="form-group">
				    <button type="submit" class="btn btn-secondary btn-sm">로그인</button> &nbsp;
				    <button type="reset" class="btn btn-secondary btn-sm">취소</button> &nbsp;
				    <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/';">돌아가기</button> &nbsp;
				    <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/member/memJoin';">회원가입</button>
			    </div>
			    <div class="row" style="font-size:12px">
			      <span class="col"><input type="checkbox" name="idCheck" checked /> 아이디 저장</span>
			      <span class="col"><a href="#" data-toggle="modal" data-target="#myModal">아이디찾기</a> /
			                        <a href="#" data-toggle="modal" data-target="#myModal">비밀번호찾기</a></span>
			    </div>
			  </form>
		  </div>
	  </div>
	</div>
</div>

<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">아이디/비밀번호 찾기</h4>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body">
        <p>아이디나 비밀번호를 찾으시려면 기존에 가입하셨던 이메일 주소를 이용하여 새롭게 비밀번호 설정을 하실수 있습니다.</p>
      </div>
      <div class="modal-footer">
      	<!-- modal창을 통한 이동시는 url패턴을 이용해서 이동해야 한다. -->
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.href='${ctp}/member/memIdPwdSearch';">아이디/비밀번호찾기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>