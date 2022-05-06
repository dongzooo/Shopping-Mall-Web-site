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
	
    <link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
 	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />
	<link href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" rel="stylesheet" />
  

	<link href="/resources/css/faq/style.css" rel="stylesheet" type="text/css">
<link href="/resources/css/board/style.css" rel="stylesheet" type="text/css">
   <link rel="stylesheet" href="/resources/css/adminPage/variables.css">
    <link rel="stylesheet" href="/resources/css/adminPage/common.css">
    <link rel="stylesheet" href="/resources/css/adminPage/faqList.css">
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
                <h2>FAQ / QNA </h2>
            </div>

            <div class="board_list_menu">
                <a class="QNA_category" onclick="window.location='/adminPage/qnaConfig'">QNA 카테고리</a>
                <a class="FAQ_category" onclick="window.location='/adminPage/faqConfig'">FAQ 카테고리</a>
                <a class="QNA_list" onclick="window.location='/adminPage/board/qnaList'">QNA 리스트</a>
                <a  class="FAQ_list" onclick="window.location='/adminPage/faq/faqList'">FAQ 리스트</a>
            </div>
	<br />
	<div class=contents>
		<h2 align="center"> 문의 작성 </h2>
		<form action="/adminPage/faq/write" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<br>
			<table class ="write"  >
				<tr>
					<td class="colTitle">유형 </td>
					<td class="colContent">
					<select class = "categoryWrite" name="category">
					<option value="일반" disabled selected style="color : gray ; font-size : 7px;">문의 유형을 선택해 주세요</option>
					  <c:forEach var="item" items="${cate}" >
						<option value="${item.faq_cate_name}"> ${item.faq_cate_name} </option>
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
						<input class ="backBtn" type="button" value="돌아가기" onclick="window.location='/adminPage/faq/faqList'" />
					</td>
				</tr>
			</table>
		</form>
	</div>


</body> 
</html>