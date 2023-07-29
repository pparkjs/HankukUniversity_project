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
			<li class="breadcrumb-item active"><a href="javascript:void(0)">장학금 신청</a></li>
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
					<input type="text" class="noText" value="${std.stdNo }" disabled>
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

	<div class="container-fluid cc">
		<div class="row">
			<div class="col-lg-6">
				<div class="card" id="card-title-1">
					<div class="card-header border-0 pb-0 ">
						<h5 class="card-title">장학 정보</h5>
					</div>
					<hr style="margin: 0rem;"/>
					<div class="card-body">
						<div class='table-wrap'>
							<table class='table' style='margin-top:-22px;'>
								<thead class='thead-dark'>
									<tr>
										<th>#</th>
										<th>장학 번호</th>
										<th>장학 명칭</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${scholarList}" var="scholar" varStatus="stat">
										<fmt:formatNumber value="${scholar.sclsAmt}" var="sclsAmt" pattern="#,###"/>
										<fmt:parseDate value="${scholar.sclsAplyBgngDt}" var="sclsAplyBgngDt" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${sclsAplyBgngDt}" var="sclsBgDt" pattern="yyyy-MM-dd"/>
										<fmt:parseDate value="${scholar.sclsAplyEndDt}" var="sclsAplyEndDt" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${sclsAplyEndDt}" var="sclsEndDt" pattern="yyyy-MM-dd"/>
										<tr data-bs-toggle="offcanvas" href="#sclsoffcanvas" role="button" aria-controls="sclsoffcanvas" onclick="sclsDetail(this)">
											<td>${stat.count}</td>
											<td>${scholar.sclsCd}</td>
											<td>${scholar.sclsNm}</td>
											<input type="hidden" value="${sclsAmt}"/>
											<input type="hidden" value="${sclsBgDt}"/>
											<input type="hidden" value="${sclsEndDt}"/>
											<input type="hidden" value="${scholar.sclsTerms}"/>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="card" id="card-title-1">
					<div class="card-header border-0 pb-0">
						<h5 class="card-title">유의 사항</h5>
					</div>
					<hr style="margin: 0rem;"/>
					<div class="card-body">
						<div>
							<span><h5>▶ 교내 등록금감면 장학금 신청 안내</h5></span>
							<span class="uu">교내 등록금감면 장학금 및 신청방법을 아래와 같이 안내드리오니<span><br/>
							<span class="uu">장학대상자는 공지사항의 내용과 붙임자료를 모두 필독하신 후 신청하여 주시기 바랍니다.</span><br/><br/>
		
							<span><h5>▶ 목 적</h5></span>
							<span class="uu">등록금감면 장학금 지급 대상 학생들의 휴·복학 파악에 어려움이 있어, 2023-2학기 재학 예정자의 신청 절차 필요</span><br/><br/>
							
							<span><h5>▶ 한국인 복지장학은 2022학년도 1학기부터 직접 신청이 아닌 자동선발로 변경되어 신청 필요하지 않음</h5></span><br/>
							
							<span><h5>▶ 문의사항: 학생지원팀 교내장학 042-456-7890</h5></span>
							
							<!-- <span><h5>▶ 증명서를 제출(전송)할 경우, 반드시 보안증명서 사용법 파일(.html)과 증명서 파일(.min)을 함께 제출(전송)해주십시요.</h5></span> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid pt-0">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">장학 신청 정보</h5>
				<!-- <button type="button" onclick="sclsAplyListSet()">테스트</button> -->
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body" id="sclsAplyList">
				<div class='table-wrap sclsAplyTb'>
					<table class='table' style='margin-top:-22px;'>
						<thead class='thead-dark'>
							<tr>
								<th>#</th>
								<th>장학 명칭</th>
								<th>신청 년도</th>
								<th>신청 학기</th>
								<th>신청 일자</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sclsAplyList}" var="sclsAply" varStatus="stat">
								<tr onclick="sclsAplyDetail(this)" data-bs-toggle="offcanvas" href="#sclsAplyOffcanvas" role="button" aria-controls="sclsAplyOffcanvas">
									<input type="hidden" value="${sclsAply.sclsapNo}"/>
									<td>${stat.count}</td>
									<td>${sclsAply.sclsNm}</td>
									<td>${sclsAply.sclsapYr}</td>
									<td>${sclsAply.sclsapSem}</td>
									<td>
										<fmt:parseDate value="${sclsAply.sclsapDt}" var="sclsapDt" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${sclsapDt}" pattern="yyyy-MM-dd"/>
									</td>
									<td style="display: flex; justify-content: center;">
										<c:choose>
											<c:when test="${sclsAply.aprvSttsCd eq 'wait'}">
												<div class="wait">대기</div>
												<!-- <button type="button" class="btn btn-sm btn-danger" id="regBtn" style="width:51px; margin-bottom: 0px; 
													margin-left: 4px; padding: 3px 5px; background: #0070c0; border-color: #0070c0;">대기</button> -->
											</c:when>
											<c:when test="${sclsAply.aprvSttsCd eq 'appv'}">
												<div class="appv">승인</div>
												<!-- <button type="button" class="btn btn-sm btn-danger" id="regBtn" style="width:51px; margin-bottom: 0px; 
													margin-left: 4px; padding: 3px 5px; background: #0070c0; border-color: #0070c0;">승인</button> -->
											</c:when>
											<c:otherwise>
												<div class="rej">반려</div>
												<!-- <button type="button" class="btn btn-sm btn-danger" id="regBtn" style="width:51px; margin-bottom: 0px; 
													margin-left: 4px; padding: 3px 5px; background: #ff4343; border-color: #ff4343;">반려</button> -->
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 장학 상세, 신청 offcanvas -->
<div class="offcanvas offcanvas-end customeoff" tabindex="-1" id="sclsoffcanvas">
	<div class="offcanvas-header">
	<h5 class="modal-title" id="#gridSystemModal">장학 상세</h5>
	  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close">
		  <i class="fa-solid fa-xmark"></i>
	  </button>
	</div>
	<div class="offcanvas-body">
	  <div class="container-fluid">
		  <!-- <form> -->
			  <div class="row">
				  <div class="col-xl-12 mb-3">
					  <label class="form-label mt-2">장학 명칭</label>
					  <input type="text" class="form-control" id="sclsNm" readonly>
					  <input type="hidden" id="sclsCd"/>
				  </div>	
				  <div class="col-xl-12 mb-3">
					  <label class="form-label mt-2">장학 금액</label>
					  <input type="text" class="form-control" id="sclsAmt" readonly>
				  </div>
				  <div class="col-xl-12 mb-3">
					  <label class="form-label mt-2">신청 시작일</label>
					  <input type="text" class="form-control" id="sclsAplyBgngDt" readonly>
				  </div>
				  <div class="col-xl-12 mb-3">
					  <label class="form-label mt-2">신청 종료일</label>
					  <input type="text" class="form-control" id="sclsAplyEndDt" readonly>
				  </div>
				  <div class="col-xl-12 mb-3">
					<label class="form-label mt-2">장학 조건</label>
					<div class="input-group">
						<textarea class="form-txtarea form-control" rows="4" id="sclsTerms" readonly></textarea>
					</div>
				</div>
				<div class="col-xl-12 mb-3">
					<h5 class="my-3 attach"><i class="fa fa-paperclip me-2"></i> 증빙 파일</h5>
					<input class="form-control" type="file" id="sclsFiles" multiple="multiple">
				</div>
				<div class="col-xl-12 mb-3" style="display: flex; justify-content: right;">
					<button class="btn btn-primary me-1" id="sclsAplyBtn">신청</button>
					<button class="btn btn-danger light ms-1" data-bs-dismiss="offcanvas" aria-label="Close" id="offcanvasCancelBtn" >취소</button>
				</div>
			  </div>
		  <!-- </form> -->
		</div>
	</div>
</div>
<!-- offcanvas End -->

<!-- 장학 수정,삭제 offcanvas -->
<div class="offcanvas offcanvas-end customeoff" tabindex="-1" id="sclsAplyOffcanvas">
	<div class="offcanvas-header">
	<h5 class="modal-title" id="#gridSystemModal">장학 신청 상세</h5>
	  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close">
		  <i class="fa-solid fa-xmark"></i>
	  </button>
	</div>
	<div class="offcanvas-body">
	  <div class="container-fluid">
			<div class="row">
				<div class="col-xl-6 mb-3">
					<label class="form-label mt-2">장학 명칭</label>
					<input type="text" class="form-control" id="sclsNm2" readonly>
					<input type="hidden" id="sclsapNo"/>
				</div>	
				<div class="col-xl-6 mb-3">
					<label class="form-label mt-2">장학 금액</label>
					<input type="text" class="form-control" id="sclsAmt2" readonly>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label mt-2">신청 년도</label>
					<input type="text" class="form-control" id="sclsAplyYr2" readonly>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label mt-2">신청 학기</label>
					<input type="text" class="form-control" id="sclsAplySem2" readonly>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label mt-2">신청일</label>
					<input type="text" class="form-control" id="sclsAplyDt2" readonly>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label mt-2">상태</label>
					<input type="text" class="form-control" id="aprvSttsNm2" readonly>
				</div>
				<div class="col-xl-12 mb-3" id="sclsapRjctRsnDiv">
					<label class="form-label mt-2">반려사유</label>
					<textarea class="form-txtarea form-control" rows="4" id="sclsapRjctRsn2" readonly></textarea>
				</div>
				<div class="col-xl-12 mb-3">
					<h5 class="my-3 attach"><i class="fa fa-paperclip me-2"></i> 증빙 파일</h5>
					<div id="aplyDetailFiles"></div>
					<input class="form-control" type="file" id="sclsFiles2" name="sclsFiles2" multiple="multiple">
				</div>
				<div class="col-xl-12 mb-3" style="display: flex; justify-content: right;">
					<button class="btn btn-primary me-1" id="sclsAplyModifyBtn">수정</button>
					<button class="btn btn-primary me-1" id="sclsAplyDeleteBtn">삭제</button>
					<button class="btn btn-danger light ms-1" data-bs-dismiss="offcanvas" aria-label="Close" id="aplyOffcanvasCancelBtn" >취소</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- offcanvas End -->

<script>
$(function(){
	$("#sclsAplyBtn").on('click', function(){
		var sclsCd = $("#sclsCd").val();
		var stdNo = "${std.stdNo}";
		var aplyFiles = $("#sclsFiles")[0].files;

		// console.log("files",aplyFiles);
		// console.log("files",aplyFiles[0]);
		// console.log("files",aplyFiles[1]);

		let formData = new FormData();
		formData.append("sclsCd",sclsCd);
		formData.append("stdNo",stdNo);

		if(aplyFiles.length > 4){
			swal({
				title: "파일은 최대 4개까지 첨부 가능합니다!",
				icon: "error"
			});
			return false;
		}

		for(let i=0; i<aplyFiles.length; i++){
			formData.append("aplyFiles",aplyFiles[i]);
		}
		// console.log("formData",formData);

		$.ajax({
			type: "POST",
			url: "/hku/sclsAplyInsert",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
			success: function(res){
				swal({
					title: "신청이 완료되었습니다!",
					icon: "success"
				});
				$("#sclsFiles").val(null);
				$("#offcanvasCancelBtn").click();
				sclsAplyListSet();
			},
			error: function(res){
	
			}
		});
	});

	$(document).on("click",".attachmentFileDel",function(event){
		// console.log("target",target);
		var id = $(this).prop("id");
		console.log("fileId", id);
		// var idx = id.indexOf("_");
		// console.log(id.split('_')[0]);
		// console.log(id.split('_')[1]);
		// console.log(id.split('_')[2]);

		let atchFileNo = id.split('_')[1];
		let atchFileSeq = id.split('_')[2];

		let delFileNo = atchFileNo + "_" + atchFileSeq;
		console.log("delFileNo",delFileNo);
		// var noticeFileNo = id.substring(idx + 1);	// fileNo 얻어오기
		var ptrn = "<input type='hidden' name='delFileNo' value='%V'/>";
		$("#aplyDetailFiles").append(ptrn.replace("%V", delFileNo));
		$(this).parents("li:first").hide();

		let fileCount = $("#fileCount").val();
		$("#fileCount").val(fileCount-1);
	});

	// $("#sclsFiles2").on("change", function(event){
	// 	var files = event.target.files;
	// 	// console.log("파일갯수", files.length);
		
	// 	let fileCount = $("#fileCount").val();

	// 	let totalCount = parseInt(fileCount) + parseInt(files.length);
	// 	console.log("총 갯수",totalCount);
	// 	$("#fileCount").val(totalCount);
	// })
	$("#testBtn").on("click", function(){
		let fileCount = $("#fileCount").val();

		var newFiles = $('input[name="sclsFiles2"]')[0].files;
		console.log("123",newFiles);
		console.log("456",newFiles.length);

		console.log("선택한 파일 개수", fileCount);
	});

	$("#sclsAplyModifyBtn").on('click',function(){
		let fileCount = $("#fileCount").val();
		console.log("선택한 파일 개수", fileCount);

		let newFiles=$('input[name="sclsFiles2"]')[0].files;
		let newFilesCount = newFiles.length;
		fileCount = parseInt(fileCount) + parseInt(newFilesCount);


		// 최대 첨부파일 갯수 4개 검증
		if(fileCount > 4){
			swal({
				title: "파일은 최대 4개까지 첨부 가능합니다!",
				icon: "error"
			});
			return false;
		}	
		if(fileCount == 0){
			swal({
				title: "증빙파일을 첨부해주세요!",
				icon: "error"
			});
			return false;
		}

		let formData = new FormData();

		// 삭제할 파일 정보들
		var delInputFileArr = $("input[name=delFileNo]");

		let delFileInfoArr = new Array();
		for(let i=0; i<delInputFileArr.length; i++){
			console.log(i+'번째 : ', delInputFileArr[i].value);

			let delFileInfo = delInputFileArr[i].value;
			let atchFileNo = delFileInfo.split('_')[0];
			let atchFileSeq = delFileInfo.split('_')[1];

			let delFileInfo_ = {
				"atchFileNo": atchFileNo,
				"atchFileSeq": atchFileSeq
			}
			console.log("삭제할 데이터 JSON",delFileInfo_);

			delFileInfoArr.push(delFileInfo_);
			
			// formData.append("delFileInfoList",delFileInfo_);
			
			// formData.append("delFileInfoList",new Blob([JSON.stringify(delFileInfo_)] , {type: "application/json"}));
			// formData.append("key",new Blob([delFileInfoArr] , {type: "application/json"}));
		}
		formData.append("delFileInfoList",new Blob([JSON.stringify(delFileInfoArr)] , {type: "application/json"}));	
		// formData.append("delFileInfoList",JSON.stringify(delFileInfoArr));	
		console.log("KYW",delFileInfoArr);

		// formData.append("delFileInfoList", delFileInfoArr);	// 삭제 정보 append
		let atchFileNo = $("#atchFileNo").val();
		let atchFileNoData = {
			"atchFileNo": atchFileNo
		}
		formData.append("atchFileNo",new Blob([JSON.stringify(atchFileNoData)] , {type: "application/json"}));	

		// 추가할 파일 정보들
		let aplyFiles = $("#sclsFiles2")[0].files;

		for(let i=0; i<aplyFiles.length; i++){
			formData.append("aplyFiles",aplyFiles[i]);		// 추가 정보 append
		}

		// console.log("formData", formData);
		// console.log("formData", formData.getAll("delFileInfoList"));
		
		$.ajax({
			type: "POST",
			url: "/hku/sclsAplyModify",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			// contentType: 'application/json;charset=UTF-8',
			beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
			success: function(res){
				$("#aplyOffcanvasCancelBtn").click();
				swal({
					title: "수정이 완료되었습니다!",
					icon: "success"
				});
				$("#sclsFiles2").val(null);
			},
			error: function(res){
	
			}
		});
	});

	$("#sclsAplyDeleteBtn").on('click', function(){
		swal({
			title: "신청취소를 진행하시겠습니까?",
			text: "취소 후 되돌릴 수 없습니다!",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
				let sclsapNo = $("#sclsapNo").val();
				let atchFileNo = $("#atchFileNo").val();
		
				let delData = {
					"sclsapNo": sclsapNo,
					"atchFileNo": atchFileNo
				}
				console.log("delData",delData);
		
				$.ajax({
					type: "DELETE",
					url: "/hku/deleteSclsAply",
					data: JSON.stringify(delData),
					dataType: "text",
					contentType: 'application/json;charset=UTF-8',
					beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
					success: function(res){
						$("#aplyOffcanvasCancelBtn").click();
						swal({
							title: "신청 취소가 완료되었습니다!",
							icon: "success"
						});
						$("#sclsFiles2").val(null);
						sclsAplyListSet();
					},
					error: function(res){
			
					}
				});
			} else {
				return false;
			}
		});
	});
});

function sclsAplyDetail(target){
	// console.log("체킁~",$(target).children().eq(0).val());
	let sclsapNo = $(target).children().eq(0).val();

	$.ajax({
		type: "GET",
		url: "/hku/sclsAplyDetail?sclsapNo="+sclsapNo,
		dataType: "json",
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(res){
			console.log("장학신청내역 상세");
			console.log("res",res);
			$("#sclsapNo").val(res.sclsapNo);
			$("#sclsNm2").val(res.sclsNm);
			$("#sclsAmt2").val(res.sclsAmt.format()+"원");
			$("#sclsAplyYr2").val(res.sclsapYr);
			$("#sclsAplySem2").val(res.sclsapSem);
			$("#sclsAplyDt2").val(res.sclsapDt.substr(0,10));
			$("#aprvSttsCd2").val(res.aprvSttsCd);
			$("#aprvSttsNm2").val(res.aprvSttsNm);
			$("#sclsapRjctRsn2").val(res.sclsapRjctRsn);
			if(res.aprvSttsCd == "rej"){
				$("#sclsapRjctRsnDiv").css('display','block');
			} else {
				$("#sclsapRjctRsnDiv").css('display','none');
			}

			if(res.aprvSttsCd == "wait"){
				$("#sclsAplyModifyBtn").css('display', 'block');
				$("#sclsAplyDeleteBtn").css('display', 'block');
			} else {
				$("#sclsAplyModifyBtn").css('display', 'none');
				$("#sclsAplyDeleteBtn").css('display', 'none');
			}

			let fileList = res.aplyDetailFiles;
			console.log("fileList",fileList);

			let fileStr = "";
			if(fileList.length > 0 && fileList != null) {
				fileStr += `<input type=hidden id="atchFileNo" value="\${fileList[0].atchFileNo}"/>`;
				fileStr += `<input type=hidden id="fileCount" value="\${fileList.length}"/>`;
				for(let i=0; i<fileList.length; i++) {
					fileStr += `
					<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
						<li>
							<span class="mailbox-attachment-icon"></span>
							<div class="mailbox-attachment-info">
								<span class="btn btn-default btn-sm float-right attachmentFileDel" id="file_\${fileList[i].atchFileNo}_\${fileList[i].atchFileSeq}">
									<i class="fas fa-times"></i>
								</span>
								<a href="/download\${fileList[i].filePath}" class="mailbox-attachment-name" download="\${fileList[i].fileOrgnlFileNm}">
									<i class="fas fa-paperclip"></i>
									\${fileList[i].fileOrgnlFileNm}
								</a>
								<span class="mailbox-attachment-size clearfix mt-1">
									<span>\${fileList[i].fileSize}</span>
									<a href="/download\${fileList[i].filePath}" download="\${fileList[i].fileOrgnlFileNm}">
										<span class="btn btn-default btn-sm float-right"> 
											<i class="fas fa-download"></i>
										</span>
									</a>
								</span>
							</div>
						</li>
					</ul>`;
				}
			} else {
				fileStr += `
				<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
					<li>
						<span class="mailbox-attachment-icon"></span>
						<div class="mailbox-attachment-info">
							<a href="#" class="mailbox-attachment-name"> 
								<i class="fas fa-paperclip"></i> 첨부된 파일이 없습니다.
							</a> 
							<span class="mailbox-attachment-size clearfix mt-1"> 
								<span></span> 
								<a href="#" download="#"> 
									<span class="btn btn-default btn-sm float-right"></span>
								</a>
							</span>
						</div>
					</li>
				</ul>`;
			}
			
			$("#aplyDetailFiles").html(fileStr);
			if(res.aprvSttsCd == "wait"){
				$(".attachmentFileDel").css('display', 'inline-block');
			} else {
				$(".attachmentFileDel").css('display', 'none');
			}
		},
		error: function(res){

		}
	});
}

function sclsAplyListSet(){
	console.log("sclsAplyListSet 실행 체킁");
	let stdNo = "${std.stdNo}";

	$.ajax({
		type: "GET",
		url: "/hku/sclsAplyListSet?stdNo="+stdNo,
		dataType: "JSON",
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(res){
			// alert("신청내역 불러오기 성공");
			// console.log("res",res);

			tblStr = "";
			tblStr += `<div class='table-wrap sclsAplyTb'>
					<table class='table' style='margin-top:-22px;'>
						<thead class='thead-dark'>
							<tr>
								<th>#</th>
								<th>장학 명칭</th>
								<th>신청 년도</th>
								<th>신청 학기</th>
								<th>신청 일자</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>`;
							for(let i=0; i<res.length; i++){
								tblStr += `
								<tr onclick="sclsAplyDetail(this)" data-bs-toggle="offcanvas" href="#sclsAplyOffcanvas" role="button" aria-controls="sclsAplyOffcanvas">
									<input type="hidden" value="\${res[i].sclsapNo}"/>
									<td>\${i+1}</td>
									<td>\${res[i].sclsNm}</td>
									<td>\${res[i].sclsapYr}</td>
									<td>\${res[i].sclsapSem}</td>
									<td>`;
								tblStr += res[i].sclsapDt.substr(0,10);
								tblStr += `</td>
									<td style="display: flex; justify-content: center;">`;
									if(res[i].aprvSttsCd == "wait"){
										tblStr += `<div class="wait">대기</div>`;
									} else if(res[i].aprvSttsCd == "appv"){
										tblStr += `<div class="appv">승인</div>`;
									} else if(res[i].aprvSttsCd == "rej"){
										tblStr += `<div class="rej">반려</div>`;
									}
									tblStr += `</td></tr>`;
							}
			tblStr += `	</tbody></table></div>`;
			
			$("#sclsAplyList").html(tblStr);
		},
		error: function(res){

		}
	});
};

function sclsDetail(target){
	console.log("장학상세", target);

	var sclsCd = $(target).children().eq(1).text();
	var sclsNm = $(target).children().eq(2).text();
	var sclsAmt = $(target).children().eq(3).val();
	var sclsAplyBgngDt = $(target).children().eq(4).val();
	var sclsAplyEndDt = $(target).children().eq(5).val();
	var sclsTerms = $(target).children().eq(6).val();

	console.log(sclsNm);
	console.log(sclsAmt);
	console.log(sclsAplyBgngDt);
	console.log(sclsAplyEndDt);
	console.log(sclsTerms);

	$("#sclsCd").val(sclsCd);
	$("#sclsNm").val(sclsNm);
	$("#sclsAmt").val(sclsAmt + "원");
	$("#sclsAplyBgngDt").val(sclsAplyBgngDt);
	$("#sclsAplyEndDt").val(sclsAplyEndDt);
	$("#sclsTerms").val(sclsTerms);
}

// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function(){
    if(this==0) return 0;
 
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
 
    return n;
};
 
// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
 
    return num.format();
};
</script>