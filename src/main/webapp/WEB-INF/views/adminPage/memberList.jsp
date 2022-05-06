<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>page19</title>
    
    <!-- CSS -->
    <link rel="stylesheet" href="/resources/css/adminPage/common.css">
    <link rel="stylesheet" href="/resources/css/adminPage/memberList.css">

   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
    <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" />
	
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
   	<%@ include file="/WEB-INF/views/common/header.jsp" %>	
    <main>
		<%@ include file="/WEB-INF/views/adminPage/common/sideMenu.jsp" %>	

        <div class="divider"></div>
        <section class="content-board">
            <div class="title">
                <h2>회원 목록</h2>
            </div>
            <table class="table">
                <thead>
                    <tr class="table-secondary">
                        <td style="margin-left: -2.3em;">No.</td>
                        <td style="margin-left: -4.5rem;">아이디</td>
                        <td style="margin-left: -3.5rem;">포인트</td>
                        <td style="margin-left: -2.8rem;">가입일</td>
                        <td style="margin-left: -1rem;">생일</td>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${memberList}" var="member" varStatus="index">
	        	        <tr>
	                        <td class="no"><c:out value="${index.count}"/></td>
	                        <td class="id"><a href="${member.id}" class="move"><c:out value="${member.id}"/></a></td>
	                        <td class="point"><c:out value="${member.point}"/></td>
	                        <td class="date"><c:out value="${fn:substring(member.joinDate,0,10)}"/> </td>
	                        <td class="date"><c:out value="${fn:substring(member.birthDate,0,10)}"/></td>
	                    </tr>
                	</c:forEach>
                </tbody>
            </table>
                        <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>

			<%-- 페이지 번호누를때 해당 페이지 요청해줄 숨김 폼태그 --%>
			<form action="#" method="get" id="pagingForm">

			</form>
             
        </section>
    </main>
    <script type="text/javascript">
		let pagingForm = $("#pagingForm");
	
		$(".move").click(function(e){
			e.preventDefault(); 
			// 숨김 폼 태그에 bno input hidden으로 태그 추가 
			pagingForm.append("<input type='hidden' name='id' value='"+ $(this).attr("href") + "' />"); 
			// 폼의 action 속성값 (이동할 주소) content로 변경 
			pagingForm.attr("action", "/adminPage/memberDetail"); 
			pagingForm.submit();  // 서브밋! 이동!! 
		});
    </script>
</body>
</html>