<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">
<style>
.form-control:disabled, .form-control[readonly] {
	background: #fafafa;
	opacity: 1;
}

.col-form-label {
	padding-top: calc(0.375rem + 1px);
	padding-bottom: calc(0.375rem + 1px);
	margin-bottom: 0;
	font-size: 16px;
	line-height: 1.5;
	color: #716f6f;
}

.bootstrap-select .dropdown-toggle .filter-option-inner-inner {
	overflow: hidden;
	font-size: 14px;
}

.text {
	font-size: 15px;
}

.active-projects thead tr th {
	background-color: #800000;
	font-size : 14px;
}

.active-projects.manage-client tbody tr td:last-child {
	text-align: center;
}

.active-projects .tbl-caption {
	padding: 0px;
}

.form-control {
	font-size: 14px;
	color: #535353;
}

#srcSel {
    width: 100px;
    text-align: center;
    border: 1px solid #cfc8c8;
    border-radius: 11px;
    height: 30px;
}
.card-body {
	overflow: scroll;	
}
.active-projects tbody tr td {
    font-size: 15px;
}

</style>

<div class="content-body">
	<div class="container-fluid">
		<!-- row -->
		<div class="row">
			<div class="col-lg-12" style="padding-bottom:0;">
				<div class="card">
					<div class="card-header" style="height: 60px;">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							과제상세</h4>
						<div class="col-lg-7 ms-auto" style="padding-left: 47%;">
							<button type="button" id="updateBtn" class="btn btn-primary">수정</button>
							<button type="button" id="listBtn" class="btn btn-danger light">목록</button>
						</div>
					</div>
					<div class="card-body" style="height:420px;">
						<div class="form-validation">
							<form class="needs-validation">
								<input type="hidden" name="asmNo" id="asmNo" value="${assignVo.asmNo}"> 
								<input type="hidden" name="lecapNo" id="lecapNo" value="${assignVo.lecapNo}">
								<div class="row">
									<div class="col-xl-12">
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom01">교수명 </label>
											<div class="col-lg-3">
												<input type="text" class="form-control"
													id="validationCustom01" disabled value=${pro.proNm }>
												<div class="invalid-feedback"></div>
											</div>
											<label class="col-lg-1 col-form-label"
												for="validationCustom02">과목명 <span
												class="text-danger"></span>
											</label>
											<div class="col-lg-3">
												<input type="text" class="form-control"
													value="${sessionScope.subNm }" disabled name="subNm">
												<div class="invalid-feedback"></div>
											</div>
										</div>

										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom03">제목<span class="text-danger"></span>
											</label>
											<div class="col-lg-7">
												<input type="text" id="asmTtl" disabled class="form-control"
													id="validationCustom03" name="asmTtl"
													value="${assignVo.asmTtl}">
												<div class="invalid-feedback"></div>
											</div>
										</div>
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom04">내용 <span
												class="text-danger"></span>
											</label>
											<div class="col-lg-7">
												<textarea id="asmCn" class="form-control h-50"
													id="validationCustom04" rows="5" disabled name="asmCn">${assignVo.asmCn}</textarea>
												<div class="invalid-feedback"></div>
											</div>
										</div>

										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom05">주차 <span
												class="text-danger"></span>
											</label>
											<div class="col-lg-4">
												<div
													class="dropdown bootstrap-select default-select wide form-control">
													<select class="default-select wide form-control"
														id="validationCustom05" disabled>
														<c:forEach var="i" begin="1" end="15" step="1">
															<option name="asmWeek"><span>${assignVo.asmWeek}주차</span></option>
														</c:forEach>
													</select>

													<div class="dropdown-menu ">
														<div class="inner show" role="listbox" id="bs-select-1"
															tabindex="-1">
															<ul class="dropdown-menu inner show" role="presentation"></ul>
														</div>
													</div>
												</div>
												<div class="invalid-feedback"></div>
											</div>
										</div>
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom06">파일 <span
												class="text-danger"></span>
											</label>
											<div class="col-lg-4">
												<ul
													class="mailbox-attachments d-flex align-items-stretch clearfix">
													<li>
														<div class="mailbox-attachment-info">
															<a href="#" class="mailbox-attachment-name"> 
															<i class="fas fa-paperclip"></i> 
															</a> <span class="mailbox-attachment-size clearfix mt-1">
																<span>파일다운로드</span> <a href="다운로드 url"> <span
																	class="btn btn-default btn-sm float-right"> <i
																		class="fas fa-download"></i>
																</span>
															</a>
															</span>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-12">
				<div class="card">
					<div class="card-body p-0">
						<div class="tbl-caption"
							style="padding-top: 15px; padding-left: 15px;">
							<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							과제제출현황</h4>
							<hr>
						</div>
						<div class="table-responsive active-projects manage-client">
							<div class="card-body ccc" style="padding-top: 0px;">
								<table class="table" style="margin-top: -22px;">
									<thead>
										<tr class="">
											<th>No</th>
											<th>학번</th>
											<th>이름</th>
											<th>학과</th>
											<th>제출일자</th>
											<th>제출파일</th>
											<th>과제점수</th>
											<th style="text-align: center;">제출확인</th>
										</tr>
									</thead>
									<tbody id="tBody">
										<!-- 동적추가 -->

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
$(function(){
	assignList();

	
var updateBtn = document.querySelector("#updateBtn");
var listBtn = document.querySelector("#listBtn");
var asmNo = $("#asmNo").val();
var lecapNo = $("#lecapNo").val();

updateBtn.addEventListener("click", function(){
	location.href = "/hku/professor/updateForm/" + asmNo ;
})

listBtn.addEventListener("click", function() {
	location.href = "/hku/professor/assignmentList/" + lecapNo;
})


function assignList(){
	var tBody = $("#tBody");
	var assObj = {
		asmNo : "${assignVo.asmNo}"
	}

	$.ajax({
		url : "/hku/professor/assignmentDetail",  
		type : "get",    
		data : assObj,
		dataType : "json",  
		success : function(res){
			console.log(res);

			data = '';
			for(var i = 0; i < res.length; i++){
				data += `<tr>
							<td class="sorting_1"><a href="javascript:void(0)"
								class="text-primary">\${i+1}</a></td>
							<td><span>\${res[i].stdNm }</span></td>
							<td><span>\${res[i].stdNo }</span></td>
							<td><span>\${res[i].deptNm }</span></td>`
				if(res[i].asmsbDt == null || res[i].asmsbDt == ''){
					data += `<td> </td>
							  <td> </td>` 
				} else {
					data += `<td><span class="text-secondary">\${res[i].asmsbDt }</span></td>`
							 `<td><span class="text-secondary">다운로드</span></td>`
					}
				if(res[i].asmsbScr == '' || res[i].asmsbScr == null ){
					data += `<td>
								<select id="srcSel">
									<option value="0">0</option>
									<option value="20">20</option>
									<option value="40">40</option>
									<option value="60">60</option>
									<option value="80">80</option>
									<option value="100">100</option>
								</select>
							</td>`
					data += `<td>
								<button type="button" id="okBtn" class="btn btn-primary">확인</button>
							</td>`		 
				}else{
					data += `<td>\${res[i].asmsbScr}</td>
							 <td>완료</td>`;
				}
				data +=	`</tr>`;
			}
			tBody.html(data);
		}
	})
}

	var tBody = $('#tBody');
	tBody.on('click','#okBtn',function(){
		// 과제점수
		let asmsbScr = $(this).parents('tr').find('td').eq(6).children().val();
		let stdNo = $(this).parents('tr').find('td').eq(2).text().trim();
		let asmNo = "${assignVo.asmNo}";
		
		let sendData = {
				stdNo:stdNo,
				asmNo:asmNo,
				asmsbScr: asmsbScr
		};
		giveScore(sendData);
	});


function giveScore(data){

	console.log("전송 데이터", data);
	$.ajax({
		url : "/hku/professor/giveScore",
		type : "POST",
		data : JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		dataType : 'text',
		success : function(res){
			if(res == "success"){
				swal("", "성적 부여가 완료되었습니다!", "success");
				assignList();
			}else{
				console.log("서버에러")
				swal ("", "서버 에러입니다!","error");
			}
		}
	})
}
	
})	

</script>