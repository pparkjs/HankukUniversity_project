<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">
<style>
.table-wrap {
    overflow: scroll;
    height: 334px;
    margin-top: -7px;
}
.thead-dark{
	position: sticky;
	top: 0px;
}
.table-info-td{
	font-size: 1.2em;
	font-weight: bold;
	text-align: center;
	color: whitesmoke;
	background-color: #800000;
}
.form-label{
	color: #800000;
}
.table tbody tr td {
    padding: 0px;
}
.table thead tr th {
	padding: 7px;
}
.custom-tab-1 .nav-link {
    font-weight: 800;
    color: #444444;
    font-size: 17px;
}
.badge-light{
	background-color: #e6b9b8;
}
.badge-success{
	background-color: #0070c0;
}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">장학금</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">장학금 신청 내역</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -16px;">
		<div class="custom-tab-1" style="display: flex; align-items: center;">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-bs-toggle="tab" href="#profile1" id="allBtn">전체</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#contact1" id="stdBtn">대기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#message1" id="proBtn">승인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#message2" id="empBtn">반려</a>
				</li>
			</ul>
		</div>
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0" style="margin-top: -10px;">
				<h5 class="card-title">장학금 신청 내역</h5>
			</div>
			<div class="card-body" style="height: 366px;">
				<div class="tab-content">
					<div class="tab-pane fade show active" id="profile1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:100px;">학번</th>
										<th style="width:100px;">성명</th>
										<th style="width:100px;">신청일자</th>
										<th style="width:100px;">승인상태</th>
										<th style="width:100px;">상세보기</th>
									</tr>
								</thead>
								<tbody id="allTbody">
									<!-- 전체 내용 추가 -->
									<c:forEach var="sclsAply" items="${sclsAplyList}">
										<tr>
											<td>
												<c:out value="${sclsAply.stdNo}"/>
												<input type="hidden" id="sclsNm" value="${sclsAply.sclsNm}">
												<input type="hidden" id="atchFileNo" value="${sclsAply.atchFileNo}">
											</td>
											<td>
												<c:out value="${sclsAply.stdNm}"/>
											</td>
											<td>
												<c:out value="${sclsAply.sclsapDt}"/>
											</td>
											<td>
												<c:choose>
													<c:when test="${sclsAply.aprvSttsCd eq 'wait'}">
														<span class="badge badge-light">대기</span>
													</c:when>
													<c:when test="${sclsAply.aprvSttsCd eq 'appv'}">
														<span class="badge badge-success">승인</span>
													</c:when>
													<c:when test="${sclsAply.aprvSttsCd eq 'rej'}">
														<span class="badge badge-danger">반려</span>
													</c:when>
												</c:choose>
											</td>
											<td>
												<button type="button" class="btn btn-outline-info infoBtn" id="<c:out value="${sclsAply.sclsapNo }"/>">
													<span class="btn-icon-start text-info">
														<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
															<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
													</span>보기
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="contact1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:100px;">학번</th>
										<th style="width:100px;">성명</th>
										<th style="width:100px;">신청일자</th>
										<th style="width:100px;">승인상태</th>
										<th style="width:100px;">상세보기</th>
									</tr>
								</thead>
								<tbody id="allTbody">
									<!-- 전체 내용 추가 -->
									<c:forEach var="sclsAply" items="${sclsAplyList}">
										<c:if test="${sclsAply.aprvSttsCd eq 'wait' }">
											<tr>
												<td>
													<c:out value="${sclsAply.stdNo}"/>
													<input type="hidden" id="sclsNm" value="${sclsAply.sclsNm}">
													<input type="hidden" id="atchFileNo" value="${sclsAply.atchFileNo}">
												</td>
												<td>
													<c:out value="${sclsAply.stdNm}"/>
												</td>
												<td>
													<c:out value="${sclsAply.sclsapDt}"/>
												</td>
												<td>
													<span class="badge badge-light">대기</span>
												</td>
												<td>
													<button type="button" class="btn btn-outline-info infoBtn" id="<c:out value="${sclsAply.sclsapNo }"/>">
														<span class="btn-icon-start text-info">
															<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															</svg>
														</span>보기
													</button>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="message1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:100px;">학번</th>
										<th style="width:100px;">성명</th>
										<th style="width:100px;">신청일자</th>
										<th style="width:100px;">승인상태</th>
										<th style="width:100px;">상세보기</th>
									</tr>
								</thead>
								<tbody id="allTbody">
									<!-- 전체 내용 추가 -->
									<c:forEach var="sclsAply" items="${sclsAplyList}">
										<c:if test="${sclsAply.aprvSttsCd eq 'appv' }">
											<tr>
												<td>
													<c:out value="${sclsAply.stdNo}"/>
													<input type="hidden" id="sclsNm" value="${sclsAply.sclsNm}">
													<input type="hidden" id="atchFileNo" value="${sclsAply.atchFileNo}">
												</td>
												<td>
													<c:out value="${sclsAply.stdNm}"/>
												</td>
												<td>
													<c:out value="${sclsAply.sclsapDt}"/>
												</td>
												<td>
													<span class="badge badge-success">승인</span>
												</td>
												<td>
													<button type="button" class="btn btn-outline-info infoBtn" id="<c:out value="${sclsAply.sclsapNo }"/>">
														<span class="btn-icon-start text-info">
															<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															</svg>
														</span>보기
													</button>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="message2">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:100px;">학번</th>
										<th style="width:100px;">성명</th>
										<th style="width:100px;">신청일자</th>
										<th style="width:100px;">승인상태</th>
										<th style="width:100px;">상세보기</th>
									</tr>
								</thead>
								<tbody id="allTbody">
									<!-- 전체 내용 추가 -->
									<c:forEach var="sclsAply" items="${sclsAplyList}">
										<c:if test="${sclsAply.aprvSttsCd eq 'rej' }">
											<tr>
												<td>
													<c:out value="${sclsAply.stdNo}"/>
													<input type="hidden" id="sclsNm" value="${sclsAply.sclsNm}">
													<input type="hidden" id="atchFileNo" value="${sclsAply.atchFileNo}">
												</td>
												<td>
													<c:out value="${sclsAply.stdNm}"/>
												</td>
												<td>
													<c:out value="${sclsAply.sclsapDt}"/>
												</td>
												<td>
													<span class="badge badge-danger">반려</span>
												</td>
												<td>
													<button type="button" class="btn btn-outline-info infoBtn" id="<c:out value="${sclsAply.sclsapNo }"/>">
														<span class="btn-icon-start text-info">
															<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															</svg>
														</span>보기
													</button>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 " style="margin-top: -10px;">
				<h5 class="card-title">신청 상세</h5>
			</div>
			<div class="card-body" style="height: 333px; overflow: visible">
				<form class="row" method="post" action="/hku/admin/academic/fluctuation-list" id="detailFrm">
					<div class="col-lg-6">
						<div class="row detail">
							<div class="col-lg-3 mb-1">
								<input type="hidden" id="sclsapNo" name="sclsapNo">
								<input type="hidden" id="datchFileNo" name="datchFileNo">
								<input type="hidden" id="stts" name="stts">
								<label class="text-label form-label">학번</label>
								<input type="text" name="place" class="form-control" disabled id="stdNo">
							</div>
							<div class="col-lg-3 mb-1">
								<label class="text-label form-label">성명</label>
								<input type="text" name="place" class="form-control" disabled id="stdNm">
							</div>
							<div class="col-lg-3 mb-1">
								<label class="text-label form-label">장학명</label>
								<input type="text" name="place" class="form-control" disabled id="dsclsNm">
							</div>
							<div class="col-lg-3 mb-1">
								<label class="text-label form-label">신청일자</label>
								<input type="text" name="place" class="form-control" disabled id="sclsapDt">
							</div>
							<div class="col-lg-12 mb-1">
								<div class="chat-meadia">
									<h4 class=" fs-16">증빙파일</h4>
									<div class="file-list row dz-scroll" id="fileArea">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="col-lg-12 mb-4">
							<label class="text-label form-label">처리의견</label>
							<textarea rows="10" cols="30" class="form-control" id="rejRsn" name="changeRjctRsn"></textarea>
						</div>
						<div class="col-lg-12 mb-1" style="text-align: right;">
							<button type="button" class="btn btn-danger light" id="rejBtn">반려</button>
							<button type="button" class="btn btn-primary" id="appvBtn">승인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var infoBtn = $('.infoBtn');
	var appvBtn = $('#appvBtn'); //승인 버튼
	var rejBtn = $('#rejBtn'); // 반려 버튼
	
	infoBtn.on('click',function(){
		
		
// 		console.log(this.id);
		$('#sclsapNo').val(this.id);
		
		$('#stdNo').val($(this).parents('tr').find('td').eq(0).text().trim());
		$('#stdNm').val($(this).parents('tr').find('td').eq(1).text().trim());
		$('#dsclsNm').val($(this).parents('tr').find('#sclsNm').val());
		$('#datchFileNo').val($(this).parents('tr').find('#atchFileNo').val());
		$('#sclsapDt').val($(this).parents('tr').find('td').eq(2).text().trim());
		$('#stts').val($(this).parents('tr').find('span').text().trim());
		
		// 파일 가져오기
		getSupportingFile();
		
	});
	
	function getSupportingFile(){
		let atchFileNo = parseInt($('#datchFileNo').val());
		console.log("숫자로 변환한 파일 번호 ", atchFileNo);
		if (atchFileNo == 0) {
			console.log("[파일 없음 함수 리턴]");
			return false;	
		}
		$.ajax({
			type: 'get',
			url: '/hku/admin/scholarship/SupportingFile-list/'+atchFileNo,
			dataType: 'json',
			success: function(res){
				if (res != null || res.length > 0) {
					console.log(res);
					
					var fileArea = $('#fileArea');
					var fileStr = "";
					for(let i=0; i<res.length; i++){
						let file = res[i];
						fileStr += `<a class="text-center col-xl-4 col-6 filie-l-icon"
							href="/download\${file.filePath}" download="\${file.fileOrgnlFileNm}">
										<img src="\${settingFileImg(file.fileOrgnlFileNm)}">
										<h6>\${file.fileOrgnlFileNm}</h6>
										<span>\${file.fileSize}</span>
									</a>`;
					}
					fileArea.html(fileStr);
				}else{
					console.log("파일 없습니다.");
					return false;
				}
			}
		});
	}

	function settingFileImg(PFileName){
		let ex = PFileName.split(".")[1]
		console.log(ex);
		var fileExp = "";
		switch(ex){
			case "hwp": fileExp = "/resources/images/chat/hwp.png"; break;
			case "pdf": fileExp = "/resources/images/chat/pdf.png"; break;
			case "zip": fileExp = "/resources/images/chat/zip.png"; break;
			case "xls": case "xlsx": fileExp = "/resources/images/chat/excel.png"; break;
			case "ppt": case "pptx": fileExp = "/resources/images/chat/ppt.png"; break;
			default: fileExp = "/resources/images/chat/google-docs1.png"; break;
		}
		return fileExp;
	}
	
	appvBtn.on('click',function(){
		if (checkValidation()) {
			return false;
		}
		handleScholarshipApplicationOutcome('appv');
	});
	
	rejBtn.on('click',function(){
		if (checkValidation()) {
			return false;
		}
		let rejRsn = $('#rejRsn').val().trim();
		if (rejRsn == "" || rejRsn == null) {
			swal({
				title: "반려사유를 입력해주세요.", 
				icon: "error"
			});
			return false;
		}
		handleScholarshipApplicationOutcome('rej');
	});
	
	// 검증
	function checkValidation(){
		let sclsapNo = $('#sclsapNo').val();
		if (sclsapNo == "" || sclsapNo == null) {
			swal({
				title: "정보를 선택 해주세요.", 
				icon: "error"
			});
			return true;
		}
		
		let stts = $('#stts').val();
		if (stts != "대기") {
			swal({
				title: "이미 처리된 정보 입니다.", 
				icon: "error"
			});
			return true;
		}
	}
	
	function handleScholarshipApplicationOutcome(pStts){
		let sclsapNo = $('#sclsapNo').val();
		let rejRsn = $('#rejRsn').val().trim();
		let sendData = {
			sclsapNo: sclsapNo,
			sclsapRjctRsn: rejRsn,
			aprvSttsCd : pStts
		}
		$.ajax({
			type: 'post',
			url: '/hku/admin/sclsAplyProccess',
			beforeSend : function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			contentType: 'application/json;charset=utf-8',
			data : JSON.stringify(sendData),
			dataType : 'text',
			success: function (res) {
				if (res == "appvSuccess") {
					swal({
						title: "승인이 완료되었습니다.", 
						icon: "success"
					});
				}else if(res == "rejSuccess"){
					swal({
						title: "반려가 완료 되었습니다.", 
						icon: "success"
					});
				}else{
					swal({
						title: "서버 에러 다시 시도해 주세요.", 
						icon: "error"
					});
				}setTimeout(() => {
					location.reload();
				}, 1500);
			}
		});
	}
});
</script>
