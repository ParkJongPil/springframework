<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memInfor.jsp</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<body>
<c:if test="${sLevel != 0}">
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<jsp:include page="/WEB-INF/views/include/slide2.jsp"/>
</c:if>
<p><br/></p>
<div class="container">
  <h2>회원 정보 상세보기</h2>
  <br/>
  <table class="table">
    <tr><td>아이디 : ${vo.mid}</td></tr>
    <tr><td>별명 : ${vo.nickName}</td></tr>
    <tr><td>성명 : ${vo.name}</td></tr>
    <tr><td>성별 : ${vo.gender}</td></tr>
    <tr><td>생일 : ${vo.birthday}</td></tr>
    <tr><td>전화번호 : ${vo.tel}</td></tr>
    <tr><td>주소 : ${vo.address}</td></tr>
    <tr><td>이메일 : ${vo.email}</td></tr>
    <tr><td>홈페이지 : ${vo.homePage}</td></tr>
    <tr><td>직업 : ${vo.job}</td></tr>
    <tr><td>취미 : ${vo.hobby}</td></tr>
    <tr><td>자기소개 : <br/>${fn:replace(vo.content,newLine,'<br/>')}</td></tr>
    <tr><td>등급 : ${vo.strLevel}</td></tr>
    <tr><td>총방문횟수 : ${vo.visitCnt}</td></tr>
    <tr><td>가입일자 : ${vo.startDate}</td></tr>
    <tr><td>마지막방문일자 : ${vo.lastDate}</td></tr>
    <tr><td>오늘방문횟수 : ${vo.todayCnt}</td></tr>
    <tr><td>사진 : <img src="${ctp}/data/member/${vo.photo}" width="100px"/></td></tr>
  </table>
  <hr/>
  <p>
    <input type="button" value="돌아가기" onclick="history.back()" class="btn btn-secondary"/>
  </p>
</div>
<p><br/></p>
<c:if test="${sLevel != 0}">
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</c:if>
</body>
</html>