<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="/css/student/facility-rsvt.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">시설예약</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">사물함 예약</a></li>
		</ol>
    </div>
	<div class="container-fluid searchCon">
		<div class="card" id="card-title-1">
			<div class="card-body" style="color: black; font-size: 18px;	padding: 0.75rem;">
				<div class="myInfo">
					학과:&nbsp;&nbsp;&nbsp;
					<input type="text" class="deptText" value="${std.deptNm }" disabled>
					학번:&nbsp;&nbsp;&nbsp;
					<input type="text" class="noText" value="${std.stdNo }" disabled>
					이름:&nbsp;&nbsp;&nbsp;
					<input type="text" class="nameText" value="${std.stdNm }" disabled>
					년도:&nbsp;&nbsp;&nbsp;
					<input type="text" class="yearText" value="${std.currentYear }년" disabled>
					학기:&nbsp;&nbsp;&nbsp;
					<input type="text" class="semText" value="${std.currentSem }학기" disabled>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid subCon">
		<div class="card" id="card-title-1">
			<div class="locker-main">
				<div class="lockerLeft">
					<div class="card-header border-0 pb-0 ">
						<div class="tLeft">
							<div class="card-title" style="color: maroon;  font-weight: 900;">사물함 예약</div>
						</div>
					</div>
					<div class="card-body" style="padding-top: 0px; color: black; font-size: 18px;	padding: 0.75rem;">
						<div class="locker-wrap" style="margin-top: 10px;">
							<div class="lockerLeft-top">
								<span>건물:&nbsp;&nbsp;&nbsp;</span>
								<input type="text" class="flctSel" style="background: whitesmoke;" value="${std.flctNm }" data-flctno="${std.flctNo}" readonly="readonly">
								<span>층수:&nbsp;&nbsp;&nbsp;</span>
								<select class="floorSel">
									<c:forEach items="${flctList}" var="flct">
										<option value="${flct.flctNo}" id="${flct.floor}">${flct.floor}층</option>
									</c:forEach>
								</select>
								<button type="button" class="btn btn-primary" id="rsvtBtn">사용예약</button>
							</div>
							<div class="lockerLeft-title">
								<div class="useing"></div>
								<span>사용중</span>
								<div class="canUse"></div>
								<span>사용가능</span>
								<div class="locSel"></div>
								<span>선택</span>
							</div>
							<div class="lockerLeft-content">
								<!-- 동적추가 -->
							</div>
						</div>
					</div>
				</div>
				<div class="lockerRight">
					<div class="card-header border-0 pb-0 ">
						<div class="tLeft">
							<div class="card-title" style="color: maroon;  font-weight: 900;}">사물함 예약 수칙</div>
						</div>
					</div>
					<div class="card-body" style="padding-top: 0px; color: black; font-size: 18px;	padding: 0.75rem;">
						<div class="rule-wrap">
							<div class="rule-title">1. 신청 대상</div>
							<div class="rule-content"> - 학부 재학생</div>
							<div class="rule-title">2. 사용 기간</div>
							<div class="rule-content"> - 예약일로부터 ~ 방학전까지</div>
							<div class="rule-title">3. 신청방법</div>
							<div class="rule-content"> - 좌측에 사물함을 빌릴 건물과 층수에 대한 미사용 사물함 선택 후 예약신청</div>
							<div class="rule-title">4. 반납 방법</div>
							<div class="rule-content"> - 사물함 내 물품 회수 및 자물쇠 제거 후 학과사무실 반납</div>
							<div class="rule_warning">
								<div class="warning-title">※사물함 사용 수칙 ※</div>
								<div class="warning-content"> - 무단으로 사물함을 사용시 해당 학생에게 불이익이 갈 수 있음</div>
								<div class="warning-content"> - 배정된 사물함을 훼손하거나 파손한 경우 이를 변상하겠습니다.</div>
								<div class="warning-content"> - 사물함 내용물의 분실, 훼손에 대해서는 본인이 책임을 지겠습니다.</div>
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
	lockerList();
})
var rsvtBtn = document.querySelector("#rsvtBtn");
var floorSel = document.querySelector(".floorSel");
var lockerNum;

floorSel.addEventListener("change", floorChange);
rsvtBtn.addEventListener("click", rsvtBtnClick);

// 층변경시 실행
function floorChange(){
	lockerNum = null; // 층 변경시 선택한 lockerNum 초기화
	lockerList();
}

// 사용예약 버튼 클릭시 실행
function rsvtBtnClick(){
	if(!lockerNum){
		swal({
				title: "사용할 사물함을 선택해주세요.",
				icon: "error",
				button: "닫기",
			});
		return;
	}else{
		swal("사물함 예약신청을 진행하시겠습니까?", {
			buttons: {
				cancel: "닫기",
				ok: {
				text: "확인",
				value: "confirm",
				}
			},
		})
		.then((value) => {
			if(value == "confirm"){ 
				lockerReservation()
			}
		});
	}
}

// 사물함 예약하기 함수
function lockerReservation(){
	var selectedOption = floorSel.options[floorSel.selectedIndex]; //선택된 option 가져옴
	var floor = selectedOption.id;
	var fcltNo = selectedOption.value;
	
	var lockerObj = {
		"floor" : floor,
		"flctNo": fcltNo,
		"lockerNo": lockerNum,
		"lockerYr":"${std.currentYear}",
		"rsvtSem":"${std.currentSem}"
	}
	
	console.log("사물함 예약 데이터 : ", lockerObj);
	
	var xhr = new XMLHttpRequest();
	xhr.open("post", "/hku/locker-reservation", true)
	xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
	xhr.setRequestHeader("X-CSRF-TOKEN", "${_csrf.token}");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let	res = xhr.responseText;

			if(res == "exist"){
				swal({
					title: "이미 예약한 사물함이 존재합니다.",
					icon: "error",
					button: "닫기",
				});
			}else if(res == "success"){
				location.href = "/hku/my-reservation";
			}else if (res == "failed"){
				swal({
					title: "예약에 실패하였습니다. 다시 시도하세요.",
					icon: "error",
					button: "닫기",
				});
			}
		}
	}
	xhr.send(JSON.stringify(lockerObj));
}

// 예약가능 사물함 클릭시 배경색 바꿈과 동시에 사물함 번호 등록
function divList(){
	var divElements = document.querySelectorAll(".lockerUse");
	divElements.forEach(function(div) {
		div.addEventListener('click', function() {
		    console.log("디스 : ", this.innerText); 
		    lockerNum = this.innerText;

		    // divElements 에 모든 배경색 없음으로 초기화 
			divElements.forEach(function(all){
				all.style.background = "";
			})
	
			this.style.background = "pink";
		});
	});
}

// 사물함 가져오기
function lockerList(){
	var selectedOption = floorSel.options[floorSel.selectedIndex]; //선택된 option 가져옴
	var floor = selectedOption.id;
	var fcltNo = selectedOption.value;
	var lockerContent = document.querySelector(".lockerLeft-content");
	console.log("floor", floor);
	var xhr = new XMLHttpRequest();
	xhr.open("get", `/hku/locker-list?fcltNo=\${fcltNo}&floor=\${floor}`, true);
	xhr.setRequestHeader("X-CSRF-TOKEN", "${_csrf.token}");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let res = JSON.parse(xhr.responseText);
			let html = '';
			console.log(res);
			for(var i = 0; i < res.length; i++){
				var div = document.createElement("div"); // $(div) // 
				// $(div).html("1");
				if(res[i].lockerNo === 2 || res[i].lockerNo === 7 || res[i].lockerNo === 11 || res[i].lockerNo === 16 || 
				res[i].lockerNo === 20 || res[i].lockerNo === 25 || res[i].lockerNo === 29 || res[i].lockerNo === 34 ||
			    res[i].lockerNo === 38 || res[i].lockerNo === 43){
					div.style.marginRight = "33px";
				}

				if(res[i].avlCd == 'Y'){
					div.style.background = "#404040";
					div.className = "none";
				}else{
					div.className = "lockerUse";
				}
				div.innerText = `\${res[i].lockerNo}`;
				html += div.outerHTML; // div 엘리먼트를 문자열로 변환!

				lockerContent.innerHTML = html;
			}
			
			divList(); // 사물함 div 만들어지면 div리스트 함수 호출
		}	
	}
	xhr.send();
}


</script>