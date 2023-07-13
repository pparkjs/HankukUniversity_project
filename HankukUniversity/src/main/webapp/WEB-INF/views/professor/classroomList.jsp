<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<style>
.heading {
	font-size: 1.5rem;
	color: var(- -secondary);
}

.active-projects tbody tr td:last-child {
	text-align: center;
}

.btn.btn-icon-xxs {
	padding: 0.8rem 1.0rem;
	border-radius: 30%;
	font-weight: 500;
	font-size: 15px;
	line-height: 20px;
}

.active-projects thead tr th:last-child {
	text-align: center;
}

.active-projects thead tr th {
	font-size: 17px;
	font-weight: bold;
}

.font-w500 {
	font-weight: 500;
	font-size: 15px;
}

.filter-option {
	font-size: 16px;
}
</style>

<div class="content-body">
	<!-- row -->
	<div class="container-fluid">
		<div class="table-responsive">
			<div class="col-xl-12">
				<h4 class="heading mb-0">
					<!-- 					<i class="fa-solid fa-user-plus text-primary me-3 mb-3"></i>  -->
					<strong>클래스룸 목록</strong>
				</h4>
				<br>
				<br>
				<div style="color: black;">
					<div class="yNsSel"
						style="font-size: 20px; margin-bottom: 20px; color: black;">
						학년도 :&nbsp;&nbsp; <select>
							<option style="font-size: 16px;">선택</option>
							<option style="font-size: 16px;">2023년</option>
							<option style="font-size: 16px;">2022년</option>
							<option style="font-size: 16px;">2021년</option>
						</select> &nbsp;&nbsp;/&nbsp;학기 : &nbsp;&nbsp; <select>
							<option style="font-size: 16px;">1학기</option>
							<option style="font-size: 16px;">2학기</option>
						</select>
					</div>
				</div>
				<div class="card h-auto">
					<div cla ss="card-body p-0">
						<div class="table-responsive active-projects">
							<div id="projects-tbl_wrapper"
								class="dataTables_wrapper no-footer">
								<table id="projects-tbl" class="table dataTable no-footer"
									role="grid" aria-describedby="projects-tbl_info">
									<thead>
										<tr role="row">
											<th style="width: 65px;">No</th>
											<th style="width: 132.887px;">과목명</th>
											<th style="width: 72.0625px;">클래스룸가기</th>
											<th style="width: 72.0625px;">성적 바로가기</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list }" var="list" varStatus="status">
											<tr role="row" class="">
												<td class="">
													<div class="">
														<div class="ms-2">
															<span>${status.index + 1}</span>
														</div>
													</div>
												</td>
												<td>
													<p class="mb-0 font-w500">${list.subNm }</p>
												</td>
												<td><svg class="enterClassroom" id="${list.lecapNo }" width="40" height="40"
														viewBox="0 0 20 20" fill="none"
														xmlns="http://www.w3.org/2000/svg">
															<path
															d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 
															17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 
															18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z"
															stroke="#888888" stroke-linecap="round"
															stroke-linejoin="round"></path>
															<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888"
															stroke-linecap="round" stroke-linejoin="round"></path>
													</svg></td>
												<td>
													<button type="button" class="btn btn-primary btn-icon-xxs">
														<i class="fas fa-pencil-alt"></i>
													</button>
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
	</div>
</div>
<script>
	var enterClassroom = document.querySelectorAll(".enterClassroom");
	
	for(let i=0; i<enterClassroom.length; i++){
		enterClassroom[i].addEventListener("click", function(){
			// 과목신청 번호
			let lecApNo = this.id;
	 		location.replace("/hku/professor/classroomMain/"+lecApNo+"");
		})		
	}


</script>