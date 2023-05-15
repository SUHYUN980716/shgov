<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
  <div class="container-fluid">
  	<a href="/"><img src="/resources/static/image/logo.svg" alt="" height="55px" style="margin-right:20px;margin-left:50px"></a>
    <b><a class="navbar-brand">shgov</a></b>에 오신걸 환영합니다.
    <sec:authorize access="isAuthenticated()">
    	<sec:authentication property="principal.member.userName"/>님 어서오세요.
    </sec:authorize>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-right:50px">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
      <sec:authorize access="isAnonymous()">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/member/register">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/member/login">로그인</a>
        </li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/member/logout">로그아웃</a>
        </li>
        </sec:authorize>
        <li class="nav-item">
          <a class="nav-link" href="/board/boardList">정책자료실</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/board/noticeList">공지사항</a>
        </li>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	관리자메뉴
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/admin/boardAdd">정책자료실 관리</a></li>
            <li><a class="dropdown-item" href="/admin/noticeAdd">공지사항 관리</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/admin/userList">회원 관리</a></li>
          </ul>
        </li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	사용자 메뉴
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <sec:authorize access="isAuthenticated()">
		    	<sec:authentication property="principal.member.userId" var="userId"/>
		    </sec:authorize>
            <li><a class="dropdown-item" href="/member/myPage?userId=${userId}">회원정보 관리</a></li>
          </ul>
        </li>
       </sec:authorize>
      </ul>
    </div>
  </div>
</nav>