<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/table.css">
<style>
	.pl{
    width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 12px 13px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 1px solid #9d2c2c;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">학적</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">학적변동 신청</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="card" id="card-title-1" style="margin-top: -12px;">							
			
			<div class="title-wrap" style="display:flex; justify-content: space-between; margin-bottom: 10px;">
				<div class="card-header border-0 pb-0 ">
					<h5 class="card-title" style="font-weight: 700;
    color: maroon;">신청 내역</h5>
				</div>
				<ul class="nav nav-pills mb-4 light" style="margin-bottom:0px;">
				</ul>
				<div style="display: flex; justify-content: end; margin-right: 80px;">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#insertModal" style="padding: 8px 15px; background: #0070c0; border-color: #0070c0; margin-top: 15px;">신청하기</button>
				</div>
			</div>
			<div class="card-body" style="margin: 7px;">
				<input type="hidden" class="noText" value="${student.stdNo }" disabled>
				<div class="record-wrap2" style="margin-top: 0px;">
					<table class="table" style="margin-top: -22px;">
						<thead class="thead-dark" id="tHead">
							<tr>
								<th style="width: 140px;">신청일</th>
								<th style="width: 140px;">구분</th>
								<th style="width: 400px">사유</th>
								<th style="width: 140px;">승인상태</th>
								<th style="width: 140px;">신청취소</th>
							</tr>
						</thead>
						<tbody id="tBody">
							
						</tbody>
					</table>
				</div>
			</div>
				
			<div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="deptLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-center">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="deptLabel">학적변동 신청</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-xl-12">
										<form name="insertModalForm">
											<div class="row">
												<div class="col-xl-6">
													<label class="form-label mt-3">신청자</label>
													<input type="text" class="form-control" value="${student.stdNm }" readonly>
												</div>
												<div class="col-xl-6">
													<label class="form-label mt-3">신청종류<span class="text-danger">*</span></label>
													<div class="input-group">
														<!-- <input type="text" class="form-control" name="colCd"> -->
														<select class="default-select form-control" name="changeTypeCd">
															<option value="">신청종류 선택</option>
																<option value="change01">군휴학</option>
																<option value="change02">일반휴학</option>
																<option value="change04">자퇴</option>
																<option value="change06">복학</option>
														</select>
													</div>
												</div>
												<div class="col-xl-6">
													<label class="form-label mt-3">시작년도<span class="text-danger">*</span></label>
													<div class="input-group">
														<select class="default-select form-control" name="changeStartYr">
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
												</div>
												<div class="col-xl-6 mb-3">
													<label class="form-label mt-3">시작학기<span class="text-danger">*</span></label>
													<div class="input-group">
														<select class="default-select form-control" name="changeStartSem">
														<option value="" >학기선택</option>
														<option value="1">1 학기</option>
														<option value="2">2 학기</option>
													</select>
													</div>
												</div>
												<div class="col-xl-6">
													<label class="form-label mt-3">끝년도<span class="text-danger">*</span></label>
													<div class="input-group">
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
												</div>
												<div class="col-xl-6 mb-3">
													<label class="form-label mt-3">끝학기<span class="text-danger">*</span></label>
													<div class="input-group">
														<select class="default-select form-control" name="changeEndSem">
														<option value="" >학기선택</option>
														<option value="1">1 학기</option>
														<option value="2">2 학기</option>
													</select>
													</div>
												</div>
												<div class="col-xl-12 mb-3">
													<label class="form-label">사유<span class="text-danger">*</span></label>
													<textarea rows="3" class="form-control" name="changeRsn"></textarea>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary" onclick="reqRecord()">신청</button>
							</div>
					  </div>
				</div>
			</div>
			<div class="card-body" style="padding-bottom: 0px;">
					
			</div>				
		</div>
	</div>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript">
$(function(){
	recordList();
	
	$(document).on('click', '#btn', function() {
	    var changeNo = $(this).val();
	    console.log("changeNo", changeNo);
	    $.ajax({
	        type: "post",
	        url: "/hku/student/cancelRecord",
	        data: {
	            changeNo: changeNo
	        },
	        dataType: "json",
	        beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
	        success: function(res) {
	        	recordList();
	        },
	        error: function(err) {
	            console.log("에러 발생");
	            recordList();
	        }
	    });
	});
})

function recordList(){
	var stdNo = {
			"stdNo":"${student.stdNo}"
	};
	var body = $("#tBody");
	var head = $("#tHead");
	$.ajax({
		type:"get",
		data:stdNo,
		url:"/hku/student/recordList",
		dataType:"json",
		success:function(res){
			console.log("res: ",res);
			
			var data = '';
			
			if(res.length != 0){
				for(var i = 0; i < res.length; i++){
						data += `<tr>
									<td style="padding:12px;">\${res[i].changeAplyDt}</th>
									<td style="padding:12px;">\${res[i].comCdNm1}</th>
									<td style="padding:12px;">\${res[i].changeRsn}</td>
									<td style="padding:12px;">\${res[i].comCdNm2}</td>
									<td style="padding:12px;"><button type="button" id="btn" class="btn btn-primary btn-sm" value="\${res[i].changeNo}">취소</button></td>`
						data +=	`</tr>`;					
					}	
			}else{
				data +=	`<tr>
					<td colspan="5" style="text-align: center">신청 내역이 없습니다.</td>
				</tr>`;		
			}
			body.html(data);
		}
			
	})
}

function reqRecord(){
	var insertModal = $("#insertModal");
	var insertModalForm = document.forms.insertModalForm;
	
	var changeTypeCd = insertModalForm.changeTypeCd.value;
	
	var changeStartYr = insertModalForm.changeStartYr.value;
	var changeStartSem = insertModalForm.changeStartSem.value;
	
	var changeEndYr = insertModalForm.changeEndYr.value;
	var changeEndSem = insertModalForm.changeEndSem.value;
	
	var changeRsn = insertModalForm.changeRsn.value;

	if(changeTypeCd == ""){
		swal({
			title: "종류를 선택하지 않았습니다!", 
			icon: "error"
		});
		return false;
	}
	if(changeStartYr == ""){
		swal({
			title: "시작년도를 선택하지 않았습니다!", 
			icon: "error"
		});
		return false;
	}
	if(changeStartSem == ""){
		swal({
			title: "시작학기를 선택하지 않았습니다!", 
			icon: "error"
		});
		return false;
	}
	
	if(changeRsn == ""){
		swal({
			title: "사유를 입력해주세요.", 
			icon: "error"
		});
		return false;
	}

	var reqData = {
		"changeTypeCd": changeTypeCd,
		"changeStartYr": changeStartYr,
		"changeStartSem": changeStartSem,
		"changeEndYr": changeEndYr,
		"changeEndSem": changeEndSem,
		"changeRsn": changeRsn
		}
	// console.log(deptInsertData);

	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/student/insertAcademic",true);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText === "SUCCESS"){
				console.log("");
				insertModal.modal('hide');
				 swal({
						title: "신청이 완료되었습니다.", 
						icon: "success"
					});
			} else if(xhr.responseText === "FAILED"){
				console.log("신청 실패");
			}
			recordList();
		}
	}
	xhr.send(JSON.stringify(reqData));
}


</script>