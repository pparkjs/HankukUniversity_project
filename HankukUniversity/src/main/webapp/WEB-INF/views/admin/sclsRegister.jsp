<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.table-wrap {
	overflow: scroll;
	height: 494px;
	margin-top: 13px;
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
</style>
<link rel="stylesheet" href="/css/table.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">장학금</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">장학금 정보 등록</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-xl-6 col-lg-12">
						<div class="card">
							<div class="card-header" style="display: flex; justify-content: space-between;">
								<h4 class="card-title" style="font-size: 1.5em; font-weight: bold;">장학금 정보</h4>
								<a href="javascript:void(0)" class="btn btn-primary ms-2" id="addSclsBtn" style="padding: 5px 17px;">장학 추가</a>
							</div>
							<div class="card-body">
								<div class="table-wrap">
									<table class="table" style="margin-top: -22px; height: 300px;">
										<thead class="thead-dark">
											<tr>
												<th style="width:80px;">장학번호</th>
												<th style="width:150px;">장학명</th>
											</tr>
										</thead>
										<tbody id="allTbody">
											<c:forEach items="${sclsList }" var="scls">
												<tr>
													<td>
														<c:out value="${scls.sclsCd }"/>
													</td>
													<td>
														<c:out value="${scls.sclsNm }"/>
														<input type="hidden" id="sclsAmt" value="${scls.sclsAmt }">
														<input type="hidden" id="sclsAplyBgngDt" value="${scls.sclsAplyBgngDt }">
														<input type="hidden" id="sclsAplyEndDt" value="${scls.sclsAplyEndDt }">
														<input type="hidden" id="sclsTerms" value="${scls.sclsTerms }">
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" style="font-size: 1.5em; font-weight: bold;">장학금 상세보기</h4>
							</div>
							<div class="card-body">
								<form class="row" id="sclsFrm">
									<div class="col-lg-6 mb-2">
										<div class="mb-2">
											<!-- 장학코드 -->
											<table border="1" style="width: 100%;">
												<tr>
													<td class="table-info-td">장학코드</td>
													<td><input type="text" name="sclsCd" class="form-control" id="dsclsCd" value="" disabled></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="col-lg-6 mb-2">
										<div class="mb-2">
											<!-- 장학명 -->
											<table border="1" style="width: 100%;">
												<td class="table-info-td">장학명</td>
												<td><input type="text" name="sclsNm" class="form-control" id="dsclsNm" value="" disabled></td>
											</table>
										</div>
									</div>
									<div class="col-lg-12 mb-2">
										<div class="mb-2">
											<table border="1" style="width: 100%;">
												<tr>
													<td class="table-info-td">장학금</td>
													<td><input type="text" name="sclsAmt" class="form-control" id="dsclsAmt" value="" disabled></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="col-lg-12 mb-2">
										<div class="mb-2">
											<!-- 신청가능일 신청 마감일 -->
											<table border="1" style="width: 100%;">
												<tr>
													<td class="table-info-td"></td>
													<td class="table-info-td">신청 가능일</td>
													<td class="table-info-td">신청 마감일</td>
												</tr>
												<tr>
													<td class="table-info-td">날짜</td>
													<td><input type="date" name="sclsAplyBgngDt" disabled class="form-control" id="dsclsAplyBgngDt"></td>
													<td><input type="date" name="sclsAplyEndDt" disabled class="form-control" id="dsclsAplyEndDt"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="col-lg-12 mb-2">
										<div class="mb-2">
											<!-- 장학 조건 -->
											<table border="1" style="width: 100%;">
												<tr>
													<td class="table-info-td">장학조건</td>
													<td>
														<textarea style="width: 100%; height: auto;" disabled name="sclsTerms" id="dsclsTerms" cols="30" rows="10"></textarea>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</form>
								<div class="toolbar toolbar-bottom" role="toolbar" style="text-align: right;">
									<button class="btn btn-primary sw-btn-prev" type="button" id="delBtn">삭제</button>
									<button class="btn btn-primary sw-btn-next" type="button" id="modifyBtn">수정</button>
								</div>
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
	var allTbody = $('#allTbody');
	var addSclsBtn = $('#addSclsBtn');
	var sclsFrm = $('#sclsFrm');
	var modifyBtn = $('#modifyBtn');
	var delBtn = $('#delBtn');
	
	
	// 해당 tr 눌럿 을때 상세 보기
	allTbody.on('click','tr',function(){
		$('#sclsFrm :input').prop('disabled', true);
		console.log(this);
		
		$('#dsclsCd').val($(this).find('td').eq(0).text().trim());
		$('#dsclsNm').val($(this).find('td').eq(1).text().trim());
		$('#dsclsAmt').val($(this).find('#sclsAmt').val());
		$('#dsclsAplyBgngDt').val($(this).find('#sclsAplyBgngDt').val().split(" ")[0]);
		$('#dsclsAplyEndDt').val($(this).find('#sclsAplyEndDt').val().split(" ")[0]);
		$('#dsclsTerms').val($(this).find('#sclsTerms').val());
	});

	addSclsBtn.on('click', function(){
		console.log("장학 추가");
		$('#addModal').modal('show');
	});

	$('#mAddSclsBtn').on('click',function(){
		console.log("등록 추가");
		var isEmpty = false;
		$('#addSclsFrm :input').each(function() {
			if($(this).val() == '' || $(this).val() == null) {
				swal({
					title : "장학 정보를 입혁해주세요.",
					icon : "error"
				});
				isEmpty = true;
				return false; // each문 종료
			}
		});
		if(isEmpty){
			return false;
		}
		let amt = $('#addSclsFrm').find('#dsclsAmt').val();
		if (isNaN(amt) || parseInt(amt) > 3500001) {
			swal({
				title : "장학금을 숫자로만 입력해주세요.",
				text : "350만원 이하로만 입력해주세요.",
				icon : "error"
			});
			return false;
		}


		let formData = new FormData($('#addSclsFrm')[0]);

		console.log("formData", formData);
		$.ajax({
			url:"/hku/admin/scholarship-info",
			type: 'post',
			beforeSend : function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			contentType: false, // 필수 
			processData: false,
			cache : false,
			data: formData,
			dataType: 'text',
			success: function(res){
				if(res == "1"){
					swal({
						title : "장학이 추가되었습니다.",
						icon : "success"
					});
					location.reload();
				}
			}
		});
	});

	delBtn.on('click', function(){
		if($(this).text().trim() == "삭제"){
			var isEmpty = false;
			$('#sclsFrm :input').each(function() {
				if($(this).val() == '' || $(this).val() == null) {
					swal({
						title : "장학 정보를 선택해주세요.",
						icon : "error"
					});
					isEmpty = true;
					return false; // each문 종료
				}
			});
			if(isEmpty){
				return false;
			}
			swal({
				title: '장학 정보를 삭제 하시겠습니까?',
				icon: 'warning',
				buttons: true,
				dangerMode: true,
			}).then((willDelete) => {
				if (willDelete) {
					// 삭제 처리하기 메소드 구현해야함
					let sclsCd = $('#sclsFrm').find('#dsclsCd').val()
					console.log("sclsCd", sclsCd);

					$.ajax({
						url:"/hku/admin/scholarship-info",
						type: 'delete',
						contentType: "application/json;charset=utf-8", // 필수 
						beforeSend : function(xhr){
			               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			            },
						data: JSON.stringify({sclsCd:sclsCd}),
						dataType: 'text',
						success: function(res){
							console.log(res);
							if(res == '1'){
								swal({
									title : "해당 장학 정보가 삭제 되었습니다.",
									icon : "success"
								});
								location.reload();
							}
						}
					});
				}
			});
		}else if($(this).text().trim() == "취소"){
			sclsFrm[0].reset();
			$('#sclsFrm :input').prop('disabled', true);
			$(this).text("삭제");
		}
	});
	
	modifyBtn.on('click',function(){
		if($('#sclsFrm :input').prop('disabled')){
			var isEmpty = false;
			$('#sclsFrm :input').each(function() {
				if($(this).val() == '' || $(this).val() == null) {
					swal({
						title : "장학 정보를 선택해주세요.",
						icon : "error"
					});
					isEmpty = true;
					return false; // each문 종료
				}
			});
			if(isEmpty){
				return false;
			}
			$('#sclsFrm :input').prop('disabled', false);
			$('#dsclsCd').prop('readonly', true);
			delBtn.text("취소");
		}else{

			$('#sclsFrm :input').each(function() {
				if($(this).val() == '' || $(this).val() == null) {
					swal({
						title : "장학 정보를 입력 해주세요.",
						icon : "error"
					});
					isEmpty = true;
					return false; // each문 종료
				}
			});
			if(isEmpty){
				return false;
			}

			let amt = $('#sclsFrm').find('#dsclsAmt').val();
			if (isNaN(amt) || parseInt(amt) > 3500001) {
				swal({
					title : "장학금을 숫자로만 입력해주세요.",
					text : "350만원 이하로만 입력해주세요.",
					icon : "error"
				});
				return false;
			}

			var formData = new FormData($('#sclsFrm')[0]);

			console.log("폼데이타",formData);

			$.ajax({
				url:"/hku/admin/scholarship-info",
				type: 'put',
				beforeSend : function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				contentType: false, // 필수 
				processData: false,
				cache : false,
				data: formData,
				dataType: 'text',
				success: function(res){
					console.log(res);
					if(res == '1'){
						swal({
							title : "장학정보가 변경 되었습니다.",
							icon : "success"
						});
						location.reload();
					}
				}
			});
		}
	});
});
</script>
<div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true" id="addModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="font-weight: bold;">장학 추가</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal">
				</button>
			</div>
			<div class="modal-body">
				<form class="row" id="addSclsFrm">
					<div class="col-lg-6 mb-2">
						<div class="mb-2">
							<!-- 장학명 -->
							<table border="1" style="width: 100%;">
								<td class="table-info-td">장학명</td>
								<td><input type="text" name="sclsNm" class="form-control" id="dsclsNm" value=""></td>
							</table>
						</div>
					</div>
					<div class="col-lg-12 mb-2">
						<div class="mb-2">
							<table border="1" style="width: 100%;">
								<tr>
									<td class="table-info-td">장학금</td>
									<td><input type="text" name="sclsAmt" class="form-control" id="dsclsAmt"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="col-lg-12 mb-2">
						<div class="mb-2">
							<!-- 신청가능일 신청 마감일 -->
							<table border="1" style="width: 100%;">
								<tr>
									<td class="table-info-td"></td>
									<td class="table-info-td">신청 가능일</td>
									<td class="table-info-td">신청 마감일</td>
								</tr>
								<tr>
									<td class="table-info-td">날짜</td>
									<td><input type="date" name="sclsAplyBgngDt" class="form-control" id="dsclsAplyBgngDt"></td>
									<td><input type="date" name="sclsAplyEndDt" class="form-control" id="dsclsAplyEndDt"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="col-lg-12 mb-2">
						<div class="mb-2">
							<!-- 장학 조건 -->
							<table border="1" style="width: 100%;">
								<tr>
									<td class="table-info-td">장학조건</td>
									<td>
										<textarea style="width: 100%; height: auto;" name="sclsTerms" id="dsclsTerms" cols="30" rows="10"></textarea>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="mAddSclsBtn">등록</button>
			</div>
		</div>
	</div>
</div>