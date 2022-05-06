<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sign up</title>
 
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- CSS -->
   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />
 
    <link rel="stylesheet" href="/resources/css/member/signup.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>	    
        <div class="signup-wrap">
        	<form action="/member/signup" method="post" name="inputForm">
 		       	<h2>회원 가입</h2>
                <div class="id-wrap">
                    <div class="id-text">
                        아이디
                    </div>
					<div class="id-input">
	                	<input type="text" name="id" id="id" placeholder="아이디 입력" />
	                	<button type="button" class="idCheck" onclick="openIdAvail(this.form)">중복 확인</button> 
	                </div>
                </div>

				<div class="pw-wrap-container">
	                <div class="pw-wrap">
	                	<div class="pw-text">
	                		비밀번호
	                	</div>
	                	<div class="pw-input">
	                    	<input type="password" name="pw" id="pw" placeholder="비밀번호" />
	                    </div>
	                </div>
	                
	                <div class="pw-check-wrap">
	    	            <div class="pw-check-text">
	                    	비밀번호확인
	                    </div>	
	                    <div class="pw-check-input">
	                    	<input type="password" id="pwCheck" placeholder="비밀번호 확인." />
	                    </div>
	                </div>
                </div>

				<div class="name-birth-container">
	                <div class="name-wrap">
	                	<div class="name-text">
		                    이름
						</div>
	                	<div class="name-input">
	                    	<input type="text" name="name" id="name" placeholder="이름" />
	                   	</div>
	                </div>
	                
	                <div class="birth-wrap">
						<div class="birth-text">
		                    생년월일
		                </div>    
	                   	<div class="birth-input">
	                    	<input type="date" name="birthDate" id="birthDate" />
	                    </div>	
	                </div>
				</div>
                
                <div class="email-wrap">
                    <div class="email-text">
                        이메일
                    </div>
                    <div class="email-input">    
                       <input type="text" name="email" class="email" id="email" placeholder="이메일 입력">
					</div>
                </div>

                <div class="phone-container">					
                    <div class="phone-text">
                        휴대전화 인증
                    </div>
                    <div class="phone-input">
                        <input type="text" name="tel" id="tel" placeholder="전화번호 입력" />
                        <button type="button" class="phoneCheck">인증 번호 받기</button>
                    </div>
                </div>

                <div class="phone-container">		
	                <div class="phone-text">
	                    인증 번호 입력
	                </div>
	            	<div class="phone-input">
	                    <input type="text" class="certify" placeholder="인증 번호 입력" />
	                </div>
                </div>

                <div class="addr-wrap">
                    <div class="addr-text">
                        주소
                    </div>
                    <div class="addr-input">
                        <input type="text" name="addr" class="addr" id="addr" placeholder="주소 입력" />
                    </div>
                </div>

                <div class="btn-wrap">
                    <button class="sbt">가입</button>
                    <button onclick="location.href='/'" id="cancel">취소</button>
                </div>
                
                <%-- sec#12. 스프링시큐리티 적용시, post 요청에는 CRSF 토큰 값 보내줘야함. --%>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="idAvailAttemptCnt" id="idAvailAttemptCnt" value="0" />
			</form>
		</div>
    
    <script type="text/javascript">

    	$(document).ready(function(){
    		let formObj = $("form");
			$(".sbt").click(function(e){
				e.preventDefault();
				console.log("pw check");
				var pwOrigin = document.getElementById('pw').value;
				var pwCheck = document.getElementById('pwCheck').value;
				
				var id = document.getElementById('id').value;
				var name = document.getElementById('name').value;
				var birthDate = document.getElementById('birthDate').value;
				var email = document.getElementById('email').value;
				var tel = document.getElementById('tel').value;
				var addr = document.getElementById('addr').value;
				
				var idAvailAttemptCnt = document.getElementById('idAvailAttemptCnt').value;
				
		    	// 비밀번호 확인 체크
				if(pwOrigin != pwCheck){
					alert("비밀번호가 일치하지 않습니다");
					return false;
				}
		    	
		    	// 빈 입력란 체크(입력값이 빈 문자열일 때)
		    	if(id == "" || name == "" || birthDate == "" || email == "" || tel == "" || addr == "") {
					alert("빈 입력란이 존재합니다!");
					return false;
		    	}
		    	
		    	if(idAvailAttemptCnt == "0") {
					alert("아이디 중복 확인을 수행해주세요!");
					return false;
		    	}
		    	
		    	formObj.submit();
			});
    	});
    	

    	
    </script>
    
    <script type="text/javascript">
    	// 인증번호 발송
    	let randNumber;
    	
    	$(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
         });
    	
    	$(document).ready(function(){
    		$(".phoneCheck").click(function(){
    			let tel = $("#tel").val();
    			
    			if(tel == "" || tel == null) {
					alert("휴대전화 번호를 입력하세요!");
					return false;
    			}
    			
    			randNumber = generateRandomCode(4);
    			$.ajax({
    				type : "post",
    				url : "/certify/cellphone",
    				data : {tel : tel, rand : randNumber},
    				success : function(){
    					console.log("요청 성공")
    					alert("인증번호 발송");
    				},
    				error : function(e){
    					console.log("에러 발생");
    					console.log(e);
    					alert("인증번호 발송 실패. 번호를 확인하고 다시 시도해주세요.");
    				}
    			});
    		});
    		
    		// 인증번호 입력 확인 메소드
    		$(".certify").focusout(function(){
    			let cerVal = $(".certify").val();
    			console.log(cerVal)
    			if(!cerVal){
    				alert("인증번호를 입력하세요.")
    			}else if(cerVal != randNumber){
    				alert("인증번호가 틀렸습니다.");
    				$(".certify").val("");
    			}else{
    				alert("휴대전화 인증 되셨습니다.");
    			}
    		});
    	});
    	
    	// 4자리 인증번호 난수 발생 함수
    	function generateRandomCode(n) {
     		  let str = ''
     		  for (let i = 0; i < n; i++) {
     		    str += Math.floor(Math.random() * 10)
     		  }
     		  return str
     		}
    </script>
    
    <script type="text/javascript">
		// jquery
		$(document).ready(function(){
			$("#id").change(function(){ // id 속성 값이 'id'인 태그에 변화가 있을 때 함수 실행해라
				let idVal = $("#id").val();
				//console.log(idVal);
				// ajax로 id 체크 요청하고, 결과 받아서 화면에 결과 뿌리기
				$.ajax({
					type : "post",
					url : "/member/ajaxIdAvail",
					data : {id : idVal},
					success : function(result){
						console.log("요청 성공");
						console.log("result : " + result);
					},
					error : function(e){
						console.log("에러 발생");
						console.log(e);
					}
				});
			});
		});

		// 아이디 중복확인 팝업
		function openIdAvail(inputForm){
			// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
			var popupX = (window.screen.width / 2)- 175;

			// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
			var popupY= (window.screen.height / 2) - 200;
			
			if(inputForm.id.value == "" || !inputForm.id.value){
				alert("아이디를 입력하세요");
				return false;
			}
			
			
					
			let url = "/member/idAvail?id=" + inputForm.id.value;
			open(url, "idAvail", "toolbar=no, location=no, left="+popupX+", top="+popupY+", status=no, menubar=no, resizable=no, width=350, height=200");
		}
	</script>
</body>
</html>