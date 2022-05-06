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
    <link rel="stylesheet" href="/resources/css/member/modify.css">

   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />
    
    <link rel="stylesheet" href="/resources/css/member/modify.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>	    

	<div class="modify">
       	<form action="/member/modify" method="post" id="inputForm">
			<h2>회원정보 수정</h2>
            <div class="id-wrap">
                <div class="id-text">
                     아이디
                </div>
				<div class="id-input">
                       <input type="text" id="id" value="${member.id}"  readonly="readonly">
               </div>
            </div>

			<div class="pw-wrap-container">
				<div class="pw-wrap">
					<div class="pw-text">
						비밀번호
					</div>
					<div class="pw-input">
						<input type="password" name="pw" id="pw" placeholder="비밀번호" required>
					</div>
				</div>
            
				<div class="pw-check-wrap">
					<div class="pw-check-text">
						비밀번호확인
					</div>	
					<div class="pw-check-input">
						<input type="password" id="pwCheck" placeholder="비밀번호 확인." required>
					</div>
				</div>
			</div>
			<div class="name-birth-container">
                <div class="name-wrap">
                	<div class="name-text">
	                    이름
					</div>
                	<div class="name-input">
                    	<input type="text" name="name" id="name" value="${member.name}" readonly="readonly">
                   	</div>
                </div>
                                                             
               	<div class="birth-wrap">
					<div class="birth-text">
	                    생년월일
	                </div>    
                   	<div class="birth-input">
                    	<input type="text" id="birth" value="${member.birthDate}" readonly="readonly">
					</div>	
            	</div>
			</div>
               
			<div class="email-wrap">
            	<div class="email-text">
                	이메일
            	</div>
            <div class="email-input">    
            	<input type="text" name="email" id="email" placeholder="이메일 입력">
			</div>
		</div>

	         <div class="phone-container">					
	             <div class="phone-text">
	                 휴대전화
	             </div>
	             <div class="phone-input">
	                 <input type="text" name="tel" id="tel" placeholder="전화번호 입력">
	             </div>
	         </div>

	        <div class="addr-container">
	            <div class="addr-text">
	                주소
	            </div>
	            <div class="addr-input">
	                <input type="text" name="addr" id="addr" placeholder="주소 입력">
	            </div>
	        </div>
	
	        <div class="item-bottom">
	            <button class="sbt">SUBMIT</button>
	            <button onclick="location.href='/'" id="cancel">CANCEL</button>
	        </div>
               
           	<%-- sec#12. 스프링시큐리티 적용시, post 요청에는 CRSF 토큰 값 보내줘야함. --%>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
    <script type="text/javascript">	
    	// 비밀번호 확인 체크
    	$(document).ready(function(){
    		let formObj = $("form");
			$(".sbt").click(function(e){
				e.preventDefault();
				console.log("pw check");
				var pwOrigin = document.getElementById('pw').value;
				var pwCheck = document.getElementById('pwCheck').value;
				
				if(pwOrigin != pwCheck){
					alert("비밀번호가 일치하지 않습니다");
					return false;
				}else{
					formObj.submit();
					return true;
				}
			});
    	});
    </script>
</body>
</html>