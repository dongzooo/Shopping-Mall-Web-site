<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>ID CHECK</title>
	
    <!-- CSS -->
   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />
 
    <link rel="stylesheet" href="/resources/css/member/idAvail.css">
</head>
<body>
	<%-- 사용 불가 --%>
	<c:if test="${result == 1}">
		<form action="/member/idAvail" method="post" name="checkForm" onsubmit="return inputCheck()">
			<table>
				<tr>
					<td>${trialId}은/는 이미 사용중인 아이디 입니다<br/>
						<input type="text" name="id" id="input-id" />
						<input type="submit" id="sbt" value="아이디 중복 확인" />
					</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</c:if>
	<%-- 사용 가능 --%>
	<c:if test="${result != 1}">
		<table>
			<tr>
				<td>입력하신 아이디는 사용하실 수 있습니다. <br/>
					<input type="button" id="set-btn" value="사용하기" onclick="setId()"/>
				</td>
			</tr>
		</table>
	</c:if>
	
	<script type="text/javascript">
		function inputCheck(){
			let inputForm = document.checkForm;
			if(!inputForm.id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
		}
		
		// 아이디 사용하기 버튼 클릭 시 처리
		function setId(){
			// 팝업을 띄워 준 부모 페이지(opener)에 id 입력란 값을 검증한 id로 바꿔주고
			opener.document.inputForm.id.value = "${trialId}";
			opener.document.inputForm.idAvailAttemptCnt.value = "1";
			// 팝업 닫기
			self.close();
		}
	</script>
</body>
</html>