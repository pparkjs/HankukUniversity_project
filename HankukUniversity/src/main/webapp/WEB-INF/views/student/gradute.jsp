<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<style>
.custom-tab-1 .nav-link:focus, .custom-tab-1 .nav-link:hover, .custom-tab-1 .nav-link.active {
    font-weight: 700;
}
.nav-link {
    color: rgba(0,0,0,0.85);
}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">학적</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">졸업</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title" style="color: #800000; font-weight: 700;">기본사항</h5>
			</div>
			<div style="margin-top: 10px;">
				<div class="col-xl-12" style="margin-left: 40px;">
						<table class="table" style="margin-top: 0px; margin-bottom: 0px; width: 95%;">
							<thead class="thead-dark">
								<tr>
									<th style="width: 120px;">과정</th>
									<th style="width: 120px;">입학</th>
									<th style="width: 150px;">학번</th>
									<th style="width: 140px;">이름</th>
									<th style="width: 120px;">상태</th>
									<th style="width: 180px;">학과</th>
									<th style="width: 120px;">계열</th>
								</tr>
							</thead>
							<tbody id="tBody">
								<tr>
									<td>일반</td>
									<td>신입</td>
									<td>${student.stdNo }</td>
									<td>${student.stdNm } </td>
									<td>${student.comCdNm1 }</td>
									<td>${student.deptNm }</td>
									<td>공학</td>
								</tr>
							</tbody>
						</table>
							<table class="table" style="margin-top: -20px; margin-bottom: 0px; width: 95%;">
							<thead class="thead-dark">
								<tr>   
									<th style="width: 10%;">주야</th>
									<th style="width: 10%;">학년</th>
									<th style="width: 10%;">학제</th>
									<th style="width: 36%;" colspan="3">졸업기준</th>
									<th style="width: 36%;" colspan="3">이수학점</th>
								</tr>
							</thead>
							<tbody id="tBody" style="margin-top: -30px;">
								<tr>
									<td rowspan="2">주 </td>
									<td rowspan="2">4 </td>
									<td rowspan="2">4 </td>
									<th>전공 </th>
									<th>교양 </th>
									<th>졸업학점 </th>
									<th>전공 </th>
									<th>교양 </th>
									<th>총학점 </th>
								</tr>
								<tr>
									<td>70</td>
									<td>50</td>
									<td>130</td>
									
									<td>${student.stdMjrCrd }</td>
									<td>${student.stdCtrlCrd }</td>
									<td id="res"> </td>
								</tr>
							</tbody>
						</table>
					</div>
			</div>
				
			<div class="col-xl-12">
				<div class="custom-tab-1" style="margin-left:20px;">
					<ul class="nav nav-tabs" style="margin-bottom: 40px">
						<li class="nav-item">
							<a class="nav-link active" data-bs-toggle="tab" href="#home1"> <i class="fa-solid fa-user-plus me-2"></i> 졸업유예</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-bs-toggle="tab" href="#profile1"><i class="far fa-user me-2"></i> 조기졸업</a>
						</li>
					</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="home1" role="tabpanel">
						<div class="col-xl-12">
							<div class="row">
								<div class="col-md-12">
									졸업유예 신청
									<form name="form1" id="form1">
										  <div class="row" style="margin: 5px; margin-left: 0px;">
											    <div style=" display: flex; justify-content: space-between;">
											      <div class="input-group">
											        <label for="stdNm" style="font-size: 20px; margin-top: 8px;">이름</label> &nbsp; &nbsp;
											        <input type="text" class="form-control" value="${student.stdNm }" name="stdNm" readonly="readonly">
											      </div>
											      <div class="input-group">
											        <label for="deptNm" style="font-size: 20px; margin-top: 8px;">학과</label>&nbsp; &nbsp;
											        <input type="text" class="form-control" value="${student.deptNm }" name="deptNm" readonly="readonly">
											      </div>
											      <div class="input-group">
											        <label for="stdNo" style="font-size: 20px; margin-top: 8px;">학번</label>&nbsp; &nbsp;
											        <input type="text" class="form-control" value="${student.stdNo }" name="stdNo" readonly="readonly">
											      </div>
											      <div class="input-group">
													<div style="font-size: 20px;">
														<label style="font-size: 20px; margin-top: 8px;">끝년도</label>&nbsp; &nbsp;
													</div>
													<select class="default-select form-control" name="changeEndYr">
														<option value="">년도 선택</option>
															<option value="2023">2023</option>
													        <option value="2024">2024</option>
													        <option value="2025">2025</option>
													        <option value="2026">2026</option>
													        <option value="2027">2027</option>
													        <option value="2028">2028</option>
													        <option value="2029">2029</option>
													        <option value="2030">2030</option>
													</select>
												</div>
												<div class="input-group" style="width: 19%; margin: 10px;">
													<div style="font-size: 20px;">
														<label style="font-size: 20px; margin-top: 8px;">끝학기</label>&nbsp; &nbsp;
													</div>
													<select class="default-select form-control" name="changeEndSem">
										               <option value="" >학기선택</option>
										               <option value="1">1 학기</option>
										               <option value="2">2 학기</option>
										           </select>
												</div>
										    </div>
										
											</div>
											<div style="font-size: 20px;">
												<label for="changeRsn">유예 사유</label>
												<textarea rows="5" class="form-control" name="changeRsn" id="changeRsn"></textarea>
											</div>
										</form>	
											<div style="font-size: 20px;">
												공지사항 &nbsp;
												<textarea rows="20" class="form-control" name="changeRsn" readonly="readonly">2022학년도 전기(2023.2.17 졸업) 학사학위취득(졸업) 유예 신청 안내
 (2022.6.30일자로 "졸업유예"가 "학사학위취득 유예"로 명칭 변경)

학칙 제70조 및 학사운영규정 제85조에 따라 학사과정 학생이 졸업요건이 충족되어도 특별한 사정이 있는 경우 학사학위취득을 유예할 수 있으므로, 학사학위취득을 유예하고자하는 학생은 다음과 같이 신청하시기 바랍니다.

학사학위취득 유예 신청기한 후에는 철회 또는 추가신청이 불가하니 신중히 결정한 후 신청하시기 바랍니다.
1. 신청기한 : 2023. 1. 26.(목)까지

2. 신청대상 : 2023년 2월 졸업요건이 충족되어 학사학위취득이 가능하나 학사학위취득을 유예하고자 희망하는 학생
    - 반드시 졸업요건이 충족되었는지 소속 학과사무실에 확인 후 신청하시기 바람

3. 방법 : 본교 통합학사정보시스템을 통하여 신청

4. 처리절차
  ① 학생이 통합학사정보시스템에 로그인하여 “졸업관리-학사학위취득유예관리-학사학위취득유예신청”에 신청
  ② 학과 접수
  ③ 단과대학, 교무처 검토
  ④ 졸업유예 승인
  ⑤ 학생이 통합학사정보시스템에 로그인하여 처리결과 확인

5. 학사학위취득 유예기간 : 재학연한의 범위에서 1년까지 가능

6. 학사학위취득 유예 후 다음 학기 등록금 납부(문의: 사무국 관리팀(042-821-1817))
   - 수강신청 학점이 없는 경우 : 해당 학기 등록금의 10%
   - 수강신청 학점이 있는 경우
     ∙ 1~3학점 : 해당 학기 등록금의 6분의 1
     ∙ 4~6학점 : 해당 학기 등록금의 3분의 1
     ∙ 7~9학점 : 해당 학기 등록금의 2분의 1
     ∙ 10학점 이상 : 해당 학기 등록금의 전액

※ 학사학위취득 유예 확정 후 학기개시 2주 경과 시점까지 등록금을 납부하지 않을 경우, 당초 졸업예정 시기에 졸업 처리됩니다.</textarea>
											</div>
											
											<br>
											<div style="display: flex; justify-content: end; margin-right: 80px; margin-top: 10px;">
												<button type="button" class="btn btn-primary" onclick="gradutePostpone()">신청</button>																	
											</div>
										</div>	
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="profile1">
							<div class="row">
								<div class="col-md-12">
									<form name="form2">
										<div style="display: flex; justify-content: space-between; margin: 30px; margin-top: -20px;">
										  <div style="display: flex; flex-direction: column; width: 40%;">
										    <div>
												 <div class="input-group" style="width: 50%; margin: 10px;">
													<label for="stdNm" style="font-size: 20px; margin-left: 40px;">이름</label>&nbsp; &nbsp;
													<input type="text" class="form-control" value="${student.stdNm }" name="stdNm" readonly="readonly">
												</div>
												<div class="input-group" style="width: 50%; margin: 10px;">
													<label for="deptNm" style="font-size: 20px; margin-left: 40px;">학과</label>&nbsp; &nbsp;
													<input type="text" class="form-control" value="${student.deptNm }" name="deptNm" readonly="readonly">
												</div>
												<div class="input-group" style="width: 50%; margin: 10px;">
													<label for="stdNo" style="font-size: 20px; margin-left: 40px;">학번</label>&nbsp; &nbsp;
													<input type="text" class="form-control" value="${student.stdNo }" name="stdNo" readonly="readonly">
												</div>
										    	<div class="input-group" style="width: 50%; margin: 10px;">
													<label for="stdMjrCrd" style="font-size: 20px;">전공학점</label>&nbsp; &nbsp;
													<input type="text" class="form-control" value="${student.stdMjrCrd }" placeholder="Surname" readonly="readonly">
												</div>
										    	<div class="input-group" style="width: 50%; margin: 10px;">
													<label for="stdCtrlCrd" style="font-size: 20px;">교양학점</label>&nbsp; &nbsp;
													<input type="text" class="form-control" value="${student.stdCtrlCrd }" placeholder="Surname" readonly="readonly">
												</div>
												<div>
													<label for="changeRsn" style="font-size: 20px; width: 70%;">사유</label>
													<textarea rows="5" class="form-control" name="changeRsn" style="width: 97%;" id="changeRsn2"></textarea>
												</div>
										    	<div class="input-group" style="width: 80%; margin: 10px; margin-left: 1px; font-size: 20px;justify-content: end;">
													<input type="text" class="form-control" value="" name="rest" readonly="readonly">
													<div style="display: flex; justify-content: end;">
														<button type="button" class="btn btn-primary" onclick="graduteApply()">신청</button>																	
													</div>
												</div>
												<br>
												
										    </div>
										  </div>
										  <div style="font-size: 20px; width: 60%; margin-left:-100px; ">
										    공지사항 &nbsp;
										    <textarea rows="20" class="form-control" name="changeRsn" readonly="readonly">
	2022학년도 전기(2023.2.17. 졸업) 조기졸업 신청 안내
	
	학칙 제69조 및 학사운영규정 제84조에 따라 학사과정 학생이 수업연한을 단축하여 조기졸업을 할 수 있으므로, 조기졸업을 하고자하는 학생은 다음과 같이 신청하시기 바랍니다.
	
	조기졸업 신청기한 후에는 철회 또는 추가신청이 불가하니 신중히 결정한 후 신청하시기 바랍니다.
	1. 신청기한 : 2023. 1. 26.(목)까지
	2. 신청대상 : 6학기(건축학과 8학기, 편입생 3학기) 이상 이수하고, 성적평점평균이 4.00(A0) 이상인 학생으로 2023년 2월 졸업이 가능한 학생
	    - 반드시 졸업요건이 충족되었는지 소속 학과사무실에 확인 후 신청
	3. 방법 : 본교 통합학사정보시스템을 통하여 신청
	4. 처리절차
	  ① 학생이 통합학사정보시스템에 로그인하여 “졸업관리-조기졸업관리-조기졸업신청”에 신청
	  ② 학과, 단과대학, 교무처 검토
	  ③ 조기졸업 승인
	  ④ 학생이 통합학사정보시스템에 로그인하여 처리결과 확인
	    (별도로 개인에게 처리결과를 통보하지 않음)
										    </textarea>
										  </div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
 
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var stdMjrCrdString = '${student.stdMjrCrd}'; 
	var stdCtrlCrdString = '${student.stdCtrlCrd}';
	
	var stdMjrCrd = parseInt(stdMjrCrdString, 10);
	var stdCtrlCrd = parseInt(stdCtrlCrdString, 10); 
	
	console.log(stdMjrCrd);
	console.log(stdCtrlCrd); 

	
	document.getElementById("res").textContent = res;

	var res = stdMjrCrd + stdCtrlCrd

	var inputElement = document.querySelector('input[name="rest"]');

	if (res > 130) {
	  inputElement.style.color = "green";
	  inputElement.value = "조기졸업 신청 가능한 학점입니다.";
	} else {
	  inputElement.style.color = "red";
	  inputElement.value = "조기졸업 신청 불가능한 학점입니다.";
	}
	
})

function gradutePostpone(){
	
	var form1 = $("#form1");
	
	var stdNm = document.querySelector('input[name="stdNm"]').value;
	var deptNm = document.querySelector('input[name="deptNm"]').value;
	var stdNo = document.querySelector('input[name="stdNo"]').value;

	var changeEndYr = document.querySelector('select[name="changeEndYr"]').value;
	var changeEndSem = document.querySelector('select[name="changeEndSem"]').value;

	var changeRsn = document.querySelector('#changeRsn').value;
	
	if(changeRsn == ""){
		swal({
			title: "사유를 입력해주세요.", 
			icon: "error"
		});
		return false;
	}

	var reqData = {
		
		"stdNm": stdNm,
		"deptNm": deptNm,
		"stdNo": stdNo,
		"changeEndYr": changeEndYr,
		"changeEndSem": changeEndSem,
		"changeRsn": changeRsn
		}

	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/student/gradutePostpone",true);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText === "SUCCESS"){
				 swal({
						title: "신청이 완료되었습니다.", 
						icon: "success"
					});
			} else if(xhr.responseText === "FAILED"){
				swal({
					title: "신청 실패.", 
					icon: "error"
				});
			}
		}
	}
	xhr.send(JSON.stringify(reqData));
}

function graduteApply(){
	var form2 = $("#form2");
	
	var stdNm2 = document.querySelector('input[name="stdNm"]').value;
	var deptNm2 = document.querySelector('input[name="deptNm"]').value;
	var stdNo2 = document.querySelector('input[name="stdNo"]').value;
	
	var changeRsn2 = document.querySelector('#changeRsn2').value;

	
	

	var reqData = {
		
		"stdNm": stdNm2,
		"deptNm": deptNm2,
		"stdNo": stdNo2,
		"changeRsn": changeRsn2
		}
	if (res > 120){
		
		if(changeRsn2 == ""){
			swal({
				title: "사유를 입력해주세요.", 
				icon: "error"
			});
			return false;
		}
		
		let xhr = new XMLHttpRequest();
		xhr.open("POST","/hku/student/graduteApply",true);
		xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				if(xhr.responseText === "SUCCESS"){
					 swal({
							title: "신청이 완료되었습니다.", 
							icon: "success"
						});
				} else if(xhr.responseText === "FAILED"){
					swal({
						title: "신청 실패.", 
						icon: "error"
					});
				}
			}
		}
		xhr.send(JSON.stringify(reqData));
	}else{
		swal({
			title: "이수학점이 부족합니다!", 
			icon: "error"
		});
	}
	
}
</script>
