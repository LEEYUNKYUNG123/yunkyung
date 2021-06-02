<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>


<div class="container">
	<c:if test="${login.m_id == null or login.m_id == ''}">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">덕카 렌트카</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="/">Home</a></li>
				<li><a href="/board/boardList.do">게시판</a></li>
				<li><a href="/member/login.do">로그인</a></li>
				<li><a href="/member/join.do">회원가입</a></li>
			</ul>
		</div>
	</c:if>

	<c:if test="${login.m_id != null and login.m_id != ''}">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">메인</a>
		</div>


		<form class="navbar-form navbar-right">
			<p class="form-control-static">[ ${login.m_name} ]님 반갑습니다</p>
			<button type="button" class="btn btn-success"
				onclick="location.href='/member/logout.do'">로그아웃</button>
			<button type="button" class="btn btn-success"
				onclick="location.href='#'">마이페이지</button>
			<button type="button" class="btn btn-success"
				onclick="location.href='#'">게시판</button>
		</form>
	</c:if>
	<!--/.nav-collapse -->
</div>