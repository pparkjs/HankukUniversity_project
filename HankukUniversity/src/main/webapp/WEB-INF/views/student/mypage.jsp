<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

.title{
    line-height: 1.5;
    font-weight: bold;
    font-size: 20px;
}
.author-profile .upload-link {
    position: initial;
    width: 60px;
    height: 60px;
    line-height: 32px;
    background: var(--primary);
    bottom: 0;
    right: 0px;
    box-shadow: 0 0 10px 0 rgba(0, 24, 128, 0.1);
    border-radius: 100%;
    color: #fff;
    overflow: hidden;
    border: 2px solid #fff;
}

.profile-form .form-label {
    color: #6e6e6e;
    font-size: 18px;
    margin-bottom: 12px;
    font-weight: 500;
}

.form-control:disabled, .form-control[readonly] {
    background: #f4f4f4;
    opacity: 1;
}
</style>

<div class="content-body">
	<!-- row -->
	<div class="container-fluid">
		<!-- row -->
		<div class="row">
			<div class="col-xl-3 col-lg-4">
				<div class="clearfix">
					<div class="card card-bx profile-card author-profile m-b30">
						<div class="card-body">
							<div class="p-5">
								<div class="author-profile">
									<div class="author-media">
										<img src="images/tab/1.jpg" class="img" alt="">
										<div class="upload-link" title="" data-toggle="tooltip"
											data-placement="right" data-original-title="update">
											<input type="file" class="update-flie"> 
											<i class="fa fa-camera"></i>
										</div>
									</div>
									<div class="author-info">
										<h6 class="title">${std.stdNm}</h6>
										<span>학과</span>
									</div>
								</div> 
							</div>
						</div>
						<div class="card-footer">
							<div class="input-group mb-3">
								<div class="form-control rounded text-center bg-white">Portfolio</div>
							</div>
							<div class="input-group">
								<a href="https://www.github.com/"
									class="form-control text-primary rounded text-start bg-white">https://www.github.com/</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8">
				<div class="card profile-card card-bx m-b30">
					<div class="card-header">
						<h6 class="title" style="font-size:17px bold;">마이페이지</h6>
					</div>
					<form class="profile-form">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-6 m-b30">
									<label class="form-label">이름</label> 
									<input type="text" disabled name="stdNm" class="form-control" value="${std.stdNm} ">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">학번</label> 
									<input type="text" disabled name="stdNo" class="form-control" readonly value="${std.stdNo }">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">학과</label> 
									<input type="text" disabled  name="std" class="form-control" readonly value="컴퓨터공학">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">비밀번호</label>
									<button type="button" onclick="pwBtnF()" style="padding: 0.3rem 0.8rem;" class="btn btn-primary">비밀번호 변경</button>
									<input type="password" id="pw" name="stdPw" class="form-control" value="">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">성별</label>
								</div>
								<div class="col-sm-6 m-b30">
<!-- 								하하호호~~ -->
									<label class="form-label">생년월일</label> 
									<input type="text" disabled name="stdBrdt" class="form-control" value="${std.stdBrdt }">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">연락처</label> 
									<input type="text" name="stdTelno" class="form-control" value="${std.stdTelno }">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">이메일</label> 
									<input type="text" name="stdMail" class="form-control" value="${std.stdMail }">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">우편번호</label>
									<button type="button" style="padding: 0.3rem 0.8rem;" onclick="DaumPostcode()" class="btn btn-primary" id="zipBtn">우편번호 찾기</button>
									 <input type="text" id="stdZip" name="stdZip" class="form-control" value="${std.stdZip }">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">기본주소</label> 
									 <input type="text" id="stdAddr" name="stdAddr" class="form-control" value="${std.stdAddr }">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">상세주소</label> 
									 <input type="text" id="stdDaddr" name="stdDaddr" class="form-control" value="${std.stdDaddr }">
								</div>
							</div>
						</div>
						<div class="card-footer" style="padding-left:800px;">
							<button class="btn btn-primary" id="updateBtn" onclick="updateF()">수정하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

// $(function() {
// 	var pwBtn = $("#pwBtn");
// 	var zipBtn = $("#zipBtn");
// 	var updateBtn = $("#updateBtn");

	function pwBtnF(){
		
	}
	
	function chkPW(){
	
	 var pw = $("#pw").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	 if(pw.length < 10 || pw.length > 20){
	  alert("10자리 ~ 20자리 이내로 입력해주세요.");
	  return false;
	 }else if(pw.search(/\s/) != -1){
	  alert("비밀번호는 공백 없이 입력해주세요.");
	  return false;
	 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
	  alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
	  return false;
	 }else {
		console.log("오케!");	 
	 }
}

	
	// 주소 찾기
	function DaumPostcode() {
		new daum.Postcode(
		{
			oncomplete : function(data) {

				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				if (data.userSelectedType === 'R') { //  도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝남
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName
								: data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
				}
				// 우편번호와 주소 정보 해당 필드에 넣기
				document.getElementById('stdZip').value = data.zonecode;
				document.getElementById("stdAddr").value = addr;
				document.getElementById("stdDaddr").focus();
			}
		}).open();
	}
	
	function updateF(){
		swal("Good job!", "수정이 완료되었습니다", "success");	
	}
// })
</script>
