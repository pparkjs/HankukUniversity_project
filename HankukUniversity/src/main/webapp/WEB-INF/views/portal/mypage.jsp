<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
label{
	width: 100px;
	text-align: left;
	font-size: 17px;
}
input[type=text]{
	width :300px;
	margin:0px;
}
input[type=password]{
	width :300px;
	margin:0px;
}
input[type=radio]{
	min-width : 0px;
	width: 20px;
	height: 20px;
	margin-left:10px;
	margin-right: 30px; 
}

.profile-card .m-b30{
	margin-bottom: 10px;
}
.author-profile .author-media img {
	width: 210px;
    height: 210px;
    border: 3px solid #800000;
    border-radius: 50%;
}
.p-5 {
    padding: 0rem !important;
}

.profile-card .card-header .title:after {
	bottom: -20px;
}

#checkPwContainer{
	height: 92%;
    display: flex;
    align-items: center;
}

</style>

<c:if test="${not empty checkPass}">
	<script type="text/javascript">
		$(function(){
			$('#checkPwContainer').css('display', 'none');
			$('#myPageInfo').css('display', 'block');
		});
	</script>
</c:if>
<div class="container-fluid" id="checkPwContainer" style="height: 92%; display: flex; align-items: center;">
		<div class="card" style="width: 100%; height: 350px; margin-top:20px;">
			<div class="card-body" style="display: flex; align-items: center; justify-content: center;">
				<div class="pt-4" style="padding-left: 235px;">
				<form class="mb-3 row" method="post" action=""  id="checkPwFrm">
                	<label class="col-sm-2 col-form-label">비밀번호 입력</label>
	                <div class="col-sm-10">
	                    <input type="password" name="userPw" class="form-control" id="userPw">
	                </div>
	                <br>
					<button type="button" class="btn btn-primary" style="background:#800000; width:300px; border:none; margin-top:20px; margin-left:70px; " id='checkPwBtn'>확인</button>
					<sec:csrfInput/>
                </form>
			</div>
			</div>
		</div>
</div>
<!-- row -->
<div class="container-fluid" style="display: none;" id="myPageInfo">
	<!-- row -->
	<div class="row">
			<div class="card profile-card card-bx m-b30" style="width:100%; height:860px; margin-top:20px;">
			<div class="card-header" style="padding: 17px; bottom: -5px;">
						<h6 class="title" style="font-size:20px;">마이페이지</h6>
			</div>
					<div class="card-body" style="margin-left:50px;">
						<div class="row">
							<div class="p-5">
								<div class="author-profile">
									<div class="author-media">
										<c:choose>
											<c:when test="${empty std.stdProfilePath and std.stdProfilePath eq ''}">
												<img id="myPageProfileImg" src="/images/user(2).png" alt="">
											</c:when>
											<c:otherwise>
												<img id="myPageProfileImg" src="/download${std.stdProfilePath }" alt="">
											</c:otherwise>
										</c:choose>
										<div class="upload-link" title="" data-toggle="tooltip" data-placement="right" style="right: 20px;" data-original-title="update">
											<input type="file" class="update-flie" id="profile" name="profile">
											<i class="fa fa-camera"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 m-b30">
								<label class="form-label">이름</label> 
								<input type="text" class="form-control" value="${std.stdNm }" disabled="disabled">
							</div>
							<div class="col-sm-6 m-b30">
								<label class="form-label">학번</label> 
								<input type="text" class="form-control" value="${std.stdNo }" disabled="disabled">
							</div>
							<div class="col-sm-6 m-b30">
								<label class="form-label">학과</label> 
								<input type="text" class="form-control" value="컴퓨터공학" readonly="readonly">
							</div>
							<div class="col-sm-6 m-b30">
								<label class="form-label">성별</label>
							<c:if test="${std.stdSexCd eq 'M'}">
								<input type="text" class="form-control" value="남자" disabled="disabled">
							</c:if>
							<c:if test="${std.stdSexCd eq 'F'}">
								<input type="text" class="form-control" value="여자" disabled="disabled">
							</c:if>
							</div>
							<div class="col-sm-6 m-b30">
								<label class="form-label">생년월일</label> 
								<input type="text" class="form-control" id="stdBrdt" value="${std.stdBrdt }">
							</div>
							<div class="col-sm-6 m-b30">
								<label class="form-label">연락처</label> 
								<input type="text" class="form-control" id="stdTelno" value="${std.stdTelno }">
							</div>
							<div class="col-sm-6 m-b30">
								<label class="form-label">이메일</label> 
								<input type="text" class="form-control" id="stdMail" value="${std.stdMail }">
							</div>
							<div class="col-sm-6 m-b30">
								<label class="form-label">우편번호</label>
								<input type="button" class="btn btn-primary" onclick="DaumPostcode()" value="주소검색">						
								<input type="text" class="form-control" id="stdZip" value="${std.stdZip }">
							</div>
							<div class="col-sm-6 m-b30">
								<label class="form-label">기본주소</label> 
								 <input type="text" class="form-control" id="stdAddr" value="${std.stdAddr }">
							</div>
							<div class="col-sm-6 m-b30">
								<label class="form-label">상세주소</label> 
								 <input type="text" class="form-control" id="stdDaddr" value="${std.stdDaddr }">
							</div>
						</div>
					</div>
					<div class="card-footer" style="justify-content: flex-end;">
						<button class="btn btn-primary" id="pwChgBtn" style="margin-right:10px;">비밀번호변경</button>
						<button class="btn btn-primary" id="modifyBtn">수정하기</button>
					</div>
			</div>
	</div>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	
	var modifyBtn = $("#modifyBtn");
	modifyBtn.on("click", function(){
		  swal({
              title: "개인정보를 수정하시겠습니까?",
              icon: "warning",
              buttons: true,
              dangerMode: true,
          })
              .then((willDelete) => {
                  if (willDelete) {
                        
			var stdTelno = $("#stdTelno").val();
			var stdMail = $("#stdMail").val();
			var stdZip = $("#stdZip").val();
			var stdAddr = $("#stdAddr").val();
			var stdDaddr = $("#stdDaddr").val();
			var profile = $("#profile")[0].files[0];
			
			console.log("내 파일", profile);
			// var infoData = {
			// 	stdTelno : stdTelno,
			// 	stdMail : stdMail,
			// 	stdZip : stdZip,
			// 	stdAddr : stdAddr,
			// 	stdDaddr : stdDaddr,
			// }

			var formData = new FormData();
			formData.append("stdTelno", stdTelno);
			formData.append("stdMail", stdMail);
			formData.append("stdZip", stdZip);
			formData.append("stdAddr", stdAddr);
			formData.append("stdDaddr", stdDaddr);
			formData.append("stdMultipartFile", profile);
			
			// console.log(infoData);
			
			$.ajax({
				url : "/hku/mypage/modifyInfo",
				type : "post",
				data : formData,
				contentType : false,
				processData : false,
				cache: false,
				beforeSend : function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(res){    
					console.log(res)
					swal("", "수정이 완료되었습니다", "success");
					location.reload();
					
				},
				error : function(xhr){
					alert("실패!!!!!!!!");
				}
			})
		
           }
        });
		  
	})
	
	var pwChgBtn = $("#pwChgBtn");
	pwChgBtn.on("click", function(){
		window.open("/hku/mypage/changePw","_blank","width=400,height=450,left=600,top=350");
		
	})
	
	var checkPwBtn = $('#checkPwBtn');
	
	checkPwBtn.on('click', function(){
		let userPw = $('#userPw').val();
		
		if(userPw == "" || userPw == null){
			swal("", "비밀번호를 입력해주세요", "info");
			return;
		}
		
		$('#checkPwFrm').submit();
	});
	
	
	$('#profile').on("change", function(event){
		console.log($("#profile").val());
		file = event.target.files[0];
		console.log("file", file);
		if(isImageFile(file)){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#myPageProfileImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(file);
		}else{	// 이미지 파일을 선택하지 않음
			alert("이미지 파일을 선택해주세요!");
			$(this).val(null);
		}
	});
	
	function isImageFile(file){
		var ext = file.name.split(".").pop().toLowerCase();		// 파일명에서 확장자를 가져온다.
		return ($.inArray(ext, ["jpg","jpeg","gif","png"]) === -1) ? false : true;
	}
});



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

</script>