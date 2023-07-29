<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/test-style.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">시험</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">응시과목정보</a></li>
		</ol>
    </div>
	<div class="container-fluid subCon">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title" style="color: maroon;  font-weight: 900;">응시 과목 정보</h5>
			</div>
			<hr>
			<div class="card-body" id="card-test" style="padding-top: 0px; display: flex;">
	
			</div>
		</div>
	</div>
</div>

<div class="modal fade sModal" id="testModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: 18px; font-weight: 800;">응시 내역</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
				<div class="modal-wrap">
					<div class="modal-title1">
						<span style="font-size: 19px;">시험일자</span>
						<span style="margin-right: 29px; font-size: 19px;">응시일자</span>
					</div>
					<div class="modal-content1">
						<input type="text" class="form-control" id="testDate" readonly>
						<input type="text" class="form-control" id="test-takeDate" readonly>
					</div>
					<div class="modal-title2">
						<span style="font-size: 19px;">총 문제 수</span>
						<span style="margin-right: 13px; font-size: 19px;">맞은개수/틀린개수</span>
						<span style="margin-right: 27px; font-size: 19px;">총점</span>
						<span style="margin-right: 8px; font-size: 19px;">나의점수</span>
					</div>
					<div class="modal-content2">
						<input type="text" class="form-control" id="totalQu" readonly>
						<input type="text" class="form-control" id="cnt" readonly>
						<input type="text" class="form-control" id="scoreSum" readonly>
						<input type="text" class="form-control" id="myScore" readonly>
					</div>
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script>
$(function(){
	testList()
})
var childWindow;

function testList(){
	var cardBody = $("#card-test");

	var obj = {
		stdNo:"${std.stdNo}"
	}
	$.ajax({
		url:"/hku/getTestList",
        type:"get",
        dataType:"json",
		data:obj,
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
        success:function(res){
			console.log(res);
			data = '';
			
			if(res.length > 0){
				for(var i=0; i<res.length; i++){
					data += `<div class="info-wrap">
								<div class="testInfo-con">
									<div class="test-top">
										<img alt="" src="/images/시험지아이콘.png" style="margin-left: 10px; width:28px; height: 28px;">
										<div style="font-weight: 600; margin-left: 12px;" class="subNm">\${res[i].subNm}</div>
									</div>
									<div class="test-middle">
										<div class="middle-content">
											<div class="content-left">`
					if(res[i].testSe == 'middle'){
						data +=						`<img alt="" src="/images/중간문서.png" style="width:100px; height: 107px;">`
					}else{
						data +=						`<img alt="" src="/images/기말문서.png" style="width:100px; height: 107px;">`
					}							
					data +=					`</div>
											<div class="content-right">`
					if(res[i].testSe == 'middle'){
						data +=						`<div class="middle-title">중간고사</div>`
					}else{
						data +=						`<div class="middle-title" style="color:#e46c0a;">기말고사</div>`
					}
					data +=						`<div class="middle-date" id="\${res[i].testBgngYmd}">시험일 : \${res[i].testBgngYmd}</div>
											</div>
										</div>
									</div>
									<div class="test-bottom">
										<div class="bottom-year">개설연도 : \${res[i].lecapYr}년</div>
										<div class="bottom-grade">학년 : \${res[i].subGrade}학년</div>
									</div>
									<div class="test-button">
										<button class="btn btn-primary" value="\${res[i].testNo}" id="testBtn" style="height: 42px; padding: 0px 12px; font-size: 17px; font-weight: 600;">응시하기</button>
										<button class="btn btn-primary"  value="\${res[i].testNo}" id="infoBtn" style="background: #adb17d; border-color: #adb17d; 
										height: 42px; padding: 0px 12px; font-size: 17px; font-weight: 600;">
										응시내역
										</button>
										<input type="hidden" class="testFile" value="\${res[i].testFile}">
										<input type="hidden" class="lecapNo" value="\${res[i].lecapNo}">
										<input type="hidden" class="testSe" value="\${res[i].testSe}">
										<input type="hidden" class="testTimeLimit" value="\${res[i].testTimeLimit}">
										<input type="hidden" class="testBgngYmd" value="\${res[i].testBgngYmd}">
									</div>
								</div>
							</div>`;
				}
				
			}else{
				data += `<h3 style="color: #999393;">응시할 시험이 존재하지 않습니다.</h3>` 	
			}
			
			cardBody.html(data);
			
        }
	})
}


// 시험 응시
$(document).on("click", "#testBtn", function(){
	var middleDate = $(this).parents(".info-wrap").find(".middle-date").attr("id")
	const currentDate = getCurrentDate();
	console.log("현재일자",currentDate);
	console.log("시험일자",middleDate);
	if(middleDate <= currentDate){
		var testNo = $(this).val();
		var testFile = $(this).parents(".test-button").find(".testFile").val();
		var lecapNo = $(this).parents(".test-button").find(".lecapNo").val();
		var testSe = $(this).parents(".test-button").find(".testSe").val();
		var testBgngYmd = $(this).parents(".test-button").find(".testBgngYmd").val();
		var testTimeLimit = $(this).parents(".test-button").find(".testTimeLimit").val();
		var subNm = $(this).parents(".info-wrap").find(".subNm").text();
		var stdNo = "${sessionScope.std.stdNo}";
		
	  	var screenWidth = screen.width;
	  	var screenHeight = screen.height;
	 	 // 새 창의 크기를 브라우저 창과 동일하게 설정합니다.
	 	var windowFeatures = "width=" + 1500 + ",height=" + screenHeight;
	 	windowFeatures += ",left=200";
		
		var preObj = {
			testNo:testNo,
			stdNo:stdNo
		}
	
		$.ajax({
			url:"/hku/preTest-check",
			type:"get",
	        data:preObj,
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success:function(res){
				if(res === "exist"){
					swal({
							title: "이미 시험에 응시하였습니다.",
							icon: "warning",
							button: "닫기"
						})
				}else if(res === "notExist"){
					console.log(testNo, testFile, testSe, lecapNo, subNm, testTimeLimit);
					childWindow = window.open("/hku/open-test?testNo="+testNo+"&testFile="+testFile+"&lecapNo="+lecapNo+"&testSe="+testSe+"&subNm="
								+subNm+"&testTimeLimit="+testTimeLimit+"&testBgngYmd="+testBgngYmd+"&stdNo="+stdNo, "시험지", windowFeatures);
					console.log("윈도우",childWindow)
				}
			}
		})
	}else{
		swal({
			title: "시험일자에 응시하시기 바랍니다.",
			icon: "warning",
			button: "닫기"
		})
	}
	
	
})

// 응시내역 확인
$(document).on("click", "#infoBtn", function(){
	
	
  var infoBtn = $(this);

  // 이미 모달창이 열려있는지 확인
  var modalOpen = $("#testModal").hasClass("show");
  if (!modalOpen) {
	var infoBtn = $(this);
	var testNo = $(this).val();
	var testFile = $(this).parents(".test-button").find(".testFile").val();
	var lecapNo = $(this).parents(".test-button").find(".lecapNo").val();
	var testSe = $(this).parents(".test-button").find(".testSe").val();
	var testBgngYmd = $(this).parents(".test-button").find(".testBgngYmd").val();
	var testTimeLimit = $(this).parents(".test-button").find(".testTimeLimit").val();
	var subNm = $(this).parents(".info-wrap").find(".subNm").text();
	var stdNo = "${sessionScope.std.stdNo}";

	var testObj ={
		testNo:testNo,
        stdNo:stdNo,
		testFile:testFile,
        lecapNo:lecapNo,
        testSe:testSe,
        testBgngYmd:testBgngYmd,
        testTimeLimit:testTimeLimit
	}
	
	var preObj = {
		testNo:testNo,
		stdNo:stdNo
	}

	$.ajax({
		url:"/hku/preTest-check",
		type:"get",
        data:preObj,
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success:function(res){
			if(res === "exist"){
				console.log("체킁1 ",res)
				testRecord(testObj);
				infoBtn.attr("data-bs-toggle", "modal");
				infoBtn.attr("data-bs-target", "#testModal");
				infoBtn.click();
			}else if(res === "notExist"){
				swal({
						title: "시험에 먼저 응시해주시기 바랍니다.",
						icon: "warning",
						button: "닫기"
					})
			}
		}
	})
  }
})
function testRecord(obj){
	
	$.ajax({
		url:"/hku/test-record",
		type:"get",
        data:obj,
		dataType:"json",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			$("#testDate").val(res.testDate);
			$("#test-takeDate").val(res.takeDate);
			$("#totalQu").val(res.taTotal+"개");
			$("#cnt").val(`\${res.answerCnt}개(+) / \${res.wrongCnt}개(-)`)
			$("#scoreSum").val(`\${res.examTotalScore}점`)
			$("#myScore").val(`\${res.myScore}점`)
			console.log("체킁2 : ", res);
			
		}
	})
}

function getCurrentDate() {
	  const currentDate = new Date();
	  const year = currentDate.getFullYear();
	  const month = String(currentDate.getMonth() + 1).padStart(2, '0');
	  const day = String(currentDate.getDate()).padStart(2, '0');
	  
	  return `\${year}-\${month}-\${day}`;
}

if("${msg}" == "exist"){
	swal({
		title: "이미 시험에 응시하였습니다.",
		icon: "warning",
		button: "닫기"
	})
}
</script>