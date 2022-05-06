<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<section class="mypage">
    <div class="title">
        <h2>판매자 페이지</h2>
    </div>
    <div class="btn-group">
        <div class="menu-warp">
            <a href="/" class="my-menu">
                <span class="material-symbols-outlined" id="icon">home</span>        
                <span>Home</span>
            </a>
            <a href="#" class="my-menu">
                <span class="material-symbols-outlined" id="icon">list_alt</span>
                <span>주문내역</span>
            </a>
        </div>
        <div class="menu-warp">
            <a href="/myPage/cart" class="my-menu">
                <span class="material-symbols-outlined" id="icon" style="margin-bottom: 0.4rem;">shopping_basket</span>
                <span>장바구니</span>
            </a>
            <a href="/myPage/couponPoint" class="my-menu">
                <span class="material-symbols-outlined" id="icon" style="margin-bottom: 0.4rem;">savings</span>
                <span>쿠폰/포인트</span>
            </a>
        </div>
        <div class="menu-warp">
            <a href="/member/modify" class="my-menu">
                <span class="material-symbols-outlined" id="icon">update</span>
                <span>정보 수정</span>
            </a>
            <a href="/member/delete" class="my-menu">
                <span class="material-symbols-outlined" id="icon" style="margin-bottom: 0.4rem;">delete</span>
                <span>회원 탈퇴</span>
            </a>
        </div>
    </div>
</section>