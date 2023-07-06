<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.form {
	border: 1px solid black;
	padding-right: 3%;
	padding-left: 3%;
	height: 400px;
	margin-left: 3%;
	margin-right: 3%;
	margin-bottom: 2%;
	position: relative;
}

.p2 {
	background-color: rgb(107, 18, 18);
	color: white;
	font-size: 20px;
	margin-bottom: 0px;
	margin-left: 3%;
	margin-right: 3%;
	height: 35px;
}

.ip {
	border: 2px solid rgb(107, 18, 18);
	width: 300px;
	height: 25px;;
	margin: 5px;
}

#info {
	margin: auto;
	height: 80%;
	float: right;
	margin-top: 30px;
	width: 65%;
}

.modifyBtn {
	position: absolute;
	right: 10%;
	bottom: 10%;
}

.profile-container {
	border: 1px solid rgb(107, 18, 18);
	height: 60%;
	border-radius: 12%;
	position: absolute;
	top: 30px;
	left: 30px;
	float: left;
	width: 20%;
}

#tabs {
	position: relative;
	width: 100%;
	height: 80%;
	border: 1px solid black;
}

.tab {
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgb(204, 203, 203);
	color: rgb(107, 18, 18);
}

.tabBtn {
	margin-top: 10px;
}

.pt {
	border: 1px solid rgb(107, 18, 18);
	margin-left: 5%;
	margin-right: 5%;
}
</style>
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
				<p class="p2">&nbsp;&nbsp; 학생정보</p>
				<div class="form">
					<div class="profile-container">
						<img src="" alt=""> 프로필사진
					</div>
					<form action="" id="info">
						이름: <input type="text" name="" id="name" class="ip"><br>
						주소: <input type="text" id="addr" class="ip"> <input
							type="button" name="" id="" value="주소검색"><br> 학번: <input
							type="text" id="id" class="ip"><br> 주민등록번호: <input
							type="text" id="" class="ip"> <br> 성별: <input
							type="text" id="" class="ip"><br> 계좌번호: <input
							type="text" id="" class="ip"> <br> 이메일: <input
							type="text" id="" class="ip"> <br> <br>
						<button class="modifyBtn">수정하기</button>
					</form>
				</div>

				<p class="p2">&nbsp;&nbsp; 학적</p>
				<div class="form">
					<button onclick="ftab(0)" class="tabBtn">학적상황</button>
					<button onclick="ftab(1)" class="tabBtn">변동내역</button>
					<div id="tabs">
						<div class="tab" style="z-index: 100;">
							<p class="pt">학년:</p>
							<p class="pt">학과:</p>
							<p class="pt">입학년도:</p>
							<p class="pt">학적상태:</p>
						</div>
						<div class="tab">
							학적 변동내역
							<table>

							</table>
						</div>
					</div>
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
