<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/adminPage/variables.css">
    <link rel="stylesheet" href="/resources/css/adminPage/common.css">
    <link rel="stylesheet" href="/resources/css/adminPage/qnaList.css">
    <link href="/resources/css/board/style.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    	window.name = "parentPage";
    </script>
    

</head>
<body>
	<br />
	<%@ include file="/WEB-INF/views/common/header.jsp" %>	
    <main>
		<%@ include file="/WEB-INF/views/adminPage/common/sideMenu.jsp" %>	
		<div class="divider"></div>

        <section class="content-board">
            <div class="title">
                <h2> </h2>
            </div>
	<h1 align="center"> 게시글 삭제 </h1>
	<form action="/adminPage/faq/delete" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table>
			<tr>
				<td> [ #${board.board_no}. ${board.board_title} ] <br />
					이 게시글을 삭제 하시겠습니까?  <br /><br />
					<input type="hidden" name="board_no" value="${board.board_no}" />
					<input type="submit" value="삭제확인" />
					<input type="button" value="취소" onclick="history.back()" />
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>