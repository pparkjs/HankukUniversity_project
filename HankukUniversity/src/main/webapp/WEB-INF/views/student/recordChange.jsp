<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<link rel="stylesheet" href="/css/recordChange.css">
	<div class="content-body">
		<div class="page-titles">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">메인대쉬보드</a></li>
			</ol>
		</div>
		<div class="container-fluid">
			<div class="card" id="card-title-1">
				<div class="card-header border-0 pb-0 ">
				</div>
				<div class="card-body">
					<p class="card-text"></p>
					<p class="p2">&nbsp;&nbsp; 신청내역</p>
					<div class="form">
						<table border="1">
							<thead>
								<tr>
									<td>1</td>
									<td>날짜</td>
									<td>신청내역</td>
									<td>변동사유</td>
									<td>승인상태</td>
									<td>신청취소</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2</td>
									<td>2023.07.01</td>
									<td>휴학</td>
									<td>휴학할게요</td>
									<td>대기중</td>
									<td><button>취소</button></td>
								</tr>
							</tbody>
						</table>
					</div>

					<p class="p2">&nbsp;&nbsp; 신청</p>
					<div class="form2">
						<form action="" class="form3">
							<div class="input-group">
								이름: &nbsp; <input type="text" style="height: 26px;">
								&nbsp; &nbsp; 학과: &nbsp; <input type="text" style="height: 26px;"> &nbsp; &nbsp; 학번:
								&nbsp;<input type="text" style="height: 26px;"> &nbsp; &nbsp; &nbsp;
								&nbsp;<select name="" id="">
									<option value="휴학">휴학</option>
									<option value="복학">복학</option>
								</select>
							</div>
							<textarea name="" id="" cols="120" rows="12"></textarea>
							<br> <br>
							<button id="btn">신청</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		const myTabs = document.querySelectorAll(".tab");
		const btn = document.querySelectorAll(".tabBtn");
		function finitTab() {
			for (let i = 0; i < myTabs.length; i++) {
				myTabs[i].style.zIndex = 1;
				//myTabs[i].style.boarderBottom = "1px solid blick";
				btn[i].style.borderBottom = "1px solid black";
			}
		}
		function ftab(num) {
			finitTab(); //z-index 초기화
			myTabs[num].style.zIndex = 999;
			//event.target.style.boarderBottom = "10px solid blick";
			btn[num].style.borderBottom = "10px solid rgba(98, 128, 0, 0.821)";
		}
	</script>