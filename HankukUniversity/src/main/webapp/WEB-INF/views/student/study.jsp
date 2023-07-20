<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta charset="UTF-8">
<style>
@media only screen and (min-width: 1199px) and (max-width: 1920px) {
	.customeoff {
		width: 600px !important;
	}
}

.form-control {
	width: 450px;
}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">스터디룸</a></li>
		</ol>
	</div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-body">
				<div class="title-wrap" style="display:flex; justify-content: space-between; margin-bottom: -18px;">
					<ul class="nav nav-pills mb-4 light">
						<li class=" nav-item">
							<a href="#navpills-1" class="nav-link active" data-bs-toggle="tab" aria-expanded="true">가입중인스터디</a>
						</li>
						<li class="nav-item">
							<a href="#navpills-2" class="nav-link" data-bs-toggle="tab" aria-expanded="false">승인 대기목록</a>
						</li>
					</ul>
					<div style="display: flex; justify-content: end; margin-right: 80px;">
						<a class="btn btn-primary" data-bs-toggle="offcanvas"
							href="#offcanvasExample" role="button"
							aria-controls="offcanvasExample" style="padding: 9px 20px; height: 37px;">스터디 개설</a>
					</div>
				</div>
				<hr>
				<div class="tab-content">
					<div id="navpills-1" class="tab-pane active" style="margin-top: -37px;">

						<br>
						<br>
						<div class="row">
						<c:choose>
							<c:when test="${empty studyList }">
								<p>현재 가입되어있는 스터디가 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${studyList }" var="study">
								<div class="col-xl-3 col-lg-4 col-sm-6">
									<div class="card" style="background-color: #adb17d1c;">
										<div class="card-body">
											<div class="card-use-box">
												<div class="card__text">
													<h4 class="mb-0">${study.studyName }</h4>
													<p>${study.studyIntro }</p>
												</div>
												<ul class="card__info">
													<li><span>인원수</span> <span class="card__info__stats">${study.count} / ${study.studyCpcy }</span>
													</li>
												</ul>
												<ul class="post-pos">
													<li><span class="card__info__stats">스터디장: </span> <span>${study.stdNm }</span>
													</li>
														<span>${study.studyRegdate }</span>
													</li>
												</ul>
												
												<div>
													<a href="/hku/student/studyRoom?studyNo=${study.studyNo }"
														class="btn btn-outline-primary btn-xs">Enter</a>
													<!-- <a href="javascript:void(0)" class="btn btn-secondary btn-sm ms-2">Following</a> -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</div>
					</div>
				
				<!-- 승인대기중인 스터디 목록 -->
				<div class="tab-content">
					<div id="navpills-2" class="tab-pane">
						<div class="row">
							<div class="col-md-12">
							<c:choose>
								<c:when test="${empty studyList }">
									<p>가입승인 대기중인 스터디가 없습니다.</p>
								</c:when>
								<c:otherwise>
									<c:forEach items="${waitStudy }" var="waitStudy">
									<div class="col-xl-3 col-lg-4 col-sm-6">
										<div class="card" style="background-color: #adb17d1c;">
											<div class="card-body">
												<div class="card-use-box">
													<div class="card__text">
														<h4 class="mb-0">${waitStudy.studyName }</h4>
														<p>${waitStudy.studyIntro }</p>
													</div>
													<ul class="card__info">
														<li><span>인원수</span> <span class="card__info__stats">1 / ${waitStudy.studyCpcy }</span>
														</li>
													</ul>
													<ul class="post-pos">
														<li><span class="card__info__stats">스터디장: </span> <span>${waitStudy.stdNm }</span>
														</li>
														<span>${waitStudy.studyRegdate }</span>
														</li>
													</ul>
													
													<div>
														<a href="/hku/student/studyRoom?studyNo=${waitStudy.studyNo }"
															class="btn btn-outline-primary btn-xs">취소</a>
														<!-- <a href="javascript:void(0)" class="btn btn-secondary btn-sm ms-2">Following</a> -->
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
					</div>
				<!-- end tab -->
				</div>
				</div>

				<div class="offcanvas offcanvas-end customeoff" tabindex="-1"
					id="offcanvasExample">
					<div class="offcanvas-header">
						<h5 class="modal-title" id="#gridSystemModal">스터디 개설</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close">
							<i class="fa-solid fa-xmark"></i>
						</button>
					</div>
					<div class="offcanvas-body">
						<div class="container-fluid">
							<form action="#" method="post" >
								<div>
									<div class="col-xl-6 mb-3">
										<label for="exampleFormControlInput1" class="form-label">
										스터디 이름 <span class="text-danger">*</span>
										</label> <input type="text" class="form-control" name="studyName"
											id="exampleFormControlInput1" placeholder="">
									</div>
									<div class="col-xl-6 mb-3">
										<label for="exampleFormControlInput2" class="form-label">
											인원수 <span class="text-danger">*</span>
										</label> 
										<input type="text" class="form-control" id="exampleFormControlInput2" name="studyCpcy" placeholder="">
									</div>
									<div class="col-xl-6 mb-3">
										<label for="exampleFormControlInput2" class="form-label">
										스터디 소개글<span class="text-danger">*</span>
										</label>
										<input type="text" class="form-control" name="studyIntro" id="" placeholder="">
									</div>
									<div>
										<button class="btn btn-primary me-1" onclick="addStudy()">개설</button>
										<button class="btn btn-danger light ms-1">취소</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<script>
	function addStudy(){
		const myForm = document.forms[0];
			let data = {
				studyName: myForm.studyName.value,
				studyCpcy: myForm.studyCpcy.value,
				studyIntro: myForm.studyIntro.value
			}
			let xhr = new XMLHttpRequest();
			xhr.open("POST","/hku/student/study", true);
			xhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
			xhr.onreadystatechange = function(){
					location.reload(true);
			}
			xhr.send(JSON.stringify(data));
		}
</script>

