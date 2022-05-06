<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>page17</title>

    <!-- Iconscout CDN -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    
    <!-- CSS -->
   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />
    
    <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" />
    
    <link rel="stylesheet" href="/resources/css/myPage/cart.css">
    <link rel="stylesheet" href="/resources/css/myPage/common.css">

</head>
<body>
     <%@ include file="/WEB-INF/views/common/header.jsp" %>	    
    <main>
        <div class="main">
			<%@ include file="/WEB-INF/views/myPage/common/sideMenu.jsp" %>
            <div class="divider"></div>
            <section class="content-board">
                <div class="title">
                    <h2 style="margin-left: 3rem;">장바구니</h2>
                </div>
                <table class="table align-middle table-borderless">
                    <tbody>
                        <tr class="border-bottom border-top border-dark">
                            <td>
                                <input type="checkbox" checked />
                            </td>
                            <td>
                                <img src="https://via.placeholder.com/100x120" />
                            </td>
                            <td>상품명</td>
                            <td>사이즈</td>
                            <td>수량</td>
                            <td><button type="button">삭제</button></td>
                        </tr>
                        <tr class="border-bottom border-top border-dark">
                            <td>
                                <input type="checkbox" checked />
                            </td>
                            <td>
                                <img src="https://via.placeholder.com/100x120" />
                            </td>
                            <td>상품명</td>
                            <td>사이즈</td>
                            <td>수량</td>
                            <td><button type="button">삭제</button></td>
                        </tr>
                        <tr class="border-bottom border-top border-dark">
                            <td>
                                <input type="checkbox" checked />
                            </td>
                            <td>
                                <img src="https://via.placeholder.com/100x120" />
                            </td>
                            <td>상품명</td>
                            <td>사이즈</td>
                            <td>수량</td>
                            <td><button type="button">삭제</button></td>
                        </tr>
                        <tr class="border-bottom border-top border-dark">
                            <td>
                                <input type="checkbox" checked />
                            </td>
                            <td>
                                <img src="https://via.placeholder.com/100x120" />
                            </td>
                            <td>상품명</td>
                            <td>사이즈</td>
                            <td>수량</td>
                            <td><button type="button">삭제</button></td>
                        </tr>
                    </tbody>
                </table>
                <div class="pagination-mapper">
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
                </div>
                <div class="order-info border border-dark rounded">
                    <h3>결제 금액: </h3>
                    <div class="order-cost"><h3>00,000</h3></div>
                    <h3>배송비: </h3>
                    <div class="ship-cost"><h3>0,000</h3></div>
                    <button type="button" class="buy-btn">구입하기</button>
                </div>
            </section>
          </div>
    </main>
</body>
</html>