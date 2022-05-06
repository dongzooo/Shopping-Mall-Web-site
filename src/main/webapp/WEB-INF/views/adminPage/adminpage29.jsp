<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Iconscout CDN -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <!-- CSS -->
    <link rel="stylesheet" href="page29.css">
</head>
<body>
    <header>
        <div class="header" > 
            <div class="logo-box">
                <div class="logo-img">
                    <img src="" alt="">
                </div>
                <div class="logo-title">
                    <h1>PRECYCLING</h1>
                </div>
            </div>
            <div class="btn-group">
                <a href="#search">
                    <i class="uil uil-search"></i>
                </a>
                <a href="#user">
                    <i class="uil uil-user-circle"></i>
                </a>
                <a href="#cart">
                    <i class="uil uil-shopping-cart-alt"></i>
                </a>
            </div>
        </div>
    </header>
    <main>
        <section class="admin-menu">
            <div class="title">
                <h2>관리자 메뉴</h2>
            </div>
            <div class="btn-group">
                <div class="home-btn btn-box">
                    <a href="#home">
                        <i class="uil uil-house-user"></i>
                        <h2>Home</h2>
                    </a>
                </div>
                <div class="users-btn btn-box">
                    <a href="#users">
                        <i class="uil uil-users-alt"></i>
                        <h2>회원목록</h2>
                    </a>
                </div>
                <div class="announce-btn btn-box">
                    <a href="#announce">
                        <i class="uil uil-megaphone"></i>
                        <h2>공지사항</h2>
                    </a>
                </div>
                <div class="qna-btn btn-box">
                    <a href="#qna">
                        <i class="uil uil-comment-question"></i>
                        <h2>FAQ/QnA</h2>
                    </a>
                </div>
                <div class="sns-btn btn-box">
                    <a href="#sns">
                        <i class="uil uil-envelope"></i>
                        <h2>Email/SNS</h2>
                    </a>
                </div>
                <div class="policy-btn btn-box">
                    <a href="#policy">
                        <i class="uil uil-comment-alt-edit"></i>
                        <h2>운영방침설정</h2>
                    </a>
                </div>
            </div>
        </section>

        <div class="divider"></div>
        <section class="content-board">
            <div class="email-sms-btn btn-box">
                <div class="Email_SMS_title">
                    <h2>운영방침설정</h2>
                </div>
            </div>
                       
            <div class="point_content1">
                가입 포인트 설정
                <select name="joinpoint" id="" >
                    <option value="no">포인트 양 선택</option>
                    <option value="1000">1000점</option>
                    <option value="2000">2000점</option>
                    <option value="3000">3000점</option>
                </select>
                <button class="send_btn">설정</button>   
            </div>
            <div class="point_content2">
                포인트 지급 설정
                <select name="givepoint" id="" >
                    <option value="no">퍼센트 선택(금액 * 퍼센트)</option>
                    <option value="10%">10%</option>
                    <option value="20%">20%</option>
                    <option value="30%">30%</option>
                    <option value="40%">40%</option>
                    <option value="50%">50%</option>
                    <option value="60%">60%</option>
                    <option value="70%">70%</option>
                    <option value="80%">80%</option>
                    <option value="90%">90%</option>
                    <option value="100%">100%</option>
                </select>
                <button class="send_btn" >설정</button>    
            </div>
            </div>
            
           
            
            
            
            
        </section>

    </main>





</body>
</html>