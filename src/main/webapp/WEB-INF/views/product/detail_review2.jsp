<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품</title>
	<link rel="stylesheet" href="/resources/css/product/goodsPage.css">
	<link rel="stylesheet" href="/resources/css/product/variables.css">
    <link rel="stylesheet" href="/resources/css/product/common.css">
    <link rel="stylesheet" href="/resources/css/common/header.css">
</head>

<body>
	<%@include  file="/WEB-INF/views/common/header.jsp" %> <br>
	<div class= "contents">
		<%@include  file="/WEB-INF/views/product/common/detail_imgs.jsp" %>
		<%@include  file="/WEB-INF/views/product/common/detail_info.jsp" %> <br/><br/><br/><br/><br/>
	   	<%@include  file="/WEB-INF/views/product/common/detail_menu.jsp" %>

		<p class= "reviewName"> 후 기 </p> <br> <br>       
        <form action="" method="post" enctype="multipart/form-data">
	        <div class= "review">
	        	<input class = "reviewTitle" type="text" name="title" style="width: 540px;" placeholder="제목을 입력하세요"/> 
	        	<img class= "scope" src="/resources/images/product/star.png">
	        	</br></br>
	        	<textarea class = reviewContent  name="content" placeholder="내용을 입력하세요"></textarea>
	        	<div class = "btnWrap">
		       		 <input class = "uploadBtn" type="button" name="img" value="이미지 첨부"/> 
		       		 <input class = "submitBtn" type="submit" value="등록" />
		       	 </div>
        	</div>
        </form>
        
        <br/> <br/> <br/>
                
        <div class="reviewList" >
        	<div class= "reviewL">
				<img class="reviewImg" src="/resources/images/product/sample.jpg" /> 
			 </div>
			 
			 <div class="reviewDes">
				 <p class="subject"> <b>리뷰주제</b> </p> 
				 <p class="goodsName"> <b>구매품목</b> </p> 
				 <p class="content"> 리뷰내용</p>
				 <p class="date" > 작성일자 </p>
			 </div>
			 
			 <div class= "reviewR">
			 	<img class= "scope" src="/resources/images/product/star.png">
			 	<br><br>
			 	<br><br>
			 	<input class = "modifyBtn" type="button"  value="수정"/> 
		       	<input class = "deleteBtn" type="button" value="삭제" />
			  </div>
		</div>
		
		<br><br><br>
		
		<div class="reviewList" >
        	<div class= "reviewL">
				<img class="reviewImg" src="/resources/images/product/sample.jpg" /> 
			 </div>
			 
			 <div class="reviewDes">
				 <p class="subject"> <b>리뷰주제</b> </p> 
				 <p class="goodsName"> <b>구매품목</b> </p> 
				 <p class="content"> 리뷰내용</p>
				 <p class="date" > 작성일자 </p>
			 </div>
			 
			 <div class= "reviewR">
			 	<img class= "scope" src="/resources/images/product/star.png">
			 	<br><br>
			 	<br><br>
			 	<input class = "modifyBtn" type="button"  value="수정"/> 
		       	<input class = "deleteBtn" type="button" value="삭제" />
			  </div>
		</div>
		
		<br><br><br>
		
		<div class="reviewList" >
        	<div class= "reviewL">
				<img class="reviewImg" src="/resources/images/product/sample.jpg" /> 
			 </div>
			 
			 <div class="reviewDes">
				 <p class="subject"> <b>리뷰주제</b> </p> 
				 <p class="goodsName"> <b>구매품목</b> </p> 
				 <p class="content"> 리뷰내용</p>
				 <p class="date" > 작성일자 </p>
			 </div>
			 
			 <div class= "reviewR">
			 	<img class= "scope" src="/resources/images/product/star.png"> <br/><br/><br/><br/>
			 	<input class = "modifyBtn" type="button"  value="수정"/> 
		       	<input class = "deleteBtn" type="button" value="삭제" />
			  </div>
		</div>
		
		<br><br><br>
		
			<div class= paging>
				<a href="#"> &lt;  </a>
				<a href="#">1 </a>
				<a href="#">2 </a>
				<a href="#">3 </a>
				<a href="#"> &gt;</a>
			</div>
     </div>      
	 
	</br>
	</br>

</body>
</html>