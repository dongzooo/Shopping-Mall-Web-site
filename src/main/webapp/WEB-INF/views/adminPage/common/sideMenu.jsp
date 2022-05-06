<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <section class="admin-menu">
     <div class="title">
         <h2>관리자 메뉴</h2>
     </div>
     <div class="btn-group">
     	<div class="menu-warp">	
             <a href="/"  class="my-menu">
                <span class="material-symbols-outlined" id="icon">home</span> 
                 <span>Home</span>
             </a>

             <a href="/adminPage/memberList"  class="my-menu">
				 <span class="material-symbols-outlined" id="icon">list_alt</span>
                 <span>회원 목록</span>
             </a>
         </div>
         
       	<div class="menu-warp">	
             <a href="/adminPage/notice" class="my-menu">
			 	<span class="material-symbols-outlined" id="icon">content_paste</span>
                 <span>공지사항</span>
             </a>
             <a href="/adminPage/qnaConfig" class="my-menu">
			<span class="material-symbols-outlined" id="icon" style="margin-bottom: 0.4rem;">quiz</span>
                 <span>FAQ/QnA</span>
             </a>
         </div>
     </div>
 </section>