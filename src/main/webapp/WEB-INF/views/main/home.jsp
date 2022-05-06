<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Document</title>

    <!-- CSS -->
    <link rel="stylesheet" href="/resources/css/main/home.css">

	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />

	<link href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" rel="stylesheet" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>	
    <main>
        <div class="container">
            <div class="upper">
            	<div class="content_title">
                	환경을 생각하다
                </div>
                <div class="content">
					PRECYCLING은 PRE와 RECLYLING의 합성어입니다.<br/>
	                구입부터 배송, 그리고 재활용까지 환경을 생각하며 옷을 판매하고 있습니다.
                </div>
            </div>
            <div class="main-group">
                <div class="menu">
                    <a href="/intro">
                        <span class="material-symbols-outlined" id="icon">contact_support</span>
						<span>Introduction</span>
					</a>
                </div>
                <div class="menu">
               		<a href="/product/list">
                       	<span class="material-symbols-outlined" id="icon">shopping_bag</span>
                       	<span>Shopping</span>
                	</a>
                </div>
                <div class="menu">
                	<a href="#">
						<span class="material-symbols-outlined" id="icon">more</span>
						<span>ETC</span>
                	</a> 
                </div>
            </div>
        </div>
    </main>
</body>
</html>