<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list</title>
	
	<link href="/resources/css/board/style.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/adminPage/variables.css">
    <link rel="stylesheet" href="/resources/css/adminPage/common.css">
    <link rel="stylesheet" href="/resources/css/adminPage/notice.css">
    <link rel="stylesheet" href="/resources/css/adminPage/qnaList.css">
    <link href="/resources/css/board/style.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    	window.name = "parentPage";
    </script>
</head>
<body>
   	<%@ include file="/WEB-INF/views/common/header.jsp" %>	
    <main>
        <div class="title">
			<h3>공 지 사 항 </h3>
                
        </div>
	<div class=contents>
	<table class = "boardTable" >
				
			<%-- <tr>
				<td colspan="5" align="left">
					<button onclick="window.location='/board/write'">글작성</button>
				</td>
			</tr>--%>
			<tr class = "tableHeader" >
				<td>No.</td>
				<td>제목</td>
				<td>작성일</td>
				<td>수정일</td>
				<td>카테고리</td>
			</tr>
			<%-- board : BoardVO 객체 담기는 변수 
				 items : 컨트롤러로부터 전달받은 List<BoardVO> 리스트 
						리스트의 요소 개수만큼 자동으로 반복하며, 하나씩 꺼내서 board변수에 체워줌 --%>
			<c:forEach var="board" items="${list}">
				<tr >
					<td>${board.board_no}</td>
					<td ><a class="move" href="${board.board_no}">${board.board_title}</a></td>
					<td><fmt:formatDate value="${board.create_date}" pattern="yyyy-MM-dd" /> </td>
					<td><fmt:formatDate value="${board.update_date}" pattern="yyyy-MM-dd" /></td>
					<td>${board.category}</td>
				</tr>	
			</c:forEach>
			
		</table>
		
		<%-- 공지작성은 관리자만 접근가능함 --%>
		<sec:authorize access="hasRole('ROLE_ADMIN')"> 
			<div class = "buttonWrap">
			<br>
				<button class ="writeBtn"onclick="window.location='/adminPage/notice/write'">공지작성</button>
			</div>
		 </sec:authorize>
	
	
	<div align="center">
		<%-- previous --%>
		<c:if test="${pageMaker.prev}">
			<a class="paging_btn" href="${pageMaker.startPage - 1}" style="color: #77878F">&lt; &nbsp;</a>
		</c:if>
	
		<%-- 페이지번호 --%>
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" >
			 <a class="paging_btn" href="${num}" style="color: #77878F">&nbsp;${num}&nbsp;</a> 
		</c:forEach>
	
		<%-- next --%>
		<c:if test="${pageMaker.next}">
			<a class="paging_btn" href="${pageMaker.endPage + 1}" style="color: #77878F">&nbsp; &gt;</a>
		</c:if>
	</div>
	<br />
	</div>
	
	<%-- 페이지 번호누를때 해당 페이지 요청해줄 숨김 폼태그 --%>
	<form action="/adminPage/notice/list" method="get" id="pagingForm">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
		<input type="hidden" name="listQty" value="${pageMaker.cri.listQty}" />
		<input type="hidden" name="type" value="${pageMaker.cri.type}" />
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />
	</form>
	<br /><br /><br /><br />

	<script>
		$(document).ready(function(){
			// 글작성후 list로 리다이렉트 되었을때 alert 띄워주기 
			let result = "${result}"; 
			checkResult(result); // alert띄울지 함수호출 
			
			// 글작성 처리 post -> 리스트로 이동, alert뜨고 -> content 갔다 "브라우저 뒤로가기" -> alert 뜬다(이상함)
			//			  		<-X-	* 히스토리 삭제 
			history.replaceState({}, null, null); // history 기록 조작 
			
			function checkResult(result) {
				// result값이 없거나 history 기록이 없으면 그냥 함수 종료 
				if(result === "" || history.state){
					return; 
				}
				// result 넘어와서 글 고유번호가 0보다 크면, alert 띄워라 
				if(result == "success"){
					alert("요청처리가 잘 처리되었습니다.");
				}else if(parseInt(result) > 0){
					alert("게시글 " + result + "번이 등록되었습니다.");
				}
			}// checkResult
			
			// 페이지번호 눌렀을때 이동 처리 
			// 숨김 폼태그 가져오기 
			let pagingForm = $("#pagingForm");
			
			$("a.paging_btn").click(function(e){
				e.preventDefault();  // a 태그의 이동하는 기본 기능 없애기
				console.log("a 클릭!!" + e); 
				// 폼태그에서 name속성이 pageNum인 input 태그를찾아 
				//	input tag의 값을 클릭한 a태그의 href 속성값으로 변경 
				// <input value=a의 href값 
				pagingForm.find("input[name='pageNum']").val($(this).attr("href")); 
				pagingForm.submit(); // submit 버튼 누른것과 동일한 효과.
				
			}); // paging_btn click
			
			// 전체글보기 버튼 이벤트 
			$("#allBtn").click(function(e){
				//e.preventDefault(); 
				console.log("전체글보기 btn 클릭!!!");
				pagingForm.find("input[name='pageNum']").val("1"); 
				pagingForm.find("input[name='type']").val("");
				pagingForm.find("input[name='keyword']").val("");
				pagingForm.submit();  // 이동! 
			});
			
			
			// 게시글 제목 클릭시, content 페이지로 이동 처리 
			$(".move").click(function(e){
				e.preventDefault(); 
				// 숨김 폼 태그에 board_no input hidden으로 태그 추가 
				pagingForm.append("<input type='hidden' name='board_no' value='"+ $(this).attr("href") + "' />"); 
				// 폼의 action 속성값 (이동할 주소) content로 변경 
				pagingForm.attr("action", "/adminPage/notice/content"); 
				pagingForm.submit();  // 서브밋! 이동!! 
			});
		
		});// ready
		
	</script>

</body>
</html>