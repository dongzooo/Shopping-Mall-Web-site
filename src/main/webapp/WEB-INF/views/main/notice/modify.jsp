<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="/resources/css/board/style.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- CSS -->
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
            	<div class=contents>
		<h1 align="center"> 공지 수정 </h1>
		<form action="/adminPage/notice/modify" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<table  style= "width = 500; border-bottom: 1px  solid black; border-top :1px  solid black;  ">
				<tr style= " height:40px;  ">
					<td class="colTitle">글번호</td>
					<td class="colContent"><input type="text"  class = "title" name="board_no" value="${board.board_no}" readonly /></td>
					<%--<td><input type="text" name="board_title" value='<c:out value="${board.board_no}"/>' readonly /></td>  --%>
				</tr>		
				<tr style= " height:40px;  ">
					<td class="colTitle">제목</td>
					<td class="colContent"><input type="text"  class = "title" name="board_title"  value="${board.board_title}" /></td>
				</tr>		
				<tr style= " height:40px;  ">
					<td class="colTitle">내용</td>
					<td><textarea rows="10" cols="30" class="boardContent" name="board_content">${board.board_content}</textarea></td>
				</tr>		
				<tr style= " height:40px;  ">
					<td class="colTitle">카테고리</td>
					<td>
						<select class = "categoryWrite" name="category">
							  <option value="일반" disabled selected style="color : gray ; font-size : 7px;">공지 유형을 선택해 주세요</option>
							  <c:forEach var="item" items="${cate}" >
						<option value="${item.qna_cate_name}"> ${item.qna_cate_name} </option>
             		   </c:forEach>
						</select>
					</td>
				</tr>
				<tr style= " height:40px;  ">
					<td class="colTitle">작성일</td>
					<td><fmt:formatDate value="${board.create_date}" pattern="yyyy-MM-dd HH:mm:SS" /></td>
				</tr>
				<tr style= " height:40px;  ">
					<td class="colTitle">수정일</td>
					<td><fmt:formatDate value="${board.update_date}" pattern="yyyy-MM-dd HH:mm:SS" /></td>
				</tr>
				<tr style= " height:40px;  ">
					<td colspan="2"class="colContent">
						<button class="btn" id="modifyBbtn" data-oper="modify" >수정</button>&nbsp;&nbsp;
						<button class="btn" id="deleteBtn"  data-oper="delete">삭제</button>&nbsp;&nbsp;
						<button class="btn" id="backBtn" data-oper="list" >리스트</button>
				</td>
				</tr>
			</table>
		</form>
	</div>
		
	<script>
	$(document).ready(function(){
		let formObj = $("form"); 
		$("button").click(function(e){
			e.preventDefault(); 			
			let operation = $(this).data("oper");
			if(operation === 'delete') {
				formObj.attr("action", "/adminPage/notice/delete"); // 삭제폼 GET 
				formObj.attr("method", "get"); // form 태그에 method를 post로 해놓아서 
												// 전송전에 get방식으로 변경 
			}else if(operation === 'list'){
				formObj.attr("action", "/adminPage/notice/list"); // 게시판리스트 GET
				formObj.attr("method", "get");
			}
			formObj.submit();
		});
	});
	</script>
	</main>

</body>
</html>