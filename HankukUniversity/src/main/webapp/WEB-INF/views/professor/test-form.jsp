<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/test-style.css">
 <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/datepicker-ver2.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfobject/2.2.12/pdfobject.min.js"></script>

<c:set value="출제하기" var="status"/>
<c:if test="${type == 'update' }">
	<c:set value="수정하기" var="status"/>
</c:if>
<c:set value="출제" var="status2"/>
<c:if test="${type == 'update' }">
	<c:set value="상세" var="status2"/>
</c:if>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">클래스룸</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">시험${status2 }</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="padding-top: 10px;">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h1 class="card-title" style="color:#6e6e6e;  font-weight: 900; font-size: 23px;"><c:out value="${sessionScope.subNm }"/> 시험${status2 }</h1>
			</div>
			<hr>
			<div class="card-body" style="padding-top: 0px;">
				<form method="post" action="/hku/test-insert" enctype="multipart/form-data">
					<div class="noti-wrap">
						<span style="padding-bottom: 8px;">[출제자 유의사항]</span>
						<span>▶ 시험지 업로드는 PDF파일만 가능합니다.</span>
						<span>▶ 문제 추가 시 꼭 답안을 작성한 후 출제하시기 바랍니다.</span>
					</div>
					<hr>
					<div>
						<div style="margin-bottom: 6px;"> 
							<span style="margin-left: 69px;">> 시험구분</span>
							<span style="margin-left: 92px;">> 시험일자</span>
							<span style="margin-left: 120px;">> 제한시간</span>
							<span style="margin-left: 291px;">> 시험지 등록</span>
						</div>
						<div class="con-wrap">
							<input type="hidden" name="lecapNo" value="${sessionScope.lecapNo }">
							<c:choose>
								<c:when test="${type == 'update' }">
									<input type="text" class="form-control" id="pTest" name="testSe" value="${test.testSe }" disabled="disabled" style="background: #cccccc;">
									<input type="hidden" name="testNo" value="${test.testNo }">
								</c:when>
								<c:otherwise>
									<select class="form-control" id="pTest" name="testSe">
										<option value="">----선택----</option>
										<option value="middle">중간고사</option>
										<option value="final">기말고사</option>
									</select>
								</c:otherwise>
							</c:choose>
							<input type="text" class="datepicker  form-control" id="test-date" name="testBgngYmd" value="${test.testBgngYmd }" readonly placeholder="날짜 선택">
							<input type="hidden" id="timeLimt" name="testTimeLimit">
							<select class="form-control" id="hours">	
								<option value="">--시--</option>
								<option value="0" <c:if test="${test.hours eq 0 }">selected</c:if>>00 시간</option>
								<option value="3600" <c:if test="${test.hours eq 1 }">selected</c:if>>01 시간</option>
								<option value="7200" <c:if test="${test.hours eq 2 }">selected</c:if>>02 시간</option>
								<option value="10800" <c:if test="${test.hours eq 3 }">selected</c:if>>03 시간</option>
								<option value="14400" <c:if test="${test.hours eq 4 }">selected</c:if>>04 시간</option>
							</select>:
							<select class="form-control" id="minute">
								<option value="">--분--</option>
								<option value="0" <c:if test="${test.minutes eq 0 }">selected</c:if>>00 분</option>
								<option value="600" <c:if test="${test.minutes eq 10 }">selected</c:if>>10 분</option>
								<option value="1200" <c:if test="${test.minutes eq 20 }">selected</c:if>>20 분</option>
								<option value="1800" <c:if test="${test.minutes eq 30 }">selected</c:if>>30 분</option>
								<option value="2400" <c:if test="${test.minutes eq 40 }">selected</c:if>>40 분</option>
								<option value="3000" <c:if test="${test.minutes eq 50 }">selected</c:if>>50 분</option>
							</select>:
							<select class="form-control" id="second">
								<option value="">--초--</option>
								<option value="0" <c:if test="${test.seconds eq 0 }">selected</c:if>>00 초</option>
								<option value="10" <c:if test="${test.seconds eq 10 }">selected</c:if>>10 초</option>
								<option value="20" <c:if test="${test.seconds eq 20 }">selected</c:if>>20 초</option>
								<option value="30" <c:if test="${test.seconds eq 30 }">selected</c:if>>30 초</option>
								<option value="40" <c:if test="${test.seconds eq 40 }">selected</c:if>>40 초</option>
								<option value="50" <c:if test="${test.seconds eq 50 }">selected</c:if>>50 초</option>
							</select>
							
							<input type="file" class="form-control" id="test-file" name="pdfFile">
							
							<button type="button" class="btn btn-danger" id="regBtn" style=" margin-bottom: 12px; 
							margin-left: 29px; padding: 8px 15px; background: #0070c0; border-color: #0070c0;">
							${status }
							</button>
							<a href="/hku/professor/classroomMain/${sessionScope.lecapNo }" class="btn btn-danger" id="regBtn" style=" margin-bottom: 12px; 
							margin-left: 16px; padding: 8px 15px; background: #ff4343; border-color: #ff4343;">
							뒤로가기
							</a>
							
						</div>
					</div>
					<hr>
					<div class="answer-wrap">
						<div id="myPdf" style="width:800px;height:900px;">
							<div class="preview">시험지 미리보기 <br>(파일을 먼저 등록해주세요.)</div>
						</div>
						<div class="hidden"></div>
						<div style="padding-left: 20px; width: 50%;"> 
							<button type="button" class="btn btn-primary" id="addBtn" style="margin-bottom: 12px; margin-top: 12px; padding: 8px 15px;">답안추가</button>
							<button type="button" class="btn btn-danger light" id="delBtn" style="margin-bottom: 12px; margin-top: 12px; padding: 8px 15px; margin-left: 30px;">답안삭제</button>
							<div id="answer-container">
								<c:choose>
									<c:when test="${msg == 'exist' || msg == 'failed' || msg == 'notFile' || type == 'update'}">
										<c:forEach items="${test.answerList }" var="answer" varStatus="status">
											<div style="display: flex; align-items: center; margin-top: 20px;" class="aw-wrap">
												<input type="hidden" class="form-control aw" name="answerList[${status.index }].taNo" value="${status.index+1}">
												<span style="width: 73px; text-align:center;">${status.index+1}번 답 :</span> <input type="text" class="form-control aw" value="${answer.taAns }" name="answerList[${status.index }].taAns">
												<span style="width: 73px; text-align:center;">배점 :</span> <input type="text" class="form-control aw" value="${answer.taScr }" name="answerList[${status.index }].taScr" placeholder="숫자만 입력">
												<span style="width: 73px; text-align:center;">선지수 :</span> <input type="text" class="form-control aw" value="${answer.answerCh }" name="answerList[${status.index }].answerCh" placeholder="숫자만 입력">
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div style="display: flex; align-items: center; margin-top: 20px;" class="aw-wrap">
											<input type="hidden" class="form-control aw" name="answerList[0].taNo" value="1">
											<span style="width: 73px; text-align:center;">1번 답 :</span> <input type="text" class="form-control aw" name="answerList[0].taAns">
											<span style="width: 73px; text-align:center;">배점 :</span> <input type="text" class="form-control aw" name="answerList[0].taScr" placeholder="숫자만 입력">
											<span style="width: 73px; text-align:center;">선지수 :</span> <input type="text" class="form-control aw" name="answerList[0].answerCh" placeholder="숫자만 입력">
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	
})
var addBtn = document.querySelector("#addBtn");
var delBtn = document.querySelector("#delBtn");
var answerCon = $("#answer-container");

if("${msg}" == "exist" || "${msg}" == "failed" || "${msg}" == "notFile" || "${type}" == "update" || "${msg}" == "update-failed"){
	if("${msg}" == "exist"){
		swal({
			title: "이미 출제한 시험입니다.",
			icon: "error",
			button: "닫기"
		})
	}else if("${msg}" == "failed"){
		swal({
			title: "시험 출제에 실패하였습니다. 다시 시도해주세요.",
			icon: "error",
			button: "닫기"
		})
	}else if("${msg}" == "notFile"){
		swal({
			title: "파일이 존재하지 않습니다. 다시 시도해주세요.",
			icon: "error",
			button: "닫기"
		})
	}else if("${msg}" == "update-failed"){
		swal({
			title: "업데이트에 실패하였습니다. 다시 시도해주세요.",
			icon: "error",
			button: "닫기"
		})
		
	}
	var awNumber = parseInt("${cnt}") + 1;
}else{
	var awNumber = 2;
	console.log("넘버 : ", awNumber)
}

addBtn.addEventListener("click", addAnswerDiv);
delBtn.addEventListener("click", delAnswerDiv);

// 시험 출제 버튼 클릭 시 유효성 검사후 출제
$("#regBtn").on("click", function(){
	var pTest = $("#pTest").val();
    var testDate = $("#test-date").val();
    var hours = $("#hours").val();
    var minute = $("#minute").val();
    var second = $("#second").val();
    var answerCh = $("#answerCh").val();
	var aw = $(".aw");
    var testFile = $("#test-file")[0].files[0];

	console.log(pTest, testDate, hours, minute, second, answerCh)
	console.log(aw);

	if(pTest == "" || pTest == null){
		swal({
			title: "시험구분을 선택해주세요",
			icon: "error",
			button: "닫기"
		})
		return false;
	}

	if(testDate == "" || testDate == null){
		swal({
			title: "시험일자를 선택해주세요.",
			icon: "error",
			button: "닫기"
		})
		return false;
	}

	if(hours == "" || hours == null){
		swal({
			title: "시간을 선택해주세요.",
			icon: "error",
			button: "닫기"
		})
		return false;
	}

	if(minute == "" || minute == null){
		swal({
			title: "분을 선택해주세요.",
			icon: "error",
			button: "닫기"
		})
		return false;
	}

	if(second == "" || second == null){
		swal({
			title: "초를 선택해주세요.",
			icon: "error",
			button: "닫기"
		})
		return false;
	}

	var timeSum = parseInt(hours) + parseInt(minute) + parseInt(second);
	console.log("시간 더하기 : ", timeSum);

	$("#timeLimt").val(timeSum);
	console.log("잘 들어갔나?",$("#timeLimt").val());

	if("${type}" == "update"){
		$("form").attr("action", "/hku/test-update")
	}else{
		if(testFile == "" || testFile == null){
			swal({
				title: "파일을 등록해주세요.",
				icon: "error",
				button: "닫기"
			})
			return false;
		}
	}

	var cnt = 0;
	for(var i = 0; i < aw.length; i++){
		if(aw.eq(i).val() == "" || aw.eq(i).val() == null){
			cnt++;
		};
	}
	if(cnt > 0){
		swal({
			title: "비어있는 답안 작성 칸을 채워주세요.",
			icon: "error",
			button: "닫기"
		})
	}
	
	
	$("form").submit();

})

// 시험 문제 추가 함수
function addAnswerDiv(){
	data = `<div style="display: flex; align-items: center; margin-top: 20px;" class="aw-wrap">
				<input type="hidden" class="form-control aw" name="answerList[\${awNumber - 1}].taNo" value="\${awNumber}">
				<span style="width: 73px; text-align:center;">\${awNumber}번 답 :</span> <input type="text" class="form-control aw" name="answerList[\${awNumber - 1}].taAns">
				<span style="width: 73px; text-align:center;">배점 :</span> <input type="text" class="form-control aw" name="answerList[\${awNumber - 1}].taScr"  placeholder="숫자만 입력">
				<span style="width: 73px; text-align:center;">선지수 :</span> <input type="text" class="form-control aw" name="answerList[\${awNumber - 1}].answerCh"  placeholder="숫자만 입력">
			</div>`
	awNumber++;
	answerCon.append(data);
}

function delAnswerDiv(){
	if(awNumber == 2){
		return false;
	}
	$(".aw-wrap").last().remove();
	awNumber--;
	
}
var option = {
		height: "900px",
		pdfOpenParams: {view: 'FitV', page: '1'},
		toolbar:0
}

if("${type}" == "update"){
	PDFObject.embed("${test.testFile}", "#myPdf", option);
	setTimeout(() => {
		$(".hidden").css("display","block");	
	}, 150);
}

$("#test-file").on("change", function(event){
	var files = event.target.files;
	var file = files[0];
	console.log(file);
	
	if(isPdfFile(file)){
		var formData = new FormData();
		formData.append("file", file);

		var file = event.target.files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			PDFObject.embed(e.target.result, "#myPdf", option);
			setTimeout(() => {
				$(".hidden").css("display","block");	
			}, 150);
		}
		reader.readAsDataURL(file);
	}else{
		swal({
            title: "PDF 파일을 선택해주세요.",
            icon: "error",
            button: "닫기"
        })
		$("#test-file").val("");
	}
})

function isPdfFile(file){
// 우리는 pop()을 이용해서 .구분자 바로 뒤에 녀석을 꺼내겠다라는 방법론을 선택함 (파일 확장자)
	var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.

	// 확장자 중 이미지에 해당하는 확장자가 아닌경우 포함되어 있는 문자가 없으니까 -1(false)가 리턴
	// 확장자 중 이미지 확장자가 포함되어 있다면 0보다 큰 수 일테니 true가 리턴
	return ($.inArray(ext, ["pdf"]) === -1) ? false : true; 
}



$.datepicker.setDefaults({
	closeText: "닫기",
	prevText: "이전달",
	nextText: "다음달",
	currentText: "오늘",
	monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
		"7월", "8월", "9월", "10월", "11월", "12월"
	],
	monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
		"7월", "8월", "9월", "10월", "11월", "12월"
	],
	dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
	dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
	dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
	weekHeader: "주",
	dateFormat: "yy-mm-dd", // 날짜형태 예)yy년 m월 d일
	firstDay: 0,
	isRTL: false,
	showMonthAfterYear: true,
	yearSuffix: "년"
})

$(".datepicker").datepicker({
    minDate: 0
})

</script>