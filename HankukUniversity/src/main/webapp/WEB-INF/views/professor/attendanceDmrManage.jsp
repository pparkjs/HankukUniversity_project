<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">

<style>
.col-lg-6 {
	flex: 0 0 auto;
	width: 100%;
}

.card-title {
	font-size: 1.8em;
}

label {
	font-size: 20px;
	font-weight: 500;
	color: #6e6e6e;
}

.form-label1 {
	color: #6e6e6e;
}

.form-control {
	width: 400px;
}

.bootstrap-select .btn {
	width: 400px;
}
#stdNm{
	width: 31%;
    height: 33px;
    font-size: 16px;
}
#stdNo{
    width: 41%;
    height: 33px;
    font-size: 16px;
}
#atdcWeek{
	height: 33px;
    width: 20%;
    color :gray;
    font-size: 16px;
}
#atdcDmrRsn{
	color :gray;
}
.sModal{
	--bs-modal-width: 530px;
}
.modal-title1{
	display: flex;
    justify-content: space-between;
    margin-bottom: 8px;
}
.modal-content1{
    display: flex;
    justify-content: space-between;
    margin-bottom: 23px;
}
.modal-title3{
	margin-bottom: 8px;
}
.modal-content3{
}
</style>

<div class="content-body" style="min-height: 975px;">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">출석 이의신청</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">메인</a></li>
		</ol>
	</div>
	<div class="container-fluid">
		<div class="row">
		<input type="hidden" name="lecapNo" id="lecapNo" value="${lecapNo}">
			<div class="col-xl-6 col-lg-12" style="width: 100%;">
				<div class="card">
					<div class="card-header aaa" style="height: 64px;">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							출석 이의신청 현황</h4>
							<button type="button" style="padding: 0.5rem 1.0rem; width: 80px;" 
							id="goMainBtn" class="btn btn-danger light">메인</button>
					</div>
					<div class="card-body">
						<div class="basic-form">
							<table class="table" id="dmrTbl">
								<thead class="ths">
									<tr>
										<th>No</th>
										<th>성명</th>
										<th>학과</th>
										<th>학번</th>
										<th>내용</th>
										<th>주차</th>
										<th>파일첨부</th>
										<th>승인상태</th>
									</tr>							
								</thead>
								<tbody id="tBody">
									<c:forEach items="${attendList }" var="list" varStatus="status">
									<c:set var="fileList" value="${list.fileList }"/> <!-- 파일 여러개일 수 있음 -->
									<tr class="trs" id="${list.atdcNo }">
										<td>${status.index + 1}</td>
										<td>${list.stdNm }</td>
										<td>${list.deptNm }</td>
										<td>${list.stdNo }</td>
										<td>${list.atdcDmrRsn }</td>
										<td>${list.atdcWeek }</td>
										<c:forEach items="${fileList }" var="file">
											<td><a href="/download${file.filePath}" download="${file.fileOrgnlFileNm}"
									 			class="btn btn-primary btn-sm" style="background-color:#9d9898; border-color:rgba(255, 255, 255, 0.15);">파일 다운로드</a></td>
								 		</c:forEach>	
								 		<c:if test="${list.stdcDmrSttsCd eq 'wait'}">
											<td><span class="badge badge-rounded badge-warning" style="background-color:#df9212; 
														width:70px; height:30px; font-size:15px;">대기</span></td>
										</c:if>
								 		<c:if test="${list.stdcDmrSttsCd eq 'appv'}">
											<td><span class="badge badge-rounded badge-primary" style="background-color:#143d93;
														width:70px; height:30px; font-size:15px;">승인</span></td>
										</c:if>
								 		<c:if test="${list.stdcDmrSttsCd eq 'rej'}">
											<td><span class="badge badge-rounded badge-primary" style="
														width:70px; height:30px; font-size:15px;">반려</span></td>
										</c:if>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->
<div class="modal fade sModal" id="basicModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: 18px; font-weight: 800;">출석 이의신청 상세</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
				<div class="modal-wrap">
					<input type="hidden" value="${atdcNo}" id="atdcNo" name="atdcNo">
					<div class="modal-title1">
						<span style="font-size: 19px;">성명</span>
						<span style="margin-right: 45px; font-size: 19px;">학번</span>
						<span style="margin-right: 59px; font-size: 19px;">주차</span>
					</div>
					<div class="modal-content1">
						<input type="text" class="form-control" id="stdNm" value="" readonly>
						<input type="text" class="form-control" id="stdNo" value="" readonly>
						<input type="text" class="form-control" id="atdcWeek" readonly>
					</div>
					<div class="modal-title3">
						<span style="font-size:19px;">신청 내용</span>
					</div>
					<div class="modal-content3">
						<textarea rows="10" cols="10" class="form-control" id="atdcDmrRsn" style="width: 466px;" readonly>
						</textarea>
					</div>
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning appvBtn" style="background-color: #001367; border:#001367;">승인</button>
                <button type="button" class="btn btn-primary rejBtn">반려</button>
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script>
$(function(){
	
	var trs = $(".trs");
	$("#dmrTbl tr").click(function(){
		var atdcNo = $("#atdcNo").val(this.id);
		console.log($("#atdcNo").val());
		
		$("#basicModal").modal('show');
		  console.log($(this).find('td').eq(0).text().trim());
		  
		$("#stdNm").val($(this).find('td').eq(1).text().trim())
		$("#stdNo").val($(this).find('td').eq(3).text().trim())
		$("#atdcDmrRsn").val($(this).find('td').eq(4).text().trim())
		$("#atdcWeek").val($(this).find('td').eq(5).text().trim())
	
	})
	
// 	이의신청 승인	
	var appvBtn = $(".appvBtn");
	appvBtn.on("click", function(){
		var atdcNo = $("#atdcNo").val();
		
		let data = {
			atdcNo : atdcNo
		}
		
		$.ajax({
			url: "/hku/professor/attendanceDmr-Appv",
			type : "post",
			data : data,
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				console.log(res)
				
				if(res === "success"){
					swal({
						title: "승인처리가 완료되었습니다.",
						icon: "success",
						button: "닫기",
					});
					location.reload();
					
				} else {
					swal({
						title: "승인 처리에 실패했습니다. 다시 시도해주세요",
						icon: "error",
						button: "닫기",
					});
				}
			}
			
		})
	})
	
// 	이의신청 반려 
	var rejBtn = $(".rejBtn");
	rejBtn.on("click", function(){
		var atdcNo = $("#atdcNo").val();
		
		let data = {
			atdcNo : atdcNo
		}
		
		$.ajax({
			url: "/hku/professor/attendanceDmr-rej",
			type : "post",
			data : data,
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				console.log(res)
				
				if(res === "success"){
					swal({
						title: "반려처리가 완료되었습니다.",
						icon: "success",
						button: "닫기",
					});
					location.reload();
					
				} else {
					swal("", "반려 처리에 실패했습니다. 다시 시도하세요", "error");
				}
			}
			
		})
	})
		
	var goMainBtn = $("#goMainBtn");
	var lecapNo = $("#lecapNo").val();
	goMainBtn.on('click', function(){
		location.href="/hku/professor/classroomMain/"+lecapNo;
	})


})

	

</script>