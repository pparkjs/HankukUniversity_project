<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/scholarship.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">장학금</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">장학금 수혜 내역</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">기본 정보</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="myInfo">
					학과:&nbsp;&nbsp;&nbsp;
					<input type="text" class="deptText" value="${std.deptNm }" disabled>
					학번:&nbsp;&nbsp;&nbsp;
					<input type="text" class="noText" id="stdNo" value="${std.stdNo }" disabled>
					이름:&nbsp;&nbsp;&nbsp;
					<input type="text" class="nameText" value="${std.stdNm }" disabled>
					학년:&nbsp;&nbsp;&nbsp;
					<input type="text" class="yearText" value="${std.grade}" disabled>
					상태:&nbsp;&nbsp;&nbsp;
					<c:set value="${std.stdSttsCd}" var="sttsCd"/>
					<input type="text" class="semText" value="${std.stdSttsNm}" disabled>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid pay">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0">
				<h5 class="card-title">유의 사항</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div>
					<span><h5>▶ 교내 등록금 수혜 내역 안내</h5></span>
					<span class="uu">교내 등록금감면 장학금 유의사항을 아래와 같이 안내드리오니 장학대상자는 유의사항의 내용을 모두 필독하여 주시기 바랍니다.<span><br/><br/>
					<span class="uu">장학금을 학생이 개인적으로 수령한 후, 학교로 장학금을 입금한 후 재수령하시기 바랍니다.</span><br/>
					<span class="uu">학교를 통하여 재수령을 하게되면 장학금 수혜사항이 등록되어 추후 장학금 수혜확인서에 나타나게 되므로, </span><br/>
					<span class="uu">학생에게 도움이 될 수 있습니다. </span><br/><br/>
					
					<span><h5>▶ 문의사항: 학생지원팀 교내장학 042-456-7890</h5></span>
					
					<!-- <span><h5>▶ 증명서를 제출(전송)할 경우, 반드시 보안증명서 사용법 파일(.html)과 증명서 파일(.min)을 함께 제출(전송)해주십시요.</h5></span> -->
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row g-2 custom-form">
			<div class="col-md-1">
				<select class="default-select form-control form-control-sm" id="sclsYear">
					<option value="">년도 선택</option>
					<option value="2022">2022학년도</option>
					<option value="2023">2023학년도</option>
				</select>
			</div>
			<div class="col-md-1">
				<select class="default-select form-control form-control-sm" id="sclsSem">
					<option value="">학기 선택</option>
					<option value=1>1학기</option>
					<option value=2>2학기</option>
				</select>
			</div>
			<div class="col-md-2">
				<input type="text" class="form-control input-default form-control-sm" id="sclsNm" placeholder="검색 할 장학명을 입력해주세요"/>
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-sm btn-primary sclsListBtn" onclick="sclsPayListSet()">검색</button>
			</div>
		</div>
	</div>
	
	<div class="container-fluid sclsCF">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">장학금 수혜 내역</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body" id="sclsApPayDiv">
				
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	sclsPayListSet();
})

function sclsPayListSet(){
	console.log("장학금 수혜 내역 리스트...");
	var stdNo = $("#stdNo").val();
	var sclsYear = $("#sclsYear").val();
	var sclsSem = $("#sclsSem").val();
	var sclsNm = $("#sclsNm").val();

	let sclsapPaySearchData = {
		"stdNo": stdNo,
		"sclsYear": sclsYear,
		"sclsSem": sclsSem,
		"sclsNm": sclsNm
	};

	console.log("sclsSearchData",sclsapPaySearchData);

	$.ajax({
		type: "POST",
		url: "/hku/selectSclsapPayList",
		data: JSON.stringify(sclsapPaySearchData),
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(res){
			// alert("수혜내역 아작스 체킁");
			console.log("res",res);

			let totalPayAmt = 0;
			for(let i=0; i<res.length; i++){
				totalPayAmt += parseInt(res[i].sclsAmt);
			}
			totalPayAmt = parseInt(totalPayAmt).toLocaleString();

			tblStr = "";
			tblStr += `<div class='table-wrap'>
				<table class='table' style='margin-top:-22px;'>
						<thead class='thead-dark'>
							<tr>
								<th>#</th>
								<th>학년도</th>
								<th>학기</th>
								<th>학년</th>
								<th>장학명칭</th>
								<th>지급금액</th>
								<th>신청일자</th>
								<th>지급일자</th>
							</tr>
						</thead>
						<tbody>`;
						if(res != null && res.length > 0){

							for(let i=0; i<res.length; i++){
								tblStr += `
								<tr>
									<td>\${i+1}</td>
									<td>\${res[i].sclsapYr} 년도</td>
									<td>\${res[i].sclsapSem} 학기</td>
									<td>\${res[i].grade}</td>
									<td>\${res[i].sclsNm}</td>
									<td>`;
								tblStr += parseInt(res[i].sclsAmt).toLocaleString()
								tblStr += `</td>
									<td>`;
									tblStr += res[i].sclsapDt.substr(0,10);
									tblStr += `</td>
									<td>`;
									tblStr += res[i].sclsapPayDt.substr(0,10);
									tblStr += `</td>
								</tr>`;
							}
						} else {
							tblStr += `<tr>
											<td colspan='8'>검색 내용이 존재하지 않습니다.</td>
								</tr>`;
						}
				tblStr += `<tr>
								<td colspan='5'>합계</td>
								<td>\${totalPayAmt}</td>
								<td colspan='2'></td>
						  </tr>`;
				tblStr += `	</tbody></table></div>`;

				$("#sclsApPayDiv").html(tblStr);			

		},
		error: function(){

		}
	});
}

</script>