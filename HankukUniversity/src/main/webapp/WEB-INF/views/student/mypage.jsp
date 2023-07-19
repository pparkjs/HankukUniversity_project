<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
										<img src="images/tab/1.jpg" alt="">
										<div class="upload-link" title="" data-toggle="tooltip"
											data-placement="right" data-original-title="update">
											<input type="file" class="update-flie"> <i
												class="fa fa-camera"></i>
										</div>
									</div>
									<div class="author-info">
										<h6 class="title">${std.stdNm} </h6>
										<span>컴퓨터공학</span>
									</div>
								</div> 
							</div>
<!-- 							<div class="info-list"> -->
<!-- 								<ul> -->
<!-- 									<li><a href="app-profile.html">Models</a><span>36</span></li> -->
<!-- 									<li><a href="uc-lightgallery.html">Gallery</a><span>3</span></li> -->
<!-- 									<li><a href="app-profile.html">Lessons</a><span>1</span></li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
						</div>
						<div class="card-footer">
							<div class="input-group mb-3">
								<div class="form-control rounded text-center bg-white">Portfolio</div>
							</div>
							<div class="input-group">
								<a href="https://www.dexignzone.com/"
									class="form-control text-primary rounded text-start bg-white">https://www.dexignzone.com/</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8">
				<div class="card profile-card card-bx m-b30">
					<div class="card-header">
						<h6 class="title">내 정보</h6>
					</div>
					<form class="profile-form">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-6 m-b30">
									<label class="form-label">이름</label> 
									<input type="text" name="stdNm" class="form-control" readonly value="${std.stdNo} ">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">학번</label> 
									<input type="text" name="stdNo" class="form-control" readonly value="${std.stdNo }">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">학과</label> 
									<input type="text"  name="std" class="form-control" readonly value="컴퓨터공학">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">비밀번호</label>
							<!-- 	<button class="btn btn-primary pwBtn" id="pwBtn">비밀번호변경</button> -->
									<input type="password" name="stdPw" class="form-control" value="">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label" >성별</label>
									<input type="text" name="stdSexCd" class="form-control" value="">
								</div>
								<div class="col-sm-6 m-b30">
									<label class="form-label">생년월일</label> 
									<input type="text" name="stdBrdt" class="form-control" value="${std.stdBrdt }">
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
									<button type="button" onclick="DaumPostcode()" class="btn btn-primary" id="zipBtn">우편번호 찾기</button>
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
						<div class="card-footer">
							<button class="btn btn-primary">수정하기</button>
<!-- 							<a href="page-register.html" class="btn-link">Forgot your -->
<!-- 								password?</a> -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

// $(function() {
// 	var pwBtn = $("#pwBtn");
// 	var zipBtn = $("#zipBtn");
	
	
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
// })
</script>
