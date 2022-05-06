<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품</title>

   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />

	<link href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" rel="stylesheet" />
	
	
	<link rel="stylesheet" href="/resources/css/product/goodsPage.css">
    <link rel="stylesheet" href="/resources/css/product/common.css">
    <link rel="stylesheet" href="/resources/css/common/header.css">
    
    <link rel="stylesheet" href="/resources/css/product/review_dynamic.css">
    
    <!-- Font Awesome | 별점 아이콘 사용 -->
    <script src="https://kit.fontawesome.com/6dd435ec34.js" crossorigin="anonymous"></script>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<%@include  file="/WEB-INF/views/common/header.jsp" %> <br/>
	
	<div class= "contents">
		<%@include  file="/WEB-INF/views/product/common/detail_imgs.jsp" %>
		<%@include  file="/WEB-INF/views/product/common/detail_info.jsp" %><br/> <br/> <br/> <br/>                      
		 	
		<div style="margin-left: 7rem; margin-top: -1rem;">
			<p class= "reviewName"> Q N A </p>   
		       
		       <table class="qna" >
				<tr class="gnaHeader">
					<td>No.</td>`
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				<tr >
					<td>1</td>
					<td>상품 결제했는데 배송은 언제오나요?</td>
					<td>테스터1</td>
					<td>작성일</td>
				</tr>	
			</table>
			
			<br>
		
			<div class = "qnaBottom">
				<div class= "btnWrap">
					<button class = "qnaBtn" onclick="window.location=''">글작성</button>
				</div>
	     </div>      
      </div>
 
        </script>
     </div>      	
	

	
	<!-- 	<img class="arrowImg" src="/resources/imgs/arrow.png" />  -->
</body>
</html>