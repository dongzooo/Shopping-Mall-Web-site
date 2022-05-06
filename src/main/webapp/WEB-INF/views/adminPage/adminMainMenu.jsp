<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>page18</title>
    
    <!-- CSS -->
   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
    
   	<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />
    
    <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" />
    
    <link rel="stylesheet" href="/resources/css/adminPage/adminMain.css">
    <link rel="stylesheet" href="/resources/css/adminPage/common.css">

</head>
<body>
 	<%@ include file="/WEB-INF/views/common/header.jsp" %>	
    <main>
        <div class="admin-menu">
            <div class="title" style="font-family: 'Sunflower', sans-serif;  font-weight: 500;">ADMIN PAGE</div>
            <div class="menu container">
                <div class="menu-group1">
                	<div class="home-btn">
                        <a href="/">
                        	<div class="menu_align">
	                            <span class="material-symbols-outlined" id="icon">home</span>        
	                            <span class="btn-box-content">HOME</span>
                            </div>
                        </a>
                    </div>
                    <div class="users-btn">
                        <a href="/adminPage/memberList">
                   	        <div class="menu_align">
								<span class="material-symbols-outlined" id="icon">list_alt</span>
	                            <span class="btn-box-content">회원목록</span>
							</div>
                        </a>
                    </div>
                </div>
                <div class="menu-group2">
                   <div class="announce-btn">
                        <a href="/adminPage/notice">
							<div class="menu_align">
								<span class="material-symbols-outlined" id="icon">content_paste</span>
	                            <span class="btn-box-content">공지사항</span>
                            </div>
                        </a>
                    </div>
					<div class="qna-btn">			
                        <a href="/adminPage/qnaConfig">
                        	<div class="menu_align">
								<span class="material-symbols-outlined" id="icon" style="margin-bottom: 0.4rem;">quiz</span>
	                            <span class="btn-box-content">FAQ/QnA</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>    
        </div>
    </main>
</body>
</html>