<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>page20</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!-- CSS -->
    <link rel="stylesheet" href="/resources/css/adminPage/variables.css">
    <link rel="stylesheet" href="/resources/css/adminPage/common.css">
    <link rel="stylesheet" href="/resources/css/adminPage/memberDetail.css">
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
	<script>
    	window.name = "parentPage";
    </script>
</head>
<body>
   	<%@ include file="/WEB-INF/views/common/header.jsp" %>	
    <main>
		<%@ include file="/WEB-INF/views/adminPage/common/sideMenu.jsp" %>	
		
		<input type="hidden" name="mem_id" id="mem_id"/>
       	<%-- <script type="text/javascript">
       		const urlParams = new URL(location.href).searchParams;
       		let mem_id = urlParams.get('id');
       		console.log(mem_id);
       		let ele_prod = document.getElementById('mem_id');
       		ele_prod.setAttribute('value', mem_id);
     	</script> --%>

        <div class="divider"></div>
        <section class="content-board">
            <div class="title">
                <h2>회원 상세 조회</h2>
            </div>
            <form action='/adminPage/memberModi' method='post'  >
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <table>
                <tr class="attribute">
                    <td>아이디</td>
                    <td>이름</td>
                </tr>
                <tr class="member-value">
                    <td><input type='hidden' name='id' id='id' value='${member.id}'/>${member.id}</td>
                    <td><input type='hidden' name='name' value='${member.name}'/>${member.name}</td>
                </tr>
                <tr class="blank ">
                    <td colspan="2"></td>
                </tr>
                <tr class="attribute">
                    <td>주소</td>
                    <td>연락처</td>
                </tr>
                <tr class="member-value">
                    <td><input type='hidden' name='addr' value='${member.addr}'/>${member.addr}</td>
                    <td><input type='hidden' name='tel' value='${member.tel}'/>${member.tel}</td>
                </tr>
                <tr class="blank ">
                    <td colspan="2"></td>
                </tr>
                <tr class="attribute">
                    <td>현재 포인트</td>
                    <td>포인트 부여</td>
                </tr>
                <tr class="member-value">
                    <td>${member.point}</td>
                    <td>
                        <select name='point'>
                            <option value="0">0 pt</option>
                            <option value="10">10 pt</option>
                            <option value="30">30 pt</option>
                            <option value="50">50 pt</option>
                            <option value="100">100 pt</option>
                        </select>
                    </td>
                </tr>
                <tr class="blank ">
                    <td colspan="2"></td>
                </tr>
                <tr class="attribute">
                    <td>회원 등급</td>
                    <td>판매자 등록 여부</td>
                </tr>
                <tr class="member-value">
                    <td>
                    	<input type='hidden' id="hd" value=''/>
                        <select name="grade" id='grade'>
                            <option value="">회원 등급</option>
                            <option value="4">브론즈</option>
                            <option value="3">실버</option>
                            <option value="2">골드</option>
                            <option value="1">다이아</option>
                        </select>
                    </td>
                    <td>
                        <select name='seller'>
                            <option value="">예/아니오</option>
                            <option value="ROLE_SALESCLERK">예</option>
                            <option value="ROLE_MEMBER">아니오</option>
                        </select>
                    </td>
                </tr>
            </table>
            <div class="detailBtn-group">
                <button class="save detail-btn" type="submit">저장</button>
                <button class="remove detail-btn" type="button">삭제</button>
                <button class="coupon detail-btn" type="button" >쿠폰 지급</button>
                <button class="list detail-btn" type="button" onclick="window.location='/adminPage/memberList'">목록</button>
            </div>
            </form>
        </section>
    </main>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		var nth = "${member.grade}"*-1+5;
    		$("#grade option:eq("+ nth +")").prop("selected", true);
    		
    		$(document).on('click', '.detailBtn-gruop .remove', 
    				function(){
    					$.ajax({
    						type : "post",
    						url : "/adminPage/oneDeleteMem",
    						data : {id : '${member_id}'},
    						success : function(result){
    							console.log("요청 성공");
    							alert("삭제 완료");
    						},
    						error : function(e){
    							console.log("에러 발생");
    							console.log(e);
    							alert("삭제 실패. 다시 시도해주세요.");
    						}
    					})
    				}
    		);
    	});
    	
    	let mem_id = $('#id').val();
    	console.log(mem_id);
    	$(document).on('click','.coupon',function(){
    		let url = "/adminPage/giftCoupon?id="+ mem_id;
    		open(url, "idAvail", "toolbar=no, location=no, status=no, menubar=no, resizable=no, width=450, height=200");
    	});
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>