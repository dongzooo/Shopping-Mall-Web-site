<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품리스트</title>
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
	
	<link rel="stylesheet" href="/resources/css/product/product.css">
    <link rel="stylesheet" href="/resources/css/product/common.css">
    <link rel="stylesheet" href="/resources/css/product/list.css">
    
   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />

	<link href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" rel="stylesheet" />
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
		<div class="upper">
			<%@include  file="/WEB-INF/views/common/header.jsp" %>
			<%@include  file="/WEB-INF/views/product/common/search_upper.jsp" %>
		</div>
		<script type="text/javascript" src="/resources/js/review.js"></script>

		<main>
			<%-- 상품 목록 뿌려질 공간 --%>
			<div class="aa container"></div>
		
			<%-- 페이징 버튼이 뿌려질 공간 --%>
        	<div class="paging" aria-label="Page navigation example"></div>
		</main>
		<div class="uptoScroll"></div>
		
		<%-- URL 파라미터로 넘어오는 카테고리값 가져오기 --%>
		<%-- 카테고리 : 1-아우터, 2-상의, 3-하의 --%>
       	<input type="hidden" name="category" id="category"/>
       	<input type="hidden" name="page" id="page"/>
       	
       	<script type="text/javascript">
      		const urlParams = new URL(location.href).searchParams;
      		const category = urlParams.get('category');
      		let page = urlParams.get('page');
      		console.log("page " + page);
      		let ele_prod = document.getElementById('category');
      		let ele_prod1 = document.getElementById('page');
      		ele_prod.setAttribute('value', category);
      		ele_prod1.setAttribute('value', page);
      		let arr = [];
      		let arr_n = [];
      		let arr_p = [];
      		if(page==null){
      			page=1;
      		}
       	</script>
       	
		<c:forEach items="${list}" var="item" varStatus="status">
			<script type="text/javascript">
				arr.push('${item.prod_num}');
				arr_n.push('${item.prod_name}');
				arr_p.push('${item.prod_price}');
			</script>
		</c:forEach>
		
		<script type="text/javascript">
			let len = arr.length;
			console.log("len: "+ len);

			let str="<ul class='product row'>";
			
			for(var i = 0; i < len; i++){
				if(i % 4 == 0 && i != 0){
					str += "</ul>";
					str += "<ul class='product row'>"
				}else{
					// 상품 상세페이지 경로 설정
					// /product/detail_qna?prod_num='상품번호'
							
					str += "<li class='col-3'><a href='/product/detail_qna?prod_num="+arr[i]+"'><img data-num='"+arr[i]+"' src='/resources/save/' id='"+i+"val'/></a><p>"+arr_n[i]+"<br> <b>"+arr_p[i]+"</b></p></li>";
				}
			}
			str += "</ul>"
			
			$(document).ready(function(){
				show();
				
				$(window).scroll(function(){
					if ($(this).scrollTop() > 100) {
						$('.uptoScroll').fadeIn();
					} else {
						$('.uptoScroll').fadeOut();
						}
					});
				
					//Click event to scroll to top
					$('.uptoScroll').click(function(){
						window.scrollTo(0,0);
						return false;
				});
				
				// DB로 부터 상품 썸네일 받아오기
				function show(){
					for(var i = 0; i < len; i++){
						var count= 0;				
						var prod_num = arr[i];
											
						productService.getThumbnail({prod_num : prod_num},
							function(thum){
								console.log(thum.img_file_name);
						
								str = str.replace("data-num='"+ prod_num +"' src='/resources/save/'", "data-num='"+ prod_num +"'src='/resources/save/"+ thum.img_file_name +"'");
								count++;
								
								console.log(str);
								
								if(count==len){
									$('.aa').append(str);
									console.log(count);
								}
							}
						);
					}
				}
			});
			
			// 페이징 버튼 생성
			let cur = (10*(Math.ceil(page / 10)-1))+1;
			let totPage = Math.ceil('${totPage}'/8);
			

			let strPag = "<ul class='pagination'><li class='page-item'><a class='page-link prev' href='' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";

			for(let i = cur; i < 10 + cur; i++){
				if(i > totPage) break;
				strPag += "<li class='page-item'><a class='page-link movePage' data-value='"+ i +"' href=''>"+i+"</a></li>";
			}
			strPag += "<li class='page-item'><a class='page-link nex' href='' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li></ul>";
			$('.paging').append(strPag);
			
			// '<<' 버튼 클릭 시 이벤트 처리
	        $(document).on('click', '.prev', function(){
	        	if(cur == 1){
	        		return false;
	        	}
	        	cur -= 10;
	        	$(this).attr("href", "/product/list?category='"+ category +"&page="+ cur);
	        });
			
	     	// '>>' 버튼 클릭 시 이벤트 처리
	        $(document).on('click', '.nex', function(){
	        	if((cur+10) > totPage){
	        		return false;
	        	}
	        	cur += 10;
	        	$(this).attr("href", "/product/list?=category="+ category +"&page="+ cur);
	        });
	     	
	     	// 페이지 숫자 버튼 클릭 시 이벤트 처리
	        $(document).on('click', '.movePage', function(){
	        	let pageVal = $(this).data("value");
	        	console.log("pageVal: " + pageVal);
	        	if(pageVal == page){
	        		return false;
	        	}
	        	$(this).attr("href", "/product/list?category="+ category +"&page="+ pageVal);
	        });
		</script>
		
</body>
</html>