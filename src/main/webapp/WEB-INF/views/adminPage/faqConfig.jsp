<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta id="_csrf" name="_csrf"  content="${_csrf.token}"/>
 	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <title>FAQ / QNA</title>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
   <!-- CSS -->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
 	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />
	<link href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" rel="stylesheet" />
    
    <link rel="stylesheet" href="/resources/css/adminPage/common.css">
    <link rel="stylesheet" href="/resources/css/adminPage/faqConfig.css">
    
    <script>
    	window.name = "parentPage";
    </script>
    
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>	
    <main>
		<%@ include file="/WEB-INF/views/adminPage/common/sideMenu.jsp" %>	
 
        <div class="divider"></div>

        <section class="content-board">
            <div class="title">
                <h2>FAQ / QNA </h2>
            </div>

            <div class="board_list_menu">
                <a href="/adminPage/qnaConfig" class="QNA_category">QNA 카테고리</a>
                <a href="/adminPage/faqConfig" class="FAQ_category">FAQ 카테고리</a>
                <a href="/adminPage/board/qnaList" class="QNA_list">QNA 리스트</a>
                <a href="/adminPage/faq/faqList" class="FAQ_list">FAQ 리스트</a>
            </div>

            <div class="board-category-group">
                 <div class="unreg_board_category">
                    <c:forEach var="item" items="${cateTempListFaq}" >
						<p class="cate_list unreg_list" id="unreg${item.category_num}"> ${item.category_name} </p>
                    </c:forEach>
                </div>
                
                <div class="add_remove">
                    <div class="add">
                        <a href="#reg_board_category"></a>
                        <i class="uil uil-angle-right-b"></i>
                    </div>
                    <div class="remove">
                        <a href="#unreg_board_category"></a>
                        <i class="uil uil-angle-left-b"></i>
                    </div>
                </div>
                

                <div class="reg_board_category">
                    <c:forEach var="item" items="${cateList}">
						<p class="cate_list reg_list" id="reg${item.faq_cate_num}"> ${item.faq_cate_name} </p>
                    </c:forEach>
                </div>
            </div>
            
            <!-- 등록 카테고리 값 저장 및 전송용 폼 -->
            <form class="hdn_form" action="/adminPage/faqDeReg" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            	<input type="hidden" name="reg" class="reg" />
            	<input type="hidden" name="reg_index" class="reg_index" />
            </form>

            <div class="board_list_btn">
            	<button type="button" class="cate_btn add" onclick="openFaqAdd()">추가</button>
                <a href="#delete" class="cate_btn delete">삭제</a>
            </div>
            
        </section>
        
        <script type="text/javascript">
        $(document).ajaxSend(function(e, xhr, options) {
    		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
    	});
       		// 카테고리 추가 팝업
       		function openFaqAdd(){
       			let url = "/adminPage/faqAdd";
       			
       			open(url, "FaQAdd", "toolbar=no, location=no, status=no, menubar=no, resizable=no, width=450, height=200");
       		}
       		
       		// 카테고리 클릭 시 색상 변경
       		var unregLinks = document.querySelectorAll('.cate_list');
       		
       		function clickUnregHandler(){
       			for(var i = 0; i < unregLinks.length; i++){
       				unregLinks[i].classList.remove('cate-active');
       			}
       			this.classList.add('cate-active');
       		}
       		
       		for(var i = 0; i < unregLinks.length; i++){
       			unregLinks[i].addEventListener('click', clickUnregHandler);
       		}
       		
       		// 미등록 카테고리 클릭 시 해당 값 가져오기
       		let unreg_val;
       		let unreg_id;
       		$(document).on("click",".unreg_list", function(){
       			unreg_val = $(this).text();
       			unreg_id = $(this).attr('id');
       			console.log("unreg_list : " + $(this).attr('id'));
       		});
       		
       		// 등록 카테고리 클릭 시 해당 값 가져오기
       		let reg_val;
       		let reg_id;
       		$(document).on("click",".reg_list", function(){
       			reg_val = $(this).text();
       			reg_id = $(this).attr('id');
       			console.log("reg_list : " + $(this).attr('id'));
       		});
       		
       		// 등록 화살표 클릭 시 이벤트 처리
       		$('.uil-angle-right-b').click(function(){
       			$.ajax({
       				type : "post",
       				url : "/adminPage/faqReg",
       				data : {unreg : unreg_val, unreg_index : unreg_id},
       				success : function(result){
						console.log("요청 성공");
						window.location.reload();
					},
					error : function(e){
						console.log("에러 발생");
						console.log(e);
					}
       			});
       		});
       		
       		// 등록 해제 화살표 클릭 시 이벤트 처리
       		$('.uil-angle-left-b').click(function(){
       			let formObj = $(".hdn_form");
       			$('.reg').val(reg_val);
       			$('.reg_index').val(reg_id);
       			formObj.submit();
       		});
       		
       		// 삭제 버튼 클릭 시 이벤트 처리
       		$('.delete').click(function(){
       			var cate_selected = document.querySelector('.cate-active');
				if(!cate_selected){
					alert("카테고리를 선택해주세요.");
				}else if(!cate_selected.className.includes("unreg_list")){
					alert("미등록 카테고리를 선택해주시 바랍니다.")
				}else{
					$.ajax({
	       				type : "post",
	       				url : "/adminPage/unregFaqDelete",
	       				data : {unreg : unreg_val,unreg_index : unreg_id},
	       				success : function(result){
	       					alert("삭제 완료");
							console.log("요청 성공");
							window.location.reload();
						},
						error : function(e){
							console.log("에러 발생");
							console.log(e);
						}
	       			});
				}
       		});
       		
        </script>
    </main>
</body>
</html>