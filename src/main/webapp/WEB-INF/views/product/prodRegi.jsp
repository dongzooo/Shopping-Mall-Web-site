<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Product Registration</title>
	
	<!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<!-- CSS -->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
    <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />
        
    <link rel="stylesheet" href="/resources/css/product/common.css">
    <link rel="stylesheet" href="/resources/css/product/prodRegi.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<main>
		<%@ include file="/WEB-INF/views/sellerPage/common/sideMenu.jsp" %>
        <div class="divider"></div>	
		<form class="mypage" action="/product/prodRegi?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
            <div class="title">
                <h2>상품 등록</h2>
            </div>
			<div class="input_row">
				<div class="col-4">
					카테고리 선택
				</div>
				<div class="col-8">
					<select class="data_prod" name="category_code" required>
						<option value="">상품 카테고리</option>
						<option value="1">Outer</option>
						<option value="2">Top</option>
						<option value="3">Bottom</option>
					</select>
				</div>	
			</div>
			<div class="input_row">
				<div class="col-4">
					상품 이름
				</div>
				<div class="col-8">
					<input class="data_prod" type="text" name="prod_name" required />
				</div>
			</div>
			<div class="input_row">
				<div class="col-4">
					상품 가격
				</div>
				<div class="col-8">
					<input class="data_prod" type="text" name="prod_price" required />
				</div>
			</div>
			<div class="input_row">
				<div class="col-4">
					상품 재고량
				</div>
				<div class="col-8">
					<input class="data_prod" type="text" name="prod_stock" required />
				</div>
			</div>
			<div class="input_row"  style="margin-top: 0.5rem;">
				<div class="col-4">
					상품 이미지
				</div>
				<div class="col-8">
					<input type="file" name="multiFileList" id="fileUpload" multiple="multiple"/>
				</div>
			</div>
			<div  class="input_row">
				<div class="thumb-nail">
					썸네일 선택
				</div>
				<div id="tagArea" class="col-8">
				</div>
			</div>
			
			<%-- 업로드할 이미지 개수 만큼 라디오 버튼을 만들고 선택한 이미지는 썸네일로 지정 --%>
			<script type="text/javascript">
				const fileInput = document.getElementById("fileUpload");
				fileInput.onchange = () => {
					const selectedFile = [...fileInput.files];
					var len = selectedFile.length;
					<%-- 이미지 개수 최대 5개 제한 --%>
					if(len > 5){
						alert('이미지는 최대 5개까지 업로드 가능합니다.');
						$('#fileUpload').val('');
						return false;
					}
					let tagArea = $("#tagArea");
					let str = "";
					for(let i = 0; i < len; i++){
						str += "<input type='radio'name='thumbNail' id='thumbFileName' value='" + selectedFile[i].name + "'/>" + selectedFile[i].name;
					}
					tagArea.html(str);
				}
			</script>
			
			<div class="input_row">
				<div class="col-4">
					상품 상세정보
				</div>
				<div class="col-8">
					<textarea name="prod_desc" rows="10" required></textarea>
				</div>
			</div>
			<div class="btn-wrap">	
				<button class="sbt" type="submit">등록</button>
				<button class="cancel" type="button" onclick="window.location.href='/'">취소</button>
			</div>
		</form>
	</main>
</body>
</html>