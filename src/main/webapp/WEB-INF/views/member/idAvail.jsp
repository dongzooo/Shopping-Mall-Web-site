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
	<%-- ��� �Ұ� --%>
	<c:if test="${result == 1}">
		<form action="/member/idAvail" method="post" name="checkForm" onsubmit="return inputCheck()">
			<table>
				<tr>
					<td>${trialId}��/�� �̹� ������� ���̵� �Դϴ�<br/>
						<input type="text" name="id" id="input-id" />
						<input type="submit" id="sbt" value="���̵� �ߺ� Ȯ��" />
					</td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</c:if>
	<%-- ��� ���� --%>
	<c:if test="${result != 1}">
		<table>
			<tr>
				<td>�Է��Ͻ� ���̵�� ����Ͻ� �� �ֽ��ϴ�. <br/>
					<input type="button" id="set-btn" value="����ϱ�" onclick="setId()"/>
				</td>
			</tr>
		</table>
	</c:if>
	
	<script type="text/javascript">
		function inputCheck(){
			let inputForm = document.checkForm;
			if(!inputForm.id.value) {
				alert("���̵� �Է��ϼ���.");
				return false;
			}
		}
		
		// ���̵� ����ϱ� ��ư Ŭ�� �� ó��
		function setId(){
			// �˾��� ��� �� �θ� ������(opener)�� id �Է¶� ���� ������ id�� �ٲ��ְ�
			opener.document.inputForm.id.value = "${trialId}";
			opener.document.inputForm.idAvailAttemptCnt.value = "1";
			// �˾� �ݱ�
			self.close();
		}
	</script>
</body>
</html>