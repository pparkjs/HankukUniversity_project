<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">


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
			<li class="breadcrumb-item"><a href="javascript:void(0)">출석이의신청</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">클래스룸</a></li>
		</ol>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-6 col-lg-12" style="width: 100%;">
				<div class="card">
					<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							출석 이의신청</h4>
					</div>
					<div class="card-body">
						<div class="basic-form">
							<div class="row">
								<div class="mb-3 col-md-6">
									<label class="form-label1">이름</label> <input type="text"
										class="form-control" readonly value="${std.stdNm }">
								</div>
								<div class="mb-3 col-md-6">
									<label class="form-label1">과목명</label> <input type="text"
										class="form-control" readonly value="${subNm }">
								</div>
								<div class="mb-3 col-md-6">
									<label>파일첨부</label> <input type="file" id="attendanceFile"
										name="attendanceFile" class="form-control"
										style="font-size: 15px;">
								</div>
								<div class="mb-3 col-md-4">
									<label class="form-label">주차</label>
									<div
										class="dropdown bootstrap-select default-select form-control wide">
										<select id="inputState"                 
											class="default-select form-control wide"
											style="width: 300px;">
											<c:forEach begin="1" end="15" var="i" step="1">
												<option style="font-size: 15px;" value="${i }">${i }주차</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6">
								<h4 class="" style="font-size: 20px;">내용</h4>
								<textarea class="form-txtarea form-control" style="width: 76%;"
									rows="7" id="content"></textarea>
							</div>
							<hr>
							<div class="mb-3" style="padding-left: 92%;">
								<button type="button" id="submitBtn" class="btn btn-primary">신청하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-6 col-lg-12" style="width: 100%;">
				<div class="card">
					<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							이의신청 현황</h4>
					</div>
					<div class="card-body ccc" style="padding-top: 0;">
						<table class="table">
							<thead class="thead">
								<tr class="ths" style="background-color: #800000;">
									<th style="font-size: 17px;">No</th>
									<th style="font-size: 17px;">이름</th>
									<th style="font-size: 17px;">학번</th>
									<th style="font-size: 17px;">이의신청주차</th>
									<th style="font-size: 17px;">이의신청내용</th>
									<th style="font-size: 17px;">신청상태</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="tbtb">
								<c:forEach items="${attendDmrList }" var="list" varStatus="status">
									<tr>
										<td>${status.index + 1 }</td>
										<td>${std.stdNm }</td>
										<td>${std.stdNo }</td>
										<td>${list.atdcWeek }</td>
										<td>${list.atdcDmrRsn }</td>
										<c:choose>
											<c:when test="${list.stdcDmrSttsCd eq 'wait'}">
												<td><span class="badge badge-rounded badge-warning" style="background-color:#df9212; 
														width:70px; height:30px; font-size:15px;">대기</span></td>
											</c:when>
											<c:when test="${list.stdcDmrSttsCd eq 'appv'}">
												<td><span class="badge badge-rounded badge-primary" style="background-color:#0a74c1; 
														width:70px; height:30px; font-size:15px;">승인</span></td>
											</c:when>										
											<c:otherwise>
												<td><span class="badge badge-rounded badge-danger" style="background-color:#9b2c2c; 
														width:70px; height:30px; font-size:15px;">반려</span></td>
											</c:otherwise>										
										</c:choose>
										<td>
											<input type="hidden" id="atdcNo" value="${list.atdcNo }">
											<button type="button" class="btn btn-primary mb-2 detailBtn"
												data-bs-toggle="modal" data-bs-target="#basicModal" >상세보기</button>
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
</div>

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
					<input type="hidden" value="${atdcNo}" id="MatdcNo">
					<div class="modal-title1">
						<span style="font-size: 19px;">성명</span>
						<span style="margin-right: 45px; font-size: 19px;">학번</span>
						<span style="margin-right: 59px; font-size: 19px;">주차</span>
					</div>
					<div class="modal-content1">
						<input type="text" class="form-control" id="stdNm" value="${std.stdNm }" readonly >
						<input type="text" class="form-control" id="stdNo" value="${std.stdNo }" readonly>
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
                <button type="button" class="btn btn-primary deleteBtn" >삭제</button>
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script>
$(function(){
	var atdcNo;

	var submitBtn = $("#submitBtn");

	submitBtn.on("click", function() {
		var content = $("#content").val();
		var week = $("#inputState option:selected").val();
		var attendanceFile = $("#attendanceFile").val();
		if (attendanceFile == null || attendanceFile == '') {
			swal("", "파일을 첨부해주세요", "error");
			return false;
		}
		if (content == null || content == '') {
			swal("", "내용을 입력해주세요", "error");
		}

		var data = {
			atdcWeek : week,
			stdNo : "${std.stdNo}",
			lecapNo : "${lecapNo}"
		}

		console.log("이게 맞나?",data)
		$.ajax({
			url : "/hku/student/getAtdcNo",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			contentType : "application/json;charset=utf-8",
			type : 'post',
			data : JSON.stringify(data),
			success : function(res) {
				console.log("전달받은 데이터", res)
				regAtdc(res.ATDC_NO, content);
			}
		})
	})

	function regAtdc(atdcNo, content) {
		var week = $("#inputState option:selected").val();
		var formData = new FormData();
		formData.append("atdcNo", atdcNo);
		formData.append("atdcDmrRsn", content);
		formData.append("lecapNo", "${lecapNo}");
		let sendFile = $('#attendanceFile')[0].files[0];
		console.log("보낼 파일 ", sendFile);

		formData.append("attendanceFile", sendFile);
		console.log("출석번호", atdcNo)

		console.log("폼데이터 : ", formData)
		$.ajax({
			async : false,
			url : "/hku/student/submitAttendDmr",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			type : 'post',
			contentType : false,
			processData : false,
			cache : false,
			data : formData,
			success : function(res) {
				console.log(res);
				if (res === "exist") {
					swal("", "이미 이의신청한 주차입니다.", "error");
				} else if (res === "success") {
					swal("", "이의신청이 완료되었습니다.", "success");
					location.reload();
				} else {
					swal("", "이의신청에 실패하였습니다. 다시 시도하세요.", "error");
				}
			}
		})
	}
	
	var detailBtn = $(".detailBtn");
	detailBtn.on("click", function(){
	 atdcNo = $(this).parent().find('#atdcNo').val();
		$("#MatdcNo").val(atdcNo);
		console.log("이거거"+atdcNo);
		
		let jshData = {
			"atdcNo" : atdcNo	
		};
		
		$.ajax({
			url: "/hku/student/attendDmrDetail",
			type : "post",
			data : JSON.stringify(jshData),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				console.log(res)
				console.log(res.atdcWeek) 
				console.log(res.atdcDmrRsn) 
				$("#atdcWeek").val(res.atdcWeek);
				$("#atdcDmrRsn").val(res.atdcDmrRsn);
			},
			error :function(){
				alert("에러")
			}
		})
	})
	
	var deleteBtn = $(".deleteBtn");
	deleteBtn.on("click", function(){
		var atdcNo = $("#MatdcNo").val();
		
		let jshData = {
			"atdcNo" : atdcNo	
		};
		
		$.ajax({
			url :"/hku/student/deleteAttendDmr",
			type : "post",
			data : JSON.stringify(jshData),
			contentType:"application/json;charset=utf-8",
			dataType : "text",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				console.log("성공이면 ===>", res)
			     swal({
                     title: "이의신청 내역을 삭제하시겠습니까 ? ",
                     text: "삭제 후 복구 불가합니다",
                     icon: "warning",
                     buttons: true,
                     dangerMode: true,
                 })
                     .then((willDelete) => {
                         if (willDelete) {
                           location.reload();  
							swal("", "삭제가 완료되었습니다", "success");
                          };
                     });
				
			},
			error :function(){
				alert("에러")
			}
		})
	});	
	
});	
	

</script>
