<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<div class="content-body" style="min-height: 975px;">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">출석 이의신청</a></li>
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
							출석 이의신청 현황</h4>
					</div>
					<div class="card-body">
						<div class="basic-form">
							<div class="row">
								
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
		</div>
	</div>
</div>