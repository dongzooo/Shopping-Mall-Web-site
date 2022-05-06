<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>page16</title>

    <!-- Iconscout CDN -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    
    <!-- CSS -->
   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" />    
    
    <link rel="stylesheet" href="/resources/css/myPage/common.css">
    <link rel="stylesheet" href="/resources/css/myPage/couponPoint.css">

</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <main>
        <div class="main">
			<%@ include file="/WEB-INF/views/myPage/common/sideMenu.jsp" %>
	        <div class="divider"></div>
	        <section class="content-board">
	            <div class="title">
	                <h2>쿠폰/포인트</h2>
	            </div>
	            <div class="myCouponPoint">
	                <div class="myCoupon">
	                    <div class="myCouponTitle">
	                        <h2>사용 가능 쿠폰</h2>
	                    </div>
	                    <div class="v-line"></div>
	                    <div class="availCoupon">
	                        <h2>0개</h2>
	                    </div>
	                </div>
	                <div class="myPoint">
	                    <div class="myPointTitle">
	                        <h2>그린 포인트</h2>
	                    </div>
	                    <div class="v-line"></div>
	                    <div class="availPoint">
	                        <h2>0P</h2>
	                    </div>
	                </div>
	            </div>
	            <div class="btn-group">
	                <button type="button" class="coupon-btn btn-box"><h2>쿠폰 조회</h2></button>
	                <button type="button" class="history-btn btn-box"><h2>적립 내역</h2></button>
	                <button type="button" class="point-btn btn-box"><h2>포인트 사용 내역</h2></button>
	                <select class="serchTerm">
	                    <option value="">기간 설정</option>
	                    <option value="1day">1일</option>
	                    <option value="1week">일주일</option>
	                    <option value="1month">1개월</option>
	                    <option value="6month">6개월</option>
	                    <option value="1year">1년</option>
	                    <option value="all">전체 기간</option>
	                </select>
	            </div>
	            <table class="table table-striped">
	                <thead>
	                    <tr>
	                        <td><h5 style="margin-left: -2.7rem;">No.</h5></td>
	                        <td><h5 style="margin-left: -3.7rem;">포인트 내역</h5></td>
	                        <td><h5 style="margin-left: -1rem;">적립일</h5></td>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td><span>1</span></td>
	                        <td><span>+1point</span></td>
	                        <td><span>2022-01-01</span></td>
	                    </tr>
	                    <tr>
	                        <td><span>2</span></td>
	                        <td><span>+1point</span></td>
	                        <td><span>2022-01-02</span></td>
	                    </tr>
	                    <tr>
	                        <td><span>3</span></td>
	                        <td><span>-3point</span></td>
	                        <td><span>2022-01-03</span></td>
	                    </tr>
	                    <tr>
	                        <td><span>4</span></td>
	                        <td><span>+4point</span></td>
	                        <td><span>2022-01-04</span></td>
	                    </tr>
	                    <tr>
	                        <td><span>5</span></td>
	                        <td><span>-5point</span></td>
	                        <td><span>2022-01-05</span></td>
	                    </tr>
	                    <tr>
	                        <td><span>6</span></td>
	                        <td><span>-6point</span></td>
	                        <td><span>2022-01-06</span></td>
	                    </tr>
	                    <tr>
	                        <td><span>7</span></td>
	                        <td><span>+7point</span></td>
	                        <td><span>2022-01-07</span></td>
	                    </tr>
	                </tbody>
	            </table>
	            <ul class="pagination justify-content-center">
	                <li class="page-item">
	                    <a class="page-link" href="#" aria-label="Previous">
	                    <span aria-hidden="true">&laquo;</span>
	                    </a>
	                </li>
	                <li class="page-item"><a class="page-link" href="#">1</a></li>
	                <li class="page-item active"><a class="page-link" href="#">2</a></li>
	                <li class="page-item"><a class="page-link" href="#">3</a></li>
	                <li class="page-item">
	                    <a class="page-link" href="#" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                    </a>
	                </li>
	            </ul>
	        </section>
        </div>
    </main>
</body>
</html>