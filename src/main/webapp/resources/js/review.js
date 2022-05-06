/*
	리뷰처리용 js파일
*/

console.log("Review JS 모듈..");

var reviewService = (function(){
	// 댓글 개수 가져오기
	function getCount(param, callback, error){
		let prodNum = param.prodNum;
		$.getJSON("/review/pages/" + prodNum + ".json",
				function(data){ if(callback){ callback(data); } })
				.fail(function(xhr, status, e){ if(error){ error(e); } });
	}
        	
    // 전체 댓글 가져오기
	function getList(param, callback, error){
		let prodNum = param.prodNum;
		let page = param.page || 1; // 넘어 온 page가 없으면 1로 사용
		$.getJSON("/review/pages/"+prodNum+"/"+page+".json",
				  function(data){ if(callback){ callback(data); } }) // 요청 성공 시 func실행
				  .fail(function(xhr, status, e){ if(error){ error(e); } }); // 실패 시 fail func 실행
	}
	
	// 리뷰 이미지 가져오기
	function getReviewImg(param, callback, error){
		$.getJSON("/review/imgs/"+param.reviewNum+ ".json",
					function(data){ if(callback){ callback(data); } }) // 요청 성공 시 func실행
				  .fail(function(xhr, status, e){ if(error){ error(e); } }); // 실패 시 fail func 실행
	}
	
	// 시간 포맷팅 함수
	function displayTimeFormat(timeVal) {
		// 오늘 작성된 것은 시간으로, 그 전은 날짜로 표시
		let today = new Date();					// 오늘 날짜
		let diff = today.getTime() - timeVal;	// 시간차 구하기
		let dateObj = new Date(timeVal);		// JS Date 객체로 변경
		if(diff < (1000 * 60 * 60 * 24)) { // diff < 24시간 보다 작으면
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();
			return (hh > 9 ? "" : "0") + hh + ":"
				 + (mi > 9 ? "" : "0") + mi + ":"
				 + (ss > 9 ? "" : "0") + ss;
		}else {
			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth() + 1;
			let dd = dateObj.getDate();
			return yy + "/" + (mm > 9 ? "" : "0") + mm + "/" + (dd > 9 ? "" : "0") + dd;
		}
	}
	
	return {getCount:getCount,
			getList:getList,
			displayTimeFormat:displayTimeFormat,
			getReviewImg:getReviewImg};
})();


var productService = (function(){
	// 상품 썸네일 이미지 가져오기
	function getThumbnail(param, callback, error){
		$.getJSON("/thumbnail/imgs/"+param.prod_num+ ".json",
					function(data){ if(callback){ callback(data); } }) // 요청 성공 시 func실행
				  .fail(function(xhr, status, e){ if(error){ error(e); } }); // 실패 시 fail func 실행
	}
	
	return {getThumbnail: getThumbnail};

})();
