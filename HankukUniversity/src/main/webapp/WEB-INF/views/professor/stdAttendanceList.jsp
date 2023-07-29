<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.active-projects.attendance-tbl thead tr th:not(:first-child) {
    padding: 15px 22px;
}

.active-projects.attendance-tbl tbody tr td:not(:first-child) {
    padding: 15px 7px;
    text-align: center;
    align-items: center;
}

.active-projects.attendance-tbl thead span {
    font-size: 15px;
    margin-bottom: 0;
    color: var(--secondary);
}
.active-projects.attendance-tbl tbody tr td:not(:first-child) {
	font-size: 15px;
}

</style>

<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">출석관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">클래스룸</a></li>
		</ol>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-12" style="overflow: scroll;">
				<div class="card">
				<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							출결관리</h4>
						<button type="button" id="listBtn" class="btn btn-primary btn-sm"
							data-bs-toggle="modal" data-bs-target="#exampleModal"
								style="width:65px; height:35px;">
							<p style="font-size:14px;">목록</p></button>
					</div>
					<input type="hidden" name="lecapNo" id="lecapNo" value="${lecapNo }" >
					<div class="card-body p-0">
						<div
							class="table-responsive active-projects style-1 attendance-tbl">
							<div class="tbl-caption">
								
							</div>
							<div id="attendance-tbl_wrapper"
								class="dataTables_wrapper no-footer">
								<table id="attendance-tbl" class="table dataTable no-footer"
									role="grid" aria-describedby="attendance-tbl_info">
									<thead>
										<tr>
											<th class="sorting_asc" tabindex="0"
												aria-controls="attendance-tbl" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="Employee Name: activate to sort column descending"
												style="width: 158.7px; text-align: center;"><span>성명 | 학과</span></th>
											<c:forEach var="i" begin="1" end="15" step="1">
											<th class="sorting" tabindex="0"
												aria-controls="attendance-tbl" rowspan="1" colspan="1"
												aria-label="
															1
															MO
														: activate to sort column ascending"
												style="width: 16.9125px;"><span>${i }주차</span>
											</th>
											</c:forEach>
											<th class="text-center sorting" tabindex="0"
												aria-controls="attendance-tbl" rowspan="1" colspan="1"
												aria-label="
															Total
															MO
														: activate to sort column ascending"
												style="width: 35.8px;"><span>총 출석일수</span>
											</th>
											</thead>
									<tbody id="atTbody">
										<!-- 출석 리스트 동적 생성 -->										
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
$(function(){
	getStdAttend();
	
	var listBtn = $("#listBtn");
	listBtn.on("click", function(){
	var lecapNo = $("#lecapNo").val();
		location.href="/hku/professor/classroomMain/" + lecapNo;
	})
	
	function getStdAttend(){
		var lecapNo = $("#lecapNo").val();
		
		var data = {
			lecapNo : lecapNo
		}
		
		$.ajax({
			url : "/hku/professor/getStdAttendance",
			type : "get",
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			data : data,
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				console.log(res);
				var tbl = "";// tr만들고
				
				for(let i=0; i<res.length; i++){
					let stdData = res[i];
					tbl += `<tr role="row" class="odd">`
					tbl += `<td class="sorting_1">
								<div class="products">
									<img src="/resources/images/profile11.png"
										class="avatar avatar-md" alt="">
									<div>
										<h6>\${stdData.stdNm}</h6>
										<h6>\${stdData.stdNo}</h6>
										<h6>\${stdData.deptNm}</h6>
									</div>
								</div>
							</td>`	
					
					
					// 위  데이터 무시하고 새로 담기
					data = {
						lecapNo : lecapNo,
						stdNo:stdData.stdNo
					};
					console.log("===========================");
					$.ajax({ // 여기가 실행되기 전에 포문은 더 빨리 돈다!
						async: false,
						url : "/hku/professor/getStdAttendance-list",
						type : "get",
						contentType : "application/json;charset=utf-8",
						dataType : "json",
						data : data,
						beforeSend : function(xhr){
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success : function(result){
							console.log("학생 출석 데이터", result);
							// td안에  출결 여부
							var totalAttend = 0;
							for(let j = 0; j < result.length; j++){
							tbl += "<td class='tdClick'>";
								if(result[j].atdcYnCd == 'N'){
									tbl += `<input type="hidden" id='\${result[j].atdcNo}'>
											<input type="hidden" value='\${result[j].atdcYnCd}'>
											<span class="text-danger">
												<i class="fa-regular fa-xmark" style="width:15px;"></i>
											</span>`;
								}
								if(result[j].atdcYnCd == 'Y'){
									totalAttend++;
									tbl += `<input type="hidden" id='\${result[j].atdcNo}'>
											<input type="hidden" value='\${result[j].atdcYnCd}'>
											<span class="text-success" style="width:15px;">
												<i class="fa-solid fa-check"></i>
											</span>`;
								} if(result[j].atdcYnCd == 'x') {
									tbl += `<input type="hidden" id='\${result[j].atdcNo}'>
											<input type="hidden" value='\${result[j].atdcYnCd}'>
											<span>
												<img src="/resources/images/jshminus.png" style="width:12px;">
											</span>`;
								}			
								tbl += `</td>`;
							}
								tbl += `<td style="font-size:1">\${totalAttend}/15</td>`
						}	
					});// 두번쨰 ajax 끝
					console.log("===========================");
					tbl += "</tr>";
				}
				$('#atTbody').html(tbl);
			}			
		});
	}	
	
	var atTbody = $("#atTbody");
	atTbody.on("click", '.tdClick', function(){
		
		console.log(".tdClick : ", $(this).find('input').eq(0).attr('id'));
		console.log(".tdClick : ", $(this).find('input').eq(1).val());
		
		var atdcNo = $(this).find('input').eq(0).attr('id');
		var atdcYnCd = $(this).find('input').eq(1).val();
		
		let sendData = {
				atdcNo : atdcNo,
				atdcYnCd :atdcYnCd
		}
		
		$.ajax({
			type :"put",
			url : "/hku/professor/updateAttendance",
			data : JSON.stringify(sendData),
			dataType : 'text',
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				if(res == "success"){
					getStdAttend();
					swal({
	                     title: "출결 상태를 변경하시겠습니까 ? ",
	                     text: "학생의 이름을 확인해주세요",
	                     icon: "warning",
	                     buttons: true,
	                     dangerMode: true,
	                 })
	                     .then((willDelete) => {
	                         if (willDelete) {
	                           location.reload();  
								swal("", "출결 변경이 완료되었습니다", "success");
	                          };
	                     });
				}
			}
			
		})
		
	})
	
	
})


</script>

