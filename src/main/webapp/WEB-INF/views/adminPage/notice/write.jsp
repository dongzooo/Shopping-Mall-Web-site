<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>write form</title>
	<link href="/resources/css/board/style.css" rel="stylesheet" type="text/css">
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
            
	<br />
	<div class=contents>
		<h3 align="center"> 공지작성 </h3>
		<form action="/adminPage/notice/write" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<br>
			<table class ="write"  >
				<tr>
					<td class="colTitle">유형 </td>
					<td class="colContent">
					<select class = "categoryWrite" name="category">
					<option value="일반" disabled selected style="color : gray ; font-size : 7px;">공지 유형을 선택해 주세요</option>
					  <c:forEach var="item" items="${cate}" >
						<option value="${item.qna_cate_name}"> ${item.qna_cate_name} </option>
             		   </c:forEach>
					</select>
					<br> 
					</td>
				</tr>
				
				<tr>
					<td class="colTitle">제목</td>
					<td class="colContent"><input class = "title" type="text" name="board_title" placeholder="제목을 입력해주세요"/></td>
				</tr>		
				<tr>
					<td class="colTitle">내용</td>
					<td class="colContent"><textarea rows="10" cols="30" class="boardContent" name="board_content" placeholder="문의사항을 입력해주세요"></textarea></td>
				</tr>		
				
				<tr>
					<td colspan="2"> 
						<input class ="saveBtn" type="submit" value="등록" /> &nbsp;&nbsp;
						<input class ="resetBtn" type="reset" value="reset" /> &nbsp;&nbsp;
						<input class ="backBtn" type="button" value="돌아가기" onclick="window.location='/adminPage/notice/list'" />
					</td>
				</tr>
			</table>
		</form>
	</div>


</body> 
</html>