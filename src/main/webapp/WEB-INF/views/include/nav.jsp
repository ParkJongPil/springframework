<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="${ctp}/" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="${ctp}/guest/guestList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Guest</a>
    <a href="#tour" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Board</a>
    <a href="#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Pds</a>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">Study1 <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="${ctp}/study/password/passCheck1" class="w3-bar-item w3-button">암호화연습</a>
        <a href="${ctp}/study/password2/operatorMenu" class="w3-bar-item w3-button">암호화연습2</a>
        <a href="${ctp}/study/password3/aria" class="w3-bar-item w3-button">암호화(ARIA)</a>
        <a href="${ctp}/study/password3/securityCheck" class="w3-bar-item w3-button">암호화(Security)</a>
        <a href="${ctp}/study/ajax/ajaxMenu" class="w3-bar-item w3-button">AJax연습</a>
        <a href="${ctp}/study/mail/mailForm" class="w3-bar-item w3-button">메일연습</a>
        <a href="${ctp}/study/uuid/uuidForm" class="w3-bar-item w3-button">UUID연습</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">Study2 <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="${ctp}/study/fileUpload/fileUpload" class="w3-bar-item w3-button">파일업로드</a>
        <a href="${ctp}/study/password2/operatorMenu" class="w3-bar-item w3-button">연습1</a>
        <a href="${ctp}/study/password2/operatorMenu" class="w3-bar-item w3-button">연습2</a>
        <a href="${ctp}/study/password2/operatorMenu" class="w3-bar-item w3-button">연습3</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">미니쇼핑물 <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="${ctp}/shop/input/goodsMenu" class="w3-bar-item w3-button">대/중/소분류</a>
        <a href="${ctp}/shop/input/productMenu" class="w3-bar-item w3-button">상품메뉴</a>
        <a href="${ctp}/shop/input/optionMenu" class="w3-bar-item w3-button">옵션등록</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">${sNickName} <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="${ctp}/member/memMain" class="w3-bar-item w3-button">회원 메인</a>
        <a href="${ctp}/member/memList" class="w3-bar-item w3-button">회원 리스트</a>
        <a href="${ctp}/member/memUpdate" class="w3-bar-item w3-button">정보 수정</a>
        <a href="javascript:memDeleteCheck()" class="w3-bar-item w3-button">회원 탈퇴</a>
        <c:if test="${sLevel == 0}">
        	<a href="${ctp}/shop/input/optionMenu" class="w3-bar-item w3-button">관리자 메뉴</a>
        </c:if>
      </div>
    </div>
    <c:if test="${empty sLevel}"><a href="${ctp}/member/memLogin" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Login</a></c:if>
    <c:if test="${!empty sLevel}"><a href="${ctp}/member/memLogout" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Logout</a></c:if>
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  </div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="#band" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Guest</a>
  <a href="#tour" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Board</a>
  <a href="#contact" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Pds</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Study</a>
</div>