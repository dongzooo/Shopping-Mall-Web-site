<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta id="_csrf" name="_csrf"  content="${_csrf.token}"/>
 	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	<title>Insert title here</title>
	
	<!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<input type="hidden" class="reg" value="${reg}" />
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	<script type="text/javascript">
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	});
		let reg = $(".reg").val();
		$.ajax({
			type : "post",
			url : "/adminPage/qnaConfig",
			data : {catName : reg},
			async : false,
			success : function(){
				console.log("요청 성공" + reg);
				window.location.href="/adminPage/qnaConfig"
			},
			error : function(){
				console.log("에러 발생");
				console.log(e);
			}
		});
	</script>
</body>
</html>