<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품</title>
	
	<!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<link rel="stylesheet" href="/resources/css/product/goodsPage.css">
	<link rel="stylesheet" href="/resources/css/product/variables.css">
    <link rel="stylesheet" href="/resources/css/product/common.css">
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/product/review_dynamic.css">
    
    <!-- Font Awesome | 별점 아이콘 사용 -->
    <script src="https://kit.fontawesome.com/6dd435ec34.js" crossorigin="anonymous"></script>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<%@include  file="/WEB-INF/views/common/header.jsp" %> <br>
	<div class= "contents review">
		<%@include  file="/WEB-INF/views/product/common/detail_imgs.jsp" %>
		<%@include  file="/WEB-INF/views/product/common/detail_info.jsp" %> <br/><br/><br/><br/><br/>
	   	<%@include  file="/WEB-INF/views/product/common/detail_menu.jsp" %>

		<p class= "reviewName"> 후 기 </p> <br> <br>       
        <form class="container overflow-hidden reviewForm" action="/product/reviewRegPro" method="post" enctype="multipart/form-data">
	        <div class= "row">
	        	<div class="col-10">
		        	<input class = "reviewTitle" type="text" name="title" placeholder="제목을 입력하세요"/> 
	        	</div>
        	<%-- <img class= "scope" src="/resources/images/product/star.png"> --%>
        	<%-- 별점 --%>
	        	<div class="make_star col-2">
		        	<div class="ratingStar" data-rate="3">
		        		<i class="fas fa-star"></i>
		        		<i class="fas fa-star"></i>
		        		<i class="fas fa-star"></i>
		        		<i class="fas fa-star"></i>
		        		<i class="fas fa-star"></i>
		        	</div>
		        </div>
        	</div>
        	<input type="hidden" name="rating" id="ratingHidden" value="0"/>
        	<input type="hidden" class="mem_id" value="${sessionScope.abc}" />
	        <%-- 별 클릭 시 별점 채워지는 기능 --%>
	        <script type="text/javascript">
	        	$(document).ready(function(){
		        	//var rating = $('.make_star .ratingStar');

		        	$(document).on('click', '.reviewForm .ratingStar svg',function(){
		        		var targetNum = $(this).index() + 1;
		        		$('.reviewForm .ratingStar svg').css({color:'#000'});
		        		$('.reviewForm .ratingStar svg:nth-child(-n+' + targetNum + ')').css({color:'#F05522'});
			        	$('#ratingHidden').val(targetNum);
			        	console.log($('#ratingHidden').val());
		        	});
	        	});
	        </script>
        	<textarea class = reviewContent  name="content" placeholder="내용을 입력하세요"></textarea>
        	<%-- URL 파라미터로 넘어오는 상품 prod_num값 가져오기 --%>
        	<input type="hidden" name="prod_num" id="prod_num"/>
        	<input type="hidden" name="pageNum" id="pageNum"/>
        	<script type="text/javascript">
        		const urlParams = new URL(location.href).searchParams;
        		const prod_num = urlParams.get('prod_num');
        		const pageNum = urlParams.get('page');
        		let ele_prod = document.getElementById('prod_num');
        		let ele_prod2 = document.getElementById('pageNum');
        		ele_prod.setAttribute('value', prod_num);
        		ele_prod2.setAttribute('value', pageNum);
        	</script>
        	<div class = "btnWrap">
	       		 <input class = "uploadBtn btn btn-light" type="file" name="img" value="이미지 첨부"/> 
	       		 <input class = "submitBtn  btn btn-secondary" type="submit" value="등록" />
	       	</div>
        </form>
        
        <%-- 리뷰 목록이 뿌려질 공간 --%>
        <div class="reviewTable">
        
        </div>
    	<%-- 페이징 버튼이 뿌려질 공간 --%>
        <div class="paging" aria-label="Page navigation example"></div>
        <%-- 리뷰 수정에 필요한 텍스트 창 불러올 공간 --%>
        <div id="temp"></div>
        
        <%-- JS파일 연결 --%>
        <script type="text/javascript" src="/resources/js/review.js"></script>
        <script type="text/javascript">
        	// 페이징 계산 처리
        	// 한 페이지당 3개의 리뷰를 보여주고 페이지는 5개까지 보여진다.
	        $(document).ready(function(){
	        	let prodNum = $('#prod_num').val();
	        	let page = $('#pageNum').val();
	        	console.log("prodNum: "+prodNum + " pageNum: "+page);
	        	let reviewTable = $('.reviewTable');
	        	let pagingBtn = $('.paging');
	        	let cur = (5*(Math.ceil(page / 5)-1))+1;
	        	let pageCount;
	        	if(page == null){
	        		cur = 1;
	        	}
	        	showList(page);
	        	
	        	function showList(page){
	        		// 현재 품목에 대한 리뷰의 총 개수를 가져와서 그에 맞게 페이징계산과 버튼을 만드는 함수
	        		reviewService.getCount({prodNum : prodNum},
	        				function(data){
	        					if(data == null || data.length == 0){
	        						pagingBtn.html("");
	        						return;
	        					}
	        					pageCount = Math.ceil(data/3);
	        					console.log("pageCount: "+pageCount);
	        					let str = "<ul class='pagination'><li class='page-item'><a class='page-link prev' href='' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
	        					for(let i = cur; i < 5 + cur; i++){
        							if(i > pageCount) break;
        							str += "<li class='page-item'><a class='page-link movePage' data-value='"+ i +"' href=''>"+i+"</a></li>";
        						}
	        					str += "<li class='page-item'><a class='page-link nex' href='' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li></ul>";
	        					pagingBtn.html(str);
	        				}
       				);
	        		
					let img_file_name = "#";
					let img_file_addr = "";
					let str = "";
					// 현재 품목에 대한 리뷰들의 정보를 가져와서 리스트로 만드는 함수
	        		reviewService.getList({prodNum : prodNum, page : page},
	        				function(data){
	        					if(data == null || data.length == 0){
	        						reviewTable.html("");
	        						return;
	        					}

	        					for(let i = 0; i < data.length; i++){
	        						// 해당 리뷰에 대한 이미지 파일들을 불러오는 함수
	        						reviewService.getReviewImg({reviewNum : data[i].review_num},
        		   						function(imgFile){
        		   							console.log("getReviewImg 호출");
        		   							img_file_name = imgFile.img_file_name;
        		   							img_file_addr = imgFile.img_file_addr;
        		   							str = str.replace("https://via.placeholder.com/100x100' class='revImg"+i, "/resources/reviewImg/"+img_file_name+"' class='revImg"+i);
        		   							if(i == data.length-1) reviewTable.html(str);
        		   						}
        							);
	        						str += "<div class='flx'>";
	        						str += "<div class='imgTd'>";
	        						if(img_file_name == "#"){
	        							str += "<img src='https://via.placeholder.com/100x100' class='revImg"+ i +"' ></div>";
	        						}else{
	        							str += "<img src='/resources/reviewImg/"+ img_file_name +"' ></div>";
	        						}
	        						str += "<div class='contentTd'><div class='row'>";
	        						str += "<div class='col-8 text'><b>" + data[i].title + "</b></div>";
	        						str += "<div class='col-4 ratedStar' data-rate='"+ data[i].rating +"'>";
	        						for(let j = 0; j < 5; j++){
	        							if(j < data[i].rating){
	        								str += "<i class='fas fa-star' style='color: #F05522'></i>";
	        							}else {
	        								str += "<i class='fas fa-star'></i>";
	        							}
	        						}
	        						str += "</div></div>";
	        						str += "<div class='text row'><b>" + data[i].prod_num + "</b></div>";
	        						str += "<div class='text row'>" + data[i].content + "</div>";
	        						str += "<div class='row'><div class='col-8 text'>" + reviewService.displayTimeFormat(data[i].update_date) + "</div>";
	        						str += "<div class='col-4'><button type='button' class='btn btn-secondary mod_bt'>수정</button>";
	        						str += "<input type='hidden' class='memIdHidden' value='"+ data[i].mem_id +"'/>";
	        						str += "<input type='hidden' class='reviewNumHidden' value='"+ data[i].review_num +"'/>";
	        						str += "</div></div></div></div>";
	        					}
	        				}
	        		);
	        	} //showList
	        	
	        	// << 버튼 클릭 시 이벤트 처리
		        $(document).on('click', '.prev', function(){
		        	if(cur == 1){
		        		return false;
		        	}
		        	cur -= 5;
		        	$(this).attr("href", "/product/detail_review?prod_num="+ prodNum +"&page="+ cur);
		        });
				
	        	// >> 버튼 클릭 시 이벤트 처리
		        $(document).on('click', '.nex', function(){
		        	if((cur+5) > pageCount){
		        		return false;
		        	}
		        	cur += 5;
		        	$(this).attr("href", "/product/detail_review?prod_num="+ prodNum +"&page="+ cur);
		        });
		        
	        	// 페이지 숫자 버튼 클릭 시 이벤트 처리
		        $(document).on('click', '.movePage', function(){
		        	let pageVal = $(this).data("value");
		        	console.log("pageVal: " + pageVal);
		        	if(pageVal == page){
		        		return false;
		        	}
		        	$(this).attr("href", "/product/detail_review?prod_num="+ prodNum +"&page="+ pageVal);
		        });
		        
	        	// 리뷰 수정 버튼 클릭 시 수정에 필요한 폼태그 보여주는 기능
		        $(document).on('click', '.mod_bt', function(){
		        	let sessionId = $('.mem_id').val();
		        	let reviewId = $(this).next().val();
		        	let reviewTitle = $(this).parent().parent().prev().prev().prev().children().children().text();
		        	let reviewContent = $(this).parent().parent().prev().text();
		        	let reviewRating = $(this).parent().parent().prev().prev().prev().children('.ratedStar').data('rate');
		        	let target = $(this).parent().parent().parent().parent();
		        	let reviewNum = $(this).next().next().val();
		        	let str = "";
		        	console.log(1);
		        	if(sessionId == reviewId){
					    str = "<form class='container overflow-hidden flxMod' action='/product/reviewRegPro' method='post' enctype='multipart/form-data'>";
				        str += "<div class= 'row'><div class='col-10'><input class = 'reviewTitle' type='text' name='title' value='"+ reviewTitle + "'/></div>";
			        	str += "<div class='make_star col-2'><div class='ratingStar1'>";
			        	for(let i = 0; i < 5; i++){
			        		if(i < reviewRating){
			        			str += "<i class='fas fa-star' style='color: #F05522'></i>";
			        		}else {
								str += "<i class='fas fa-star'></i>";
							}
			        	}
			        	str += "</div></div></div>";
			        	str += "<textarea class = reviewContent  name='content'>"+ reviewContent +"</textarea>";
			        	str += "<div class = 'btnWrap'>";
				       	str += "<input class = 'uploadBtn btn btn-light' type='file' name='img' value='이미지 변경'/>";
				        str += "<input class = 'submitBtn1  btn btn-secondary' type='button' value='등록' />";
				       	str += "<input class = 'dltBt1 btn btn-danger' type='button' value='삭제' />";
				       	str += "<input class = 'cancelBt1 btn btn-dark' type='button' value='취소' onclick='window.location.reload()' /></div>";
				       	str += "<input type='hidden' name='rating' id='ratingHidden1' value='"+ reviewRating +"' />"; 
				       	str += "<input type='hidden' name='mem_id' id='mem_id' value='"+sessionId+"' />";
				       	str += "<input type='hidden' name='prod_num' id='prod_num' value='"+ prodNum +"' />";
				       	str += "<input type='hidden' name='review_num' id='review_num' value='"+ reviewNum +"' /></form>";
				       	target.replaceWith($('#temp'));
				       	$('#temp').append(str);
				       	console.log($('#temp .uploadBtn').val());
		        	}
		        });
				// 리뷰 수정에서의 별점 계산
	        	$(document).on('click', '.ratingStar1 svg',function(){
	        		var targetNum = $(this).index() + 1;
	        		$('.ratingStar1 svg').css({color:'#000'});
	        		$('.ratingStar1 svg:nth-child(-n+' + targetNum + ')').css({color:'#F05522'});
		        	$('#ratingHidden1').val(targetNum);
		        	console.log($('#ratingHidden1').val());
	        	});
	        	
				// 수정 버튼 클릭 시 업데이트 진행
	        	$(document).on('click', '.submitBtn1', function(){
	        		$('.flxMod').submit();
	        	});
		        
				// 삭제 버튼 클릭 시 리뷰 삭제
		        $(document).on('click', '.dltBt1', function(){
		        	$('.flxMod').attr('action', '/product/reviewDelete');
		        	$('.flxMod').submit();
		        });
	        });
        </script>
     </div>      

	<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>