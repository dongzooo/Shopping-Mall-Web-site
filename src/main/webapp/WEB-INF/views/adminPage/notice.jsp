<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- CSS -->
    <link rel="stylesheet" href="/resources/css/adminPage/notice.css">
    <link rel="stylesheet" href="/resources/css/adminPage/common.css">
</head>
<body>
   	<%@ include file="/WEB-INF/views/common/header.jsp" %>	
    <main>
		<%@ include file="/WEB-INF/views/adminPage/common/sideMenu.jsp" %>	
		
        <div class="divider"></div>

        <section class="content-board">
            <div class="title">
                <h2>공 지 사 항</h2>
            </div>

            <div class="board_list_wrap">
                <div class="board_list">
                    <div class="board_list_head">
                        <div class="ch">&nbsp&nbsp</div>
                        <div class="num">No.</div>
                        <div class="tit">제          목</div>
                        <div class="writer">작 성 자</div>
                        <div class="date">작 성 일</div>
                    </div>
                    <div class="board_list_body">
                        <div class="item">
                            <div class="ch"><input type="checkbox"></div>
                            <div class="num">1</div>
                            <div class="tit"><a href="#">안녕하세요~~반갑습니다</a></div>
                            <div class="writer">작성자1</div>
                            <div class="date">2022-01-01</div>
                        </div>
                        <div class="item">
                            <div class="ch"><input type="checkbox"></div>
                            <div class="num">2</div>
                            <div class="tit"><a href="#">동해물과 백두산이 마르고 닳도록</a></div>
                            <div class="writer">작성자2</div>
                            <div class="date">2022-01-02</div>
                        </div>
                        <div class="item">
                            <div class="ch"><input type="checkbox"></div>
                            <div class="num">3</div>
                            <div class="tit"><a href="#">하느님이 보우하사 우리나라 만세</a></div>
                            <div class="writer">작성자3</div>
                            <div class="date">2022-01-03</div>
                        </div>
                        <div class="item">
                            <div class="ch"><input type="checkbox"></div>
                            <div class="num">4</div>
                            <div class="tit"><a href="#">무궁화 삼천리 화려강산~</a></div>
                            <div class="writer">작성자4</div>
                            <div class="date">2022-01-04</div>
                        </div>
                        <div class="item">
                            <div class="ch"><input type="checkbox"></div>
                            <div class="num">5</div>
                            <div class="tit"><a href="#">대한사람 대한으로 길이보전하세</a></div>
                            <div class="writer">작성자5</div>
                            <div class="date">2022-01-05</div>
                        </div>
                        <div class="item">
                            <div class="ch"><input type="checkbox"></div>
                            <div class="num">6</div>
                            <div class="tit"><a href="#">가나다라마바사</a></div>
                            <div class="writer">작성자6</div>
                            <div class="date">2022-01-06</div>
                        </div>
                        <div class="item">
                            <div class="ch"><input type="checkbox"></div>
                            <div class="num">7</div>
                            <div class="tit"><a href="#">아자차카타파하</a></div>
                            <div class="writer">작성자7</div>
                            <div class="date">2022-01-07</div>
                        </div>
                        <div class="item">
                            <div class="ch"><input type="checkbox"></div>
                            <div class="num">8</div>
                            <div class="tit"><a href="#">ABCDEFGHIJKLMNOPQRSTUVWXYZ</a></div>
                            <div class="writer">작성자8</div>
                            <div class="date">2022-01-08</div>
                        </div>
                    </div>
                </div>
                <div class="paging">
                    <a href="#first" class="bt first">
                        <i class="uil uil-angle-double-left"></i>
                    </a>
                    <a href="#prev" class="bt prev">이전 페이지</a>
                    <a href="#1page" class="num">1</a>
                    <a href="#2page" class="num on">2</a>
                    <a href="#3page" class="num">3</a>
                    <a href="#4page" class="num">4</a>
                    <a href="#next" class="bt next">다음 페이지</a>
                    <a href="#last" class="bt last">
                        <i class="uil uil-angle-double-right"></i>
                    </a>
                </div>
                <div class="board_list_btn">
                    <a href="#write" class="write">작성</a>
                    <a href="#modify" class="modify">수정</a>
                    <a href="#cancel" class="cancel">취소</a>
            
                </div>
            </div>
        </section>
    </main>
</body>
</html>