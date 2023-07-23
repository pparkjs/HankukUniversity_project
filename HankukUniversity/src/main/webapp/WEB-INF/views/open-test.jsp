<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
<link href="/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/css/test-style.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- jquery 추가 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfobject/2.2.12/pdfobject.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.card{
	margin-top: 128px;
/*     width: 50%; */
    width: 65%; 
    margin-left: 83px;
    margin-right: 82px;
}
</style>
</head>
<body oncontextmenu="return false">
<c:set value="중간고사" var="se"/>
<c:if test="${sessionScope.testVO.testSe == 'final'}">
	<c:set value="기말고사" var="se"/>
</c:if>
<div class="test-wrap">
	<div class="open-header">
		<img alt="" src="/images/로고(마크 가로글씨)2.png" style="width: 203px; height: 194px; position: absolute; top: -45px; left: 20px;">
		<div class="open-title"><c:out value="${sessionScope.testVO.testBgngYmd }"/>&nbsp;&nbsp;<c:out value="${sessionScope.testVO.subNm }"/>&nbsp;&nbsp;<c:out value="${se }"/></div>
		<img alt="" src="/images/시간(화이트).png" style="width: 40px; height: 40px; position: absolute; top: 14px; right: 383px;">
		<div id="timer"></div>
	</div>
	<div id="myPdf" style="width:1300px;height:900px; margin-top: 30px;">
<!-- 		<div class="preview">시험지 미리보기 <br>(파일을 먼저 등록해주세요.)</div> -->
	</div>
	<div class="card" id="card-title-1">
		<div class="card-header border-0 pb-0 ">
			<h1 class="card-title" style="color:#7c0000;  font-weight: 900; font-size: 23px;">답안 작성</h1>
			<div class="cnt">문제 개수 : ${answerList.size() }개</div>
		</div>
		<hr>
		<div class="card-body" style="padding-top: 0px;">
			<div class="omr-wrap">
				<table class="omr">
					<thead>
						<tr>
							<th colspan="<c:out value='${maxCh + 1}'/>">OMR 카드</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${answerList }" var="answer" varStatus="status">
							<tr class="taNo" id="${status.index + 1}">
								<td>${status.index + 1}번</td>
									<c:forEach begin="1" end="${answer.answerCh }" var="i">
										<td><div class="num">${i }</div></td>
									</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="btn-wrap">
				<button type="button" class="btn btn-danger" id="regBtn" style=" padding: 14px 39px; font-size:25px; background: #0070c0; border-color: #0070c0;">
				제출하기
				</button>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
var option = {
		height: "937px",
		pdfOpenParams: {view: 'FitV', page: '1'},
		toolbar:0
}
PDFObject.embed("${sessionScope.testVO.testFile}", "#myPdf", option);

// 타이머 만들기
var totalSeconds = parseInt("${sessionScope.testVO.testTimeLimit}");
// var totalSeconds = 3;
var hours = ""; // 시
var min = ""; //분
var sec = ""; //초
var flag = true; 
var x = setInterval(() => {
	hours = parseInt(totalSeconds / 3600); 
	hours = (hours >= 10) ? hours : "0"+hours
			
	min = parseInt(totalSeconds % 3600 / 60);
	min = (min >= 10) ? min : "0"+min
			
	sec = parseInt(totalSeconds % 60);
	sec = (sec >= 10) ? sec : "0"+sec
			
	document.querySelector("#timer").innerHTML = hours + " : " + min + " : " + sec;
	totalSeconds--;

	if(totalSeconds < 0) {
		clearInterval(x);
		flag = false;
		
		var answerArr = answerArrPush();
		console.log(answerArr);
		studentAnswerInsert(answerArr);

		swal({
			title: "제한시간이 지나  시험을 종료합니다.",
			icon: "error",
			button: "닫기"
		})
		setTimeout(() => {
			window.close();
		}, 1000)
	}
}, 1000);

$(".num").on("click", function(){
	console.log($(this));
	$(this).parents("tr").find(".num").removeClass("num-active");
	$(this).toggleClass("num-active");
})

$("#regBtn").on("click", function(){
	console.log("제출");
	var numActive = $('.num-active').length;
	var taNo = $(".taNo").attr("id");
	console.log(numActive)
	if(numActive != parseInt("${answerList.size()}")){
		swal({
				title: "모든 답안 작성후 제출가능합니다.",
				icon: "warning",
				button: "닫기"
			})
		return false;
	}


    var answerArr = answerArrPush();
    console.log(answerArr);
	
	studentAnswerInsert(answerArr);

})
function studentAnswerInsert(obj){
	console.log("등록");
    $.ajax({
        type: "POST",
        url: "/hku/studentAnswerInsert",
        data: JSON.stringify(obj),
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		contentType: "application/json; charset=utf-8",
        success:function(res){
				if(res === "success"){
					swal({
						title: "답안을 제출하였습니다.",
						icon: "success",
						button: "닫기"
					})
					setTimeout(() => {
						window.close();
					}, 1000)
				}
			}
    });
}

function answerArrPush(){
	var obj = [];
    
	// 문제 번호와 문제 답 json 배열로 담기
    $(".num-active").each(function(i,v){
    var answer = {}; // 답안
        answer.staAns = $(this).text();
        answer.staNo = i + 1;
        obj.push(answer)
    })

	return obj;
}
function noEvent() {
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false
function noEvent() {
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}
document.onkeydown = noEvent;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}
document.onkeydown = noEvent;
</script>
</html>