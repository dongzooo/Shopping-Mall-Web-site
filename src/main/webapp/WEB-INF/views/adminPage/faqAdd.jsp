<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FAQ Add</title>
	
	<!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<style>
		.row{
			margin: 20px 0;
			padding: 0 40px;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.container{
			display: flex;
			flex-direction: column;
			justify-content: space-around;
		}
		
		.setCatName{
			margin: auto;
			width: 40%;
		}
	</style>
</head>
<body>
	<h3 align="center"> FAQ 카테고리 추가 </h3>
	
	<form class="container" name="fm" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="row gx-4">
			<div class="col">
				카테고리 이름
			</div>
			<div class="col">
				<input type="text" class="catName" name="catName" placeholder="카테고리 입력" />
			</div>
		</div>
		<button type="button" class="setCatName btn btn-danger" onclick="nullCheck()">입력</button>
	</form>
	
	<script type="text/javascript">
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	});
		function nullCheck(){
			let catName = $(".catName").val();
			if(!catName) {
				alert("카테고리를 입력하세요.");
				return false;
			}else{
				$.ajax({
					type : "post",
					url : "/adminPage/faqTempAdd",
					data : {catNameFaq : catName},
					async : false,
					success : function(){
						opener.parent.location.reload();
						self.close();
					},
					error : function(){
						console.log("에러 발생");
						console.log(e);
					}
				});
			}
		}
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>