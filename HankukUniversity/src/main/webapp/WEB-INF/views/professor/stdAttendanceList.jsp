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
					<input type="hidden" name="lecapNo" id="lecapNo" value="${attendVo.lecapNo }" >
					<div class="card-body p-0">
						<div
							class="table-responsive active-projects style-1 attendance-tbl">
							<div class="tbl-caption">
								<h4 class="heading mb-0">출석관리</h4> 
								<div>
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary btn-sm"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										저장하기</button>
								</div>
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
											
											
									<tbody>
										<tr role="row" class="odd">
											<td class="sorting_1">
												<div class="products">
													<img src="images/contacts/pic2.jpg"
														class="avatar avatar-md" alt="">
													<div>
														<h6>고영우</h6>
														<span>컴퓨터공학</span>
													</div>
												</div>
											</td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-danger"><i
													class="fa-regular fa-xmark"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-danger"><i
													class="fa-regular fa-xmark"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td class="text-center"><span>13/15</span></td>
										</tr>
										<tr role="row" class="even">
											<td class="sorting_1">
												<div class="products">
													<img src="images/contacts/pic3.jpg"
														class="avatar avatar-md" alt="">
													<div>
														<h6>박정수</h6>
														<span>컴퓨터공학</span>
													</div>
												</div>
											</td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-danger"><i
													class="fa-regular fa-xmark"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-danger"><i
													class="fa-regular fa-xmark"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td class="text-center"><span>28/31</span></td>
										</tr>
										<tr role="row" class="odd">
											<td class="sorting_1">
												<div class="products">
													<img src="images/contacts/pic1.jpg"
														class="avatar avatar-md" alt="">
													<div>
														<h6>박지현</h6>
														<span>컴퓨터공학</span>
													</div>
												</div>
											</td>
											<td>
												<span class="text-success">
													<i class="fa-solid fa-check"></i>
												</span>
											</td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-danger"><i
													class="fa-regular fa-xmark"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-danger"><i
													class="fa-regular fa-xmark"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td><span class="text-success"><i
													class="fa-solid fa-check"></i></span></td>
											<td class="text-center"><span>28/31</span></td>
										</tr>
	
			
										
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
	// getStdList();
	
	
	// function getStdList(){
	// 	var tBody = $("#tBody");
	// 	var attendObj = {
	// 		lecapNo : "${lecapNo}"
	// 	}
		
	// 	$.ajax({
	// 		url : "/hku/professor/stdAttendanceList",
	// 		type : "get",
	// 		data : attendObj,
    //         dataType : "json",
	// 		success : function(res){
	// 			console.log(res);
				
	// 			data = "";
	// 			for(var i = 0; i < res.length; i++){
	// 				data += `<tr role="row" class="odd">
	// 							<td class="sorting_1">
	// 							<div class="products">
	// 								<img src="images/contacts/pic2.jpg"
	// 									class="avatar avatar-md" alt="">
	// 								<div>
	// 									<h6>${res[i].stdNm}</h6>
	// 									<span>${res[i].deptNm}</span>
	// 								</div>
	// 							</div>
	// 							</td>
	// 							<td><span class="text-success"><i
	// 									class="fa-solid fa-check"></i></span></td>
									
	// 							<td><span class="text-danger"><i
	// 									class="fa-regular fa-xmark"></i></span></td>
							
								
	// 					</tr>`
						
	// 			}
	// 		}
	// 	})
	// }
})
</script>