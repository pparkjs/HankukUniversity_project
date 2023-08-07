<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/counseling-style.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">상담 관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">학생상담 신청 내역</a></li>
		</ol>
    </div>
	<div class="container-fluid subCon">
		<div class="custom-tab-1">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-bs-toggle="tab" href="#home1">대기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#profile1">승인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#contact1">반려</a>
				</li>
			</ul>
		</div>
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title" style="color: maroon;  font-weight: 900;">상담신청 내역</h5>
			</div>
			<hr>
			<div class="card-body" style="padding-top: 0px; color: black; font-size: 18px;	padding: 0.75rem;">
				<!-- Nav tabs -->
				<div class="tab-content">
					<div class="tab-pane fade show active" id="home1" role="tabpanel">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:200px;">학번</th>
										<th style="width:300px;">이름</th>
										<th style="width:200px;">상담일자</th>
										<th style="width:200px;">상담시간</th>
										<th style="width:500px;">상담사유</th>
										<th style="width:100px;">상담유형</th>
										<th style="width:300px;">상태</th>
									</tr>
								</thead>
								<tbody class="wait-body">

								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="profile1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:200px;">학번</th>
										<th style="width:300px;">이름</th>
										<th style="width:200px;">상담일자</th>
										<th style="width:200px;">상담시간</th>
										<th style="width:500px;">상담사유</th>
										<th style="width:100px;">상담유형</th>
										<th style="width:300px;">상태</th>
									</tr>
								</thead>
								<tbody class="appv-body">

								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="contact1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:200px;">학번</th>
										<th style="width:300px;">이름</th>
										<th style="width:200px;">상담일자</th>
										<th style="width:200px;">상담시간</th>
										<th style="width:500px;">상담사유</th>
										<th style="width:100px;">상담유형</th>
										<th style="width:300px;">상태</th>
									</tr>
								</thead>
								<tbody class="rej-body">

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade sModal" id="rejModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: 18px; font-weight: 800;">반려사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
				<div class="modal-wrap">
					<div class="modal-content3">
						<textarea rows="10" cols="10" class="form-control" id="rejText" placeholder="반려 사유를 입력하세요."></textarea>
					</div>
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="rejBtn">반려</button>
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script>
$(function(){
	counselingReqList();
})

var rejBtn = $("#rejBtn");
var dscsnNo;
var stdNo;

$(document).on("click","#rejBtn2", function(){
	dscsnNo = $(this).val();
	stdNo = $(this).parents("tr").find('.stdNo').data("stdno");
// 	console.log("체킹체킹",dscsnNo,stdNo)
})

$(document).on("click","#regBtn",function(){
	var dscsnNo2 = $(this).val();
	var stdNo2 = $(this).parents("tr").find('.stdNo').data("stdno");
	console.log("승인상담번호",dscsnNo2);
	console.log("승인학번",stdNo2);
	
	var obj = {
			dscsnNo:dscsnNo2,
			stdNo:stdNo2
		}
	
	$.ajax({
		url:"/hku/stduentCounse-appv",
		data:JSON.stringify(obj),
		contentType:"application/json; charset=UTF-8",
		type:"put",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success:function(res){
			if(res === "success"){
				swal({
						title: "승인처리가 되었습니다.",
						icon: "success",
						button: "닫기",
					});
				counselingReqList();
			}
			if(res === "failed"){
				swal({
						title: "승인처리에 실패하였습니다. 다시 시도해주세요.",
						icon: "error",
						button: "닫기",
					});
			}
		}
	})
	
})

rejBtn.on("click",function(){
// 	var dscsnNo = $(this).val();
// 	var stdNo = $(this).parents("tr").find('.stdNo').data("stdNo");
	console.log("거절 상담번호",dscsnNo);
	console.log("학번",stdNo);
	
	var rejText = $("#rejText").val();
	
	if(rejText == "" || rejText == null){
		swal({
			title: "반려사유를 입력하세요.",
			icon: "error",
			button: "닫기",
		});
		return false;
	}
	
	var obj = {
		dscsnNo:dscsnNo,
// 		dscsnNo:$("#rejBtn2").val(),
		rejCon:rejText,
		stdNo:stdNo
	}
	$.ajax({
		url:"/hku/stduentCounse-rej",
		data:JSON.stringify(obj),
		contentType:"application/json; charset=UTF-8",
		type:"put",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success:function(res){
			if(res === "success"){
				swal({
						title: "반려처리가 되었습니다.",
						icon: "success",
						button: "닫기",
					});
				counselingReqList();
				document.querySelector('.btn[data-bs-dismiss="modal"]').click();
			}
			if(res === "failed"){
				swal({
						title: "반려처리에 실패하였습니다. 다시 시도해주세요.",
						icon: "error",
						button: "닫기",
					});
			}
		}
	})
})

function counselingReqList(){
	var rejBody = $(".rej-body");
	var appvBody = $(".appv-body");
	var waitBody = $(".wait-body");

	var cObj = {
		proNo:"${pro.proNo}"
		// aprvSttsCd: aprvSttsCd
	}
	
	$.ajax({
		url:"/hku/stduent-counselingList",
		data:cObj,
		dataType:"json",
		type:"get",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success:function(res){
			console.log(res);
			
			waitData = '';
			// 대기중인 목록
			if(res.length == 0){
				waitData += `<tr><td colspan="8">학생이 신청한 대기중인 내역이 존재하지 않습니다.</td></tr>`
				waitBody.html(waitData);
			}else{
				var cnt = 0;
				for(var i=0; i<res.length; i++){
					if(res[i].aprvSttsCd == 'wait'){
						waitData += `<tr>
										<td class="stdNo" data-stdno="\${res[i].stdNo }"><c:out value="\${res[i].stdNo }"></c:out></td>
										<td>\${res[i].stdNm }</td>
										<td>\${res[i].dscsnAplyDt }</td>
										<td>\${res[i].periodCd }</td>
										<td>\${he.encode(res[i].dscsnRsn) }</td>
										<td>\${res[i].attendModeCd }</td>
										<td>
											<button type="button" value="\${res[i].dscsnNo }" class="btn btn-primary" id="regBtn" style="background: #0070c0; border-color:#0070c0;">승인</button>
											<button type="button" value="\${res[i].dscsnNo }" class="btn btn-primary" id="rejBtn2" style="background: #ff4343; border-color:#ff4343; " data-bs-toggle="modal" data-bs-target="#rejModal">반려</button>
										</td>
									<tr>`
						cnt++;
					}
				}
				if(cnt == 0){
					waitData += `<tr><td colspan="8">학생이 신청한 대기중인 내역이 존재하지 않습니다.</td></tr>`
				}
				waitBody.html(waitData);
			}

			// 승인된 목록
			appvData = '';
			
			if(res.length == 0){
				appvData += `<tr><td colspan="8">승인된 상담 내역이 존재하지 않습니다.</td></tr>`
				appvBody.html(appvData);
			}else{
				var cnt = 0;
				for(var i=0; i<res.length; i++){
					if(res[i].aprvSttsCd == 'appv'){
						appvData += `<tr>
										<td>\${res[i].stdNo }</td>
										<td>\${res[i].stdNm }</td>
										<td>\${res[i].dscsnAplyDt }</td>
										<td>\${res[i].periodCd }</td>
										<td>\${he.encode(res[i].dscsnRsn) }</td>
										<td>\${res[i].attendModeCd }</td>`
						
						if(res[i].attendModeCd == '비대면'){
							appvData +=		`<td>
												<a href="https://7c8e-1-212-157-150.ngrok-free.app/rtc?dscsnNo=\${res[i].dscsnNo }" class="btn btn-primary" id="rtcBtn" style="background: #0070c0; border-color:#0070c0;">입장</a>
											</td>`
						}else{
							appvData +=     `<td style="display: flex; justify-content: center;"> 
												<div class="appv">승인</div> 
											</td> `
						}

						appvData +=	`<tr>`
						cnt++;
					}
				}
				if(cnt == 0){
					appvData += `<tr><td colspan="8">승인된 상담 내역이 존재하지 않습니다.</td></tr>`
				}
				appvBody.html(appvData);
			}

			// 거절된 목록
			rejData = '';
			// 대기중인 목록
			if(res.length == 0){
				rejData += `<tr><td colspan="8">반려 내역이 존재하지 않습니다.</td></tr>`
				rejBody.html(rejData);
			}else{
				var cnt = 0;
				for(var i=0; i<res.length; i++){
					if(res[i].aprvSttsCd == 'rej'){
						rejData += `<tr>
										<td>\${res[i].stdNo }</td>
										<td>\${res[i].stdNm }</td>
										<td>\${res[i].dscsnAplyDt }</td>
										<td>\${res[i].periodCd }</td>
										<td>\${he.encode(res[i].dscsnRsn) }</td>
										<td>\${res[i].attendModeCd }</td>
										<td style="display: flex; justify-content: center;"> 
											<div class="rej">반려</div>
										</td>
									<tr>`
						cnt++;
					}
				}
				if(cnt == 0){
					rejData += `<tr><td colspan="8">반려 내역이 존재하지 않습니다.</td></tr>`
				}
				rejBody.html(rejData);
			}
		}
	})
}


</script>