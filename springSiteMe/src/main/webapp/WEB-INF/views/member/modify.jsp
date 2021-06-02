<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>회원 정보 수정</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />


<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/modify.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != "") {
			switch (parseInt(errCode)) {
			case 1:
				alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
				break;
			case 2:
				alert("회원정보 수정에 오류가 발생하였습니다. \n잠시 후 다시 진행해 주세요.");
				break;
			case 3:
				// alert창 띄우고 확인 클릭시 메인 페이지로 이동
				alert("회원정보 수정이 완료 되었습니다.");
				location.href = "/";
				break;
			}
		}
	}
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="well">
			<form id="memberForm" class="form-horizontal">
				<input type="hidden" name="idx" id="idx" required
					value="${member.m_no}" />
				<div class="form-group form-group-sm">
					<label for="m_id" class="col-sm-2 control-label">사용자 ID</label>
					<div class="col-sm-3">${member.m_id}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="oldUserPw" class="col-sm-2 control-label">기존
						비밀번호</label>
					<div class="col-sm-3">
						<input type="password" id="oldUserPw" name="oldUserPw"
							maxlength="15" required class="form-control"
							placeholder="기존 비밀번호 입력">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="m_pw" class="col-sm-2 control-label">변경할 비밀번호</label>
					<div class="col-sm-3">
						<input type="password" id="m_pw" name="m_pw" maxlength="15"
							class="form-control" required placeholder="변경할 비밀번호 입력">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userPwCheck" class="col-sm-2 control-label">변경할
						비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" id="userPwCheck" name="userPwCheck"
							maxlength="15" class="form-control" required
							placeholder="변경할 비밀번호 입력 확인">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="m_phone" class="col-sm-2 control-label">전화번호</label>
					<div class="col-sm-3">
						<input type="text" id="m_phone" name="m_phone" maxlength="15"
							class="form-control" value="${member.m_phone}">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="m_gender" class="col-sm-2 control-label">성별</label>
					<div class="col-sm-3">
						<div class="col-sm-3">
							<!-- JSTL : m_gender의 equals값이 F면 '남자' W면 '여자' 출력 -->
							<c:choose>
								<c:when test="${member.m_gender eq 'F'}">남자</c:when>
								<c:when test="${member.m_gender eq 'W'}">여자</c:when>
								<c:otherwise>
       						오류 발생!
   						 	</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="m_brd" class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-3">${member.m_brd}-******</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="m_name" class="col-sm-2 control-label">회원 이름</label>
					<div class="col-sm-3">
						<input type="text" id="m_name" name="m_name" maxlength="20"
							class="form-control" value="${member.m_name}">
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="m_add" class="col-sm-2 control-label">회원 주소</label>
					<div class="col-sm-3">
						<input type="text" id="m_add" name="m_add" maxlength="100"
							class="form-control" value="${member.m_add}">
					</div>
				</div>


				<div class="form-group form-group-sm">
					<label for="m_email" class="col-sm-2 control-label">회원 이메일</label>
					<div class="col-sm-3">
						<input type="text" id="m_email" name="m_email" maxlength="100"
							class="form-control" value="${member.m_email}">
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label">자동차 운전 면허증</label>
					<div class="col-sm-3">
						<input type="text" id="m_dlnum" name="m_dlnum" maxlength="10"
							class="form-control" value="${member.m_dlnum}">
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label">면허증 발급일자</label>
					<div class="col-sm-3">
						<input type="text" id="m_stDate" name="m_stDate" maxlength="8"
							class="form-control" value="${member.m_stDate}">
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label">면허증 만료일자</label>
					<div class="col-sm-3">
						<input type="text" id="m_enDate" name="m_enDate" maxlength="8"
							class="form-control" value="${member.m_enDate}">
					</div>
				</div>


				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" value="확인" id="modify"
							class="btn btn-default" /> <input type="button" value="재작성"
							id="modifyReset" class="btn btn-default" /> <input type="button"
							value="취소" id="modifyCancel" class="btn btn-default" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
