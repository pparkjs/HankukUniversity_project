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
											<th>평점</th>
											<th>학점</th>
											<th style="text-align: center;">성적부여</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="tBody">
									<c:forEach items="${stdList }" var="list" varStatus="status">
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
											<td><span>${list.attendScr + list.assignScr + list.middleScr + list.finalScr }/100</span></td>
											<td><span id="crsScr">${list.crsScr }</span></td>
											<td><span id="crsGrd">${list.crsGrd }</span></td>
											<c:if test="${list.confirmYn eq 'N'}">
												<td>
													<button type="button" id="conFirmBtn" class="btn btn-primary conFirmBtn" 
														style="padding: 6px 17px; background: #0070c0; border-color: #0070c0;" value="${list.lecapNo}">성적확정</button>			
												</td>
												<td></td>
											</c:if>
											<c:if test="${list.confirmYn eq 'Y'}">
												<td>
													<span style="color:red; font-size:16px;">완료</span>			
												</td>
											<td>
												<button type="button" id="modifyBtn" class="btn btn-primary" 
													style="padding: 4px 17px; background: #ff4343; border-color: #ff4343;" value="${list.lecapNo}">수정</button>			
											</td>
											</c:if>
										</tr>
										<input type="hidden" id="lecpgMdTest" value="${list.lecpgMdTest}" name="lecpgMdTest">
										<input type="hidden" id="lecpgFnTest" value="${list.lecpgFnTest}" name="lecpgFnTest">
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

	function calculScore(pObj){
		var lecapNo = $("#lecapNo").val();
		console.log("lecapNo!! => " +lecapNo);
		var stdNo = $(pObj).parents('tr').find('td').eq(2).text().trim();
		var attendScr = $(pObj).parents('tr').find("#attendScr").val();
		var assignScr = $(pObj).parents('tr').find("#assignScr").val();
		var middleScr = $(pObj).parents('tr').find("#middleScr").val();
		var finalScr = $(pObj).parents('tr').find("#finalScr").val();
		var crsScr = $(pObj).parents('tr').find("#crsScrs").val();
		var grade =  $(pObj).parents('tr').find("#grade").val();
		var totalScr = parseInt(attendScr) + parseInt(assignScr) + parseInt(middleScr) + parseInt(finalScr);
		
		if(totalScr >= 90){
			crsScr = "4.5";
			grade = "A+";
		} else if (totalScr >= 85){
			crsScr =  "4.0";
			grade = "A";
		} else if(totalScr >= 80){
			crsScr = "3.5";
			grade = "B+";
		} else if(totalScr >= 70){
			crsScr = "3.0";
			grade = "B";
		} else if(totalScr >= 65){
			crsScr = "2.5";
			grade = "C+";
		} else if(totalScr > 60){
			crsScr = "2.0";
			grade = "C";
		} else if(totalScr > 50 ){
			crsScr = "1.5";
			grade = "D+";
		} else if(totalScr > 40){
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
			stdNo:stdNo,
			totalScr: totalScr
		}
	}
	
	$('#tBody').on("click",'#conFirmBtn', function(){
		console.log($(this).parents('tr')[0])
		let sendData = calculScore(this);
// 		console.log(sendData);
		let myTr = $(this).parents('tr');
		if(sendData.middleScr == null || sendData.middleScr == ""){
			swal("", "모든 항목의 점수 입력 후 성적확정 가능합니다", "info");
		} 
		
		if(sendData.finalScr == null || sendData.finalScr == ""){
			swal("", "모든 항목의 점수 입력 후 성적확정 가능합니다", "info");
		} 
		
		$.ajax({
			url : "/hku/professor/confirmScore",
			type : "post",
			data : JSON.stringify(sendData),
			dataType : "text",
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				console.log("성공햇니?", res);
				if(res == "success"){
					swal("", "성적 확정이 완료되었습니다.", "success");					
					let data = "";
					
					data = `<span>\${sendData.crsScr}</span>`
					$(myTr).find('td').eq(9).html(data);
					
					data = `<span>\${sendData.crsGrd}</span>`
					$(myTr).find('td').eq(10).html(data);
					
					data = `<span style="color:red;">완료</span>`
					$(myTr).find('td').eq(11).html(data);
					
					data = `<button type="button" id="modifyBtn" class="btn btn-primary" 
						style="padding: 4px 17px; background: #ff4343; border-color: #ff4343;" value="\${sendData.lecapNo}">수정</button>`
					$(myTr).find('td').eq(12).html(data);
				}
			}
		})
	});
	
	
	$(tBody).on("click","#modifyBtn", function(){
		var lecpgMdTest = parseInt($("#lecpgMdTest").val());
		var lecpgFnTest = parseInt($("#lecpgFnTest").val());
		console.log("=======>" + lecpgMdTest)
		console.log("=======>" + lecpgFnTest)
// 		console.log($(this).parents('tr')[0]);
		let myTr = $(this).parents('tr');
		
		
		let newData = calculScore(this);
		newData.middleScr = Math.round((parseInt(newData.middleScr)*100)/lecpgMdTest);
		newData.finalScr = Math.round((parseInt(newData.finalScr)*100)/lecpgFnTest);
		console.log(newData);
// 		console.log(newData.middleScr);

		$.ajax({
			url : "/hku/professor/modifyScore",
			type : "put",
			data : JSON.stringify(newData),
			dataType : "text",
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				console.log(res) 
				if(res == "success"){
					swal("", "수정이 완료 되었습니다.", "success");					
					
					let data = "";
					
					data = `<span>\${newData.totalScr}/100</span>`
					$(myTr).find('td').eq(8).html(data);
					
					data = `<span>\${newData.crsScr}</span>`
					$(myTr).find('td').eq(9).html(data);
					
					data = `<span>\${newData.crsGrd}</span>`
					$(myTr).find('td').eq(10).html(data);
				}
				
			}
		})
		
		
	})
	

	
</script>