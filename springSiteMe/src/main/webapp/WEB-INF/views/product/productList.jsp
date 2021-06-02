<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Login</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/product.js"></script>

<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != "") {
			// 명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
			switch (parseInt(errCode)) {
			case 1:
				alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
				break;
			case 3:
				alert("회원탈퇴에 문제가 있어 정상 처리하지 못하였습니다.\n다시 시도해 주세요");
				break;
			case 6:
				alert("5번이상 로그인 시도로 30초동안 로그인 할 수 없습니다.\n잠시 후 다시 시도해 주세요");
				break;
			}
		}
	}
</script>

<style type="text/css">
/* 가운데 정렬 */
.row {
	padding: 0;
	margin: 0 auto;
	box-sizing: border-box;
	list-style: none;
}

.navbar-collapse {
	position: absolute;
	left: 50%;
	margin-left: -250px;
	font-style: "굴림";
}

.header {
	margin-left: 200px;
}

#secion1 .row {
	width: 100%;
	height: 300px;
	border: 3px solid #400080;
	text-align: center;
}

ul {
	list-style: none;
}

#section1 .row .n {
	float: left;
	width: 300px;
	height: 350px;
	border: 2px solid #c0c0c0;
	margin-top: 100px;
	margin-left: 50px;
	object-fit: cover;
}

.image {
	float: left;
	width: 300px;
	height: 250px;
}
</style>

</head>
<body>
	<div class="well">

		<!-- ======대여/반납시간 검색====== -->
		<div id="productSearch">
			<form id="search" class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-1 control-label">대여</label>
					<div class="col-sm-2">
						<input type="date" id="stDate" name="stDate" class="form-control">
					</div>
					<div class="col-sm-2">
						<!-- 대여시간은 08~19시까지 가능하며 30분 단위로 가능 -->
						<input type="time" id="stTime" name="stTime" class="form-control"
							value="08:00" min="08:00" max="19:00" step="1800">
					</div>
					<label class="col-sm-1 control-label">반납</label>
					<div class="col-sm-2">
						<input type="date" id="enDate" name="stDate" class="form-control">
					</div>
					<div class="col-sm-2">
						<!-- 반납시간은 08~19시까지 가능하며 30분 단위로 가능 -->
						<input type="time" id="enTime" name="enTime" class="form-control"
							value="08:00" min="08:00" max="19:00" step="1800">
					</div>
					&nbsp;&nbsp; <input type="button" value="검색" id="serchBtn"
						class="btn btn-default" />
				</div>
			</form>
		</div>

		<div class="form-group">
				<div id="navbar" class="navbar-collapse ">
					<ul class="nav navbar-nav ">
						<li><a href="/product/전체차종.do">전체차종</a></li>
						<li><a href="/product/경차.do">경차</a></li>
						<li><a href="/board/boardList.do">소형</a></li>
						<li><a href="/gallery/galleryList.do">중형</a></li>
						<li><a href="/member/login.do">대형</a></li>
					</ul>
				</div>
			</div>

			<div class="form-group">
				<section id="section1">
					<%-- <c:choose>
						<c:when test="${model eq 'all'}"> --%>
					<div class="row">
						<ul>
							<!-- /resources/images/thecar/g70.jpg -->
							<li class="n"><a href="상세페이지"><input type="image"
									src="/resources/images/thecar/g70.jpg" class="image"></a>
								G70(가솔린)<br>면책미포함|일반면책포함|고급면책포함<br>대여료
								&nbsp;&nbsp;&nbsp;135,000</li>
							<li class="n"><input type="image"
								src="/resources/images/thecar/k5.png" class="image"></li>
							<li class="n"><input type="image"
								src="/resources/images/thecar/k3.png" class="image"></li>
							<li class="n"><input type="image"
								src="/resources/images/thecar/k7.jpg" class="image"></li>
						</ul>
					</div>
					<div class="row">
						<ul>
							<li class="n"><input type="image" src="#"></li>
							<li class="n"><input type="image" src="#"></li>
							<li class="n"><input type="image" src="#"></li>
							<li class="n"><input type="image" src="#"></li>
						</ul>
					</div>
					<%-- </c:when>
						<c:when test="${model eq 'compact'}">
							<div class="row"></div>
						</c:when>
						<c:when test="${model eq 'small'}">
							<div class="row"></div>
						</c:when>
						<c:when test="${model eq 'middle'}">
							<div class="row"></div>
						</c:when>
						<c:when test="${model eq 'formation'}">
							<div class="row"></div>
						</c:when>
					</c:choose> --%>
				</section>
			</div>
	
	</div>
</body>
</html>