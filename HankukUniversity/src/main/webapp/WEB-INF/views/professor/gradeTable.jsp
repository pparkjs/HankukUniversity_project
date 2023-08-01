<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<style>
.active-projects thead tr th {
    font-size: 16px;
    background-color: #800000;
}
span{
	font-size: 14px;
}
.active-projects.manage-client tbody tr td:last-child {
    text-align: center;
}
</style>

<input type="hidden" id="lecapNo" value="${lecapNo}" name="lecapNo">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">성적관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">클래스룸</a></li>
		</ol>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-12">
				<div class="card">
						<div class="card-header aaa">
							<h4 class="card-title"
								style="font-weight: bold; font-size: 1.2em; color: #800000;">
								성적관리</h4>
						</div>
					<div class="card-body">
						<div class="table-responsive active-projects manage-client">
							<div id="reports-tbl_wrapper"
								class="dataTables_wrapper no-footer">
								<div class="dt-buttons">
								</div>
								<table class="table">
									<thead class="">
										<tr> 
											<th>No</th>
											<th>성명</th>
											<th>학과</th>
											<th>학번</th>
											<th>출석점수</th>
											<th>과제점수</th>
											<th>중간고사</th>
											<th>기말고사</th>
											<th>평점</th>
											<th>학점</th>
											<th style="text-align: center;">성적부여</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="tBody">
									<c:forEach items="${getStdList }" var="list" varStatus="status">
										<tr>
											<td>${status.index+1 }</td>
											<td><span id="stdNm">${list.stdNm }</span></td>
											<td><span id="stdNo">${list.stdNo }</span></td>
											<td><span id="deptNm">${list.deptNm }</span></td>
											<td>
												<input type="text" style="width:45px; border:1px solid #afaeae; text-align: center;" 
													 id="attendScr" name="attendScr" value="${list.attendScr }" disabled="disabled"/>
											</td>
											<td>
												<input type="text" style="width:45px; border:1px solid #afaeae; text-align: center;"
													id="assignScr" name="assignScr" value="${list.assignScr }" disabled="disabled" />
											</td>
											<td>
												<input type="text" style="width:45px; border:1px solid #afaeae; text-align: center;"
													id="middleScr" name="middleScr" value="${list.middleScr }"/>
											</td>
											<td>
												<input type="text" style="width:45px; border:1px solid #afaeae; text-align: center;"
													id="finalScr" name="finalScr" value="${list.finalScr }"/>
											</td>
											<td><span>${list.crsScr }</span></td>
											<td><span>${list.crsGrd }</span></td>
											<c:if test="${list.confirmYn eq 'N'}">
												<td>
													<button type="button" id="conFirmBtn" class="btn btn-primary conFirmBtn" 
														style="" value="${list.lecapNo}">성적확정</button>			
												</td>
											</c:if>
											<c:if test="${list.confirmYn eq 'Y'}">
												<td>
													<span style="color:red; font-size:16px;">완료</span>			
												</td>
											<td>
												<button type="button" id="modifyBtn" class="btn btn-primary" 
													style="" value="${list.lecapNo}">수정</button>			
											</td>
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
</div>
<script>
// 	confirmScore();
// 	calculScore();
	
	function calculScore(pObj){
		var lecapNo = $("#lecapNo").val();
		console.log("lecapNo!! => " +lecapNo);
		var stdNo = $(pObj).parents('tr').find('td').eq(2).text().trim();
		var attendScr = $(pObj).parents('tr').find("#attendScr").val();
		var assignScr = $(pObj).parents('tr').find("#assignScr").val();
		var middleScr = $(pObj).parents('tr').find("#middleScr").val();
		var finalScr = $(pObj).parents('tr').find("#finalScr").val();
		var crsScr = "";	 	// ex) 4.5 
		var grade = "";
		var totalScr = attendScr + assignScr + middleScr + finalScr;
		
		var percent = totalScr/450*100
		if(percent >= 95 && attendScr > 110){
			crsScr = "4.5";
			grade = "A+";
		} else if (percent > 90 && attendScr > 110){
			crsScr =  "4.0";
			grade = "A";
		} else if(percent > 85 && attendScr > 110){
			crsScr = "3.5";
			grade = "B+";
		} else if(percent > 80 && attendScr > 110){
			crsScr = "3.0";
			grade = "B";
		} else if(percent > 75 && attendScr > 110){
			crsScr = "2.5";
			grade = "C+";
		} else if(percent > 70 && attendScr > 110){
			crsScr = "2.0";
			grade = "C";
		} else if(percent > 65 && attendScr > 110){
			crsScr = "1.5";
			grade = "D+";
		} else if(percent > 60 && attendScr > 110){
			crsScr = "1.0";
			grade = "D";
		} else {
			crsScr = "0";
			grade = "F";
		}
		
		return {
			crsScr : crsScr,
			crsGrd : grade,
			middleScr: middleScr,
			finalScr:finalScr,
			lecapNo:lecapNo,
			stdNo:stdNo
		}
	}
	
	
	$('#tBody').on("click",'#conFirmBtn', function(){
		console.log(this)
		let sendData = calculScore(this);
		console.log(sendData);
		
		if(sendData.middleScr == null || sendData.middleScr == "" || sendData.middleScr == "0"){
			swal("", "모든 항목의 점수 입력 후 성적확정 가능합니다", "info");
		} 
		
		if(sendData.finalScr == null || sendData.finalScr == "" || sendData.finalScr == "0"){
			swal("", "모든 항목의 점수 입력 후 성적확정 가능합니다", "info");
		} 
		
	
		$.ajax({
			url : "/hku/professor/confirmScore",
			type : "post",
			data : JSON.stringify(calculScore()),
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				console.log(res) 
				data = "";
				data += "<td></td>";
				
				
			}
		})
	});
	
// 	function confirmScore(){
// 		var conFirmBtn = $(".conFirmBtn");
// 		var attendScr = $("#attendScr").val();
// 		var assignScr = $("#assignScr").val();
// 		var middleScr = $("#middleScr").val();
// 		var finalScr = $("#finalScr").val();
// 		var crsScr = "";	 	// ex) 4.5 
// 		var grade = "";
		
		
		
// 		conFirmBtn.on("click", function(){
// 			var stdNo = $(this).parents('tr').find('td').eq(2).text().trim();
			
// 			alert(stdNo);
			
// 			console.log(calculScore());
// 			if(finalScr == null || finalScr == "" || finalScr == "-"){
// 				swal("", "모든 항목의 점수 입력 후 성적확정 가능합니다", "info");
// 			} 
			
// 			$.ajax({
// 				url : "/hku/professor/confirmScore",
// 				type : "post",
// 				data : JSON.stringify(calculScore(stdNo)),
// 				dataType : "json",
// 				contentType : "application/json;charset=utf-8",
// 				beforeSend : function(xhr){
// 					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 				},
// 				success : function(res){
// 					console.log(res) 
// 					data = "";
					
// 				}
// 			})
// 		})
// }
	
	
	var modifyBtn = $("#modifyBtn");
	modifyBtn.on("click", function(){
		var middleScr = $("#middleScr").val();
		var finalScr = $("#finalScr").val(); 
		var lecapNo = $("#lecapNo").val();
		var stdNo = $(this).parents('tr').find('td').eq(2).text().trim();
		alert(stdNo)
		
		var StdData = {
				stdNo : stdNo,
				lecapNo : lecapNo,
				middleScr : middleScr,
				finalScr : finalScr
		}
		
		$.ajax({
			url : "/hku/professor/modifyScore",
			type : "post",
			data : JSON.stringify(StdData),
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				console.log(res) 
				data = "";
				
				
			}
		})
		
		
	})
	

	
</script>