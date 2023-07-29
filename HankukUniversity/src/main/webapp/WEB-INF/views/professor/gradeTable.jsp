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
											<th>총점</th>
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
													 id="attendScr" name="attendScr" value="${list.attendScr }"/>
											</td>
											<td>
												<input type="text" style="width:45px; border:1px solid #afaeae; text-align: center;"
													id="assignScr" name="assignScr" value="${list.assignScr }"/>
											</td>
											<td>
												<input type="text" style="width:45px; border:1px solid #afaeae; text-align: center;"
													id="middleScr" name="middleScr" value="${list.middleScr }"/>
											</td>
											<td>
												<input type="text" style="width:45px; border:1px solid #afaeae; text-align: center;"
													id="finalScr" name="finalScr" value="${list.finalScr }"/>
											</td>
											<td><span></span></td>
											<td><span></span></td>
											<td>
												<button type="button" id="conFirmBtn" class="btn btn-primary" 
													style="">성적확정</button>			
											</td>
											<c:if test="${list.confirmYn eq 'Y'}">
												<td>
													<button type="button" id="modifyBtn" class="btn btn-primary" 
														style="">수정</button>			
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
	
	var lecapNo = $("#lecapNo").val();
	console.log("lecapNo!! => " +lecapNo);
	var attendScr = $("#attendScr").val();
	var assignScr = $("#assignScr").val();
	var middleScr = $("#middleScr").val();
	var finalScr = $("#finalScr").val();
	var finalCredit = "";
	var totalScr = "";
	totalScr = attendScr + assignScr + middleScr + finalScr;
	alert(totalScr);
	
	function calculScore(){
		
		attendScr = attendScr * 0.2
		assignScr = assignScr * 0.3
		totalScr = attendScr + assignScr + middleScr + finalScr;
		
		if(totalScr > 380){
			finalCredit  = "A+";
		} else if (totalScr > 350 ){
			finalCredit =  "A";
		} else if(totalScr > 330 ){
			finalCredit = "B+";
		} else if(totalScr > 300 ){
			finalCredit = "B";
		} else if(totalScr > 270 ){
			finalCredit = "C+";
		} else if(totalScr > 240 ){
			finalCredit = "C";
		} else if(totalScr > 210 ){
			finalCredit = "D";
		} else {
			finalCredit = "F";
		}
	}
	
	var conFirmBtn = $("#conFirmBtn");
	conFirmBtn.on("click", function(){
		if(finalScr == null || finalScr == ""){
			swal("", "모든 항목의 점수 입력 후 성적확정 가능합니다", "info");
		}
	
	})
	
	

</script>