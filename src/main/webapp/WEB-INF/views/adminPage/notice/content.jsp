<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<meta id="_csrf" name="_csrf"  content="${_csrf.token}"/>
 	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	
	<title>content</title>
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
		<%@ include file="/WEB-INF/views/adminPage/common/sideMenu.jsp" %>	
		<div class="divider"></div>

        <section class="content-board">
            <div class="title">
                
            </div>
            
	<div class = "contents">
		<h1 align="center"> 공지 내용 </h1>
		<table width = "500" style= "border-bottom: 1px  solid black; border-top :1px  solid black;  " >
			<tr style= " height:40px;  ">
				<td class="colTitle">제목</td>
				<td> <b>${board.board_title}</b> </td>
			</tr>
			<tr style= " height:40px;  ">
				<td class="colTitle">카테고리</td>
				<td class="colContent"><b>${board.category}<b></td>
			</tr>
			<tr style= " height:40px;  ">
				<td class="colTitle">수정일</td>
				<td class="colContent"><fmt:formatDate value="${board.update_date}" pattern="yyyy-MM-dd HH:mm"  /></td>
			</tr>
			<tr>
				<td class="colTitle">내용</td>
				<td class="colContent"><textarea class="boardContent" rows="10" cols="30" disabled>${board.board_content}</textarea></td>
			</tr>
			<tr style= " height:40px;  ">
				<td colspan="2"class="colContent">
				<%-- 공지 수정 삭제는 관리자만 접근가능함 --%>
				<sec:authorize access="hasRole('ROLE_ADMIN')">  
					<button class="btn" id="modifyBbtn" data-oper="modify" >수정</button>&nbsp;&nbsp;
					<button class="btn" id="deleteBtn"  data-oper="delete">삭제</button>&nbsp;&nbsp;
				</sec:authorize>
					<button class="btn" id="backBtn" data-oper="list" >리스트</button>
				</td>
			</tr>
		</table>
		
		<form action="/adminPage/notice/modify" method="get" >
			<input type="hidden" name="board_no" value="${board.board_no}" />
			<input type="hidden" name="pageNum" value="${cri.pageNum}" />
			<input type="hidden" name="listQty" value="${cri.listQty}" />
			<input type="hidden" name="type" value="${cri.type}" />
			<input type="hidden" name="keyword" value="${cri.keyword}" />

		</form>
		<br />
	
			
			
		</div>
	</div>
	<br /><br />
	<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script type="text/javascript">	
	$(document).ready(function(){
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
		
		
	</script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		// 숨김 폼태그 가져오기 
		let formObj = $("form"); 
		$("button.btn").click(function(e){
			e.preventDefault(); 
			let operation = $(this).data("oper");
			
			if(operation === 'delete'){
				formObj.attr("action", "/adminPage/notice/delete"); 
			}else if(operation === 'list'){
				formObj.attr("action", "/adminPage/notice/list"); 
			}
			
			formObj.submit(); // 이동 
			
		}); 
	}); 
	</script>
	
	

</body>
</html>