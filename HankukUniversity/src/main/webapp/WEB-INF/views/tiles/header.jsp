<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/resources/js/voice.js"></script>
<style>
.notification_dropdown {
position: relative;
}

.notification-shadow {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 0;
	height: 0;
	border-radius: 50%;
/* 	background-color: rgba(255, 255, 255, 0.5); */
	background-color: #ffdede;
	transform: translate(-50%, -50%);
	pointer-events: none;
	z-index: -1;
	animation: shadow-pulse 3s infinite;
	box-shadow: 0 0 10px 5px rgba(0, 0, 0, 0.2);
}

@keyframes shadow-pulse {
	0% {
		width: 10px;
		height: 10px;
		opacity: 1;
	 }
	100% {
	width: 200px;
	height: 200px;
	opacity: 0;
	  }
}
 
.notification-show .dropdown-menu {
  display: block;
}
.tCon{
	display: flex;
    align-items: center;
    justify-content: center;
    padding: 15px;
    margin-right: 15px;
    height: 40px;
    margin-top: 6px;
}

.d-block{ 
 	font-size: 16px; 
} 
.alarm-count{
  width: 20px;
  height: 20px;
  background-color: #e33333;
  color: white;
  border-radius: 50%;
  text-align: center;
  line-height: 20px;
  position: absolute;
  top: 7px;
  right: 7px;
  font-size: 13px;
}

.recording {
  color: red;
  animation: pulse 1s infinite;
}

@keyframes pulse {
  0% {
    transform: scale(1);
  }
  50% {
     transform: scale(1.3); 
     color:#800000;
  }
  100% {
    transform: scale(1);
  }
}
#unMsgCnt{
    width: 20px;
    height: 20px;
    background-color: #e33333;
    color: white;
    border-radius: 50%;
    text-align: center;
    line-height: 20px;
    position: absolute;
    top: 7px;
    right: 3px;
    font-size: 13px;
}
</style>
<div class="header">
	<div class="header-content">
		<nav class="navbar navbar-expand">
			<div class="collapse navbar-collapse justify-content-between">
				<div class="header-left">

					<!--  검색에 대한 div -->
<!-- 					<div class="input-group search-area"> -->
<!-- 						<span class="input-group-text"> <a -->
<!-- 							href="javascript:void(0)"> <svg width="19" height="19" -->
<!-- 									viewBox="0 0 19 19" fill="none" -->
<!-- 									xmlns="http://www.w3.org/2000/svg"> -->
<%-- 									<circle cx="8.78605" cy="8.78605" r="8.23951" stroke="white" --%>
<%-- 										stroke-linecap="round" stroke-linejoin="round" /> --%>
<!-- 									<path d="M14.5168 14.9447L17.7471 18.1667" stroke="white" -->
<!-- 										stroke-linecap="round" stroke-linejoin="round" /> -->
<!-- 								</svg> -->
<!-- 						</a> -->
<!-- 						</span> <input type="text" class="form-control" placeholder="Search"> -->
<!-- 					</div> -->

				</div>
				<ul class="navbar-nav header-right">
					<li class="nav-item dropdown notification_dropdown">
						<div class="dropdown-menu dropdown-menu-end">
							<div id="DZ_W_TimeLine02"
								class="widget-timeline dz-scroll style-1 p-3 height370">
								<ul class="timeline">
									<li>
										<div class="timeline-badge primary"></div> <a
										class="timeline-panel text-muted" href="javascript:void(0);">
											<span>10 minutes ago</span>
											<h6 class="mb-0">
												Youtube, a video-sharing website, goes live <strong
													class="text-primary">$500</strong>.
											</h6>
									</a>
									</li>
									<li>
										<div class="timeline-badge info"></div> <a
										class="timeline-panel text-muted" href="javascript:void(0);">
											<span>20 minutes ago</span>
											<h6 class="mb-0">
												New order placed <strong class="text-info">#XF-2356.</strong>
											</h6>
											<p class="mb-0">Quisque a consequat ante Sit amet magna
												at volutapt...</p>
									</a>
									</li>
									<li>
										<div class="timeline-badge danger"></div> <a
										class="timeline-panel text-muted" href="javascript:void(0);">
											<span>30 minutes ago</span>
											<h6 class="mb-0">
												john just buy your product <strong class="text-warning">Sell
													$250</strong>
											</h6>
									</a>
									</li>
									<li>
										<div class="timeline-badge success"></div> <a
										class="timeline-panel text-muted" href="javascript:void(0);">
											<span>15 minutes ago</span>
											<h6 class="mb-0">StumbleUpon is acquired by eBay.</h6>
									</a>
									</li>
									<li>
										<div class="timeline-badge warning"></div> <a
										class="timeline-panel text-muted" href="javascript:void(0);">
											<span>20 minutes ago</span>
											<h6 class="mb-0">Mashable, a news website and blog, goes
												live.</h6>
									</a>
									</li>
									<li>
										<div class="timeline-badge dark"></div> <a
										class="timeline-panel text-muted" href="javascript:void(0);">
											<span>20 minutes ago</span>
											<h6 class="mb-0">Mashable, a news website and blog, goes
												live.</h6>
									</a>
									</li>
								</ul>
							</div>
						</div>
					</li>

			<!-- 알람  + 로그인 타이머 -->
					<div class="tCon">
						<span id="timer" style=" margin-right:4px; font-size:1.3em; color:white; font-weight: 500; width: 97px;"></span>
						<i id="refresh" class="fa-solid fa-rotate-right fa-lg" style="color: #ffffff; font-size: 1.5em; cursor:pointer;"></i>
					</div>
					
					<li class="nav-item dropdown notification_dropdown" id="notification-icon">
						<a class="nav-link" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" style="position:relative;"> 
							<div class="alarm-count">2</div>
							<img alt="" src="/images/알람3.svg" width="30" height="27">
						</a>
						<div class="dropdown-menu dropdown-menu-end">
							<div id="DZ_W_Notification1" class="widget-media dz-scroll p-3"
								style="height: 380px;">
								<ul class="timeline" id="alarmLine">
									<!--알람 동적 추가-->
								</ul>
							</div>
						</div>
						 <!-- 알림 아이콘 주변에 잔상을 표시하는 요소 -->
  						<div class="notification-shadow"></div>
					</li>
					
					
					<!-- message -->
					<c:if test="${not empty std }">
						<li class="nav-item dropdown notification_dropdown"><a
							class="nav-link bell-link" href="javascript:void(0);" style="margin-top: 1px;"> 
								<div id="unMsgCnt" class="unMsgCnt"></div>
								<img alt="" src="/images/메시지3.svg" width="30" height="27">
						</a></li>
					</c:if>
					<li class="nav-item align-items-center header-border"><a
						href="/main/logout" class="btn btn-primary btn-sm" onclick="logout()">Logout</a></li>
						
						<!-- 여기가 헤더의 프로필 부분 -->
					<li class="nav-item ps-3">
						<div class="dropdown header-profile2">
						
							<a class="nav-link" href="javascript:void(0);" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">
								<div class="header-info2 d-flex align-items-center">
									<div class="header-media">
										<sec:authorize access="hasRole('ROLE_STUDENT')">
											<c:choose>
												<c:when test="${sessionScope.std.stdProfilePath eq null}">
													<img src="/images/기본프로필.png" style="height: 100%;" alt="">
												</c:when>
												<c:otherwise>
													<img src="/download${sessionScope.std.stdProfilePath}" alt="" style="height: 100%;">
												</c:otherwise>
											</c:choose>
										</sec:authorize>
										<sec:authorize access="hasRole('ROLE_PROFESSOR')">
											<c:choose>
												<c:when test="${sessionScope.pro.proProfilePath eq null}">
													<img src="/images/기본프로필.png" style="height: 100%;" alt="">
												</c:when>
												<c:otherwise>
													<img src="/download${sessionScope.pro.proProfilePath}" alt="" style="height: 100%;">
												</c:otherwise>
											</c:choose>
										</sec:authorize>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<c:choose>
												<c:when test="${sessionScope.emp.empProfilePath eq null}">
													<img src="/images/기본프로필.png" style="height: 100%;" alt="">
												</c:when>
												<c:otherwise>
													<img src="/download${sessionScope.emp.empProfilePath}" alt="" style="height: 100%;">
												</c:otherwise>
											</c:choose>
										</sec:authorize>
									</div>
									<div class="header-info">
										<c:if test="${not empty std}">
											<h6>${std.stdNm}</h6>
											<p>${std.stdNo}</p>
										</c:if>
										<c:if test="${not empty pro}">
											<h6>${pro.proNm}</h6>
											<p>${pro.proNo}</p>
										</c:if>
										<c:if test="${not empty emp}">
											<h6>${emp.empName}</h6>
											<p>${emp.empNo}</p>
										</c:if>
									</div>
								</div>
							</a>
							
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</div>
<div id="micIcon" style="cursor:pointer; display: flex; justify-content: center;  align-items: center; position: fixed;bottom: 50px; right: 50px; z-index: 9999;width:70px; height:70px; background: #800000; border-radius: 50px; border:3px solid white; box-shadow: 1px 1px 3px 1px #dadce0;">
	<i class="fa-solid fa-microphone" id="realMic" style="color: #ffffff; font-size:2em;"></i>
	<p id="stop"></p>	
</div>
<script>

	var timer = document.getElementById("timer")
	function logout(){
		location.replace("/main/logout");
	}
	var time = 10799;
	var hour ="";
	var min = ""; 
	var sec = ""; 
	function formatTwoDigits(number) {
	    return number.toString().padStart(2, '0');
	}
	function updateTimer() {
	    hour =formatTwoDigits( parseInt(time / 3600)); 
	    min = formatTwoDigits(parseInt((time % 3600) / 60)); 
	    sec = formatTwoDigits(time % 60); 
	    timer.innerHTML = hour + " : " + min + " : " + sec;
	    time--;
	    
	    if(time <= 0){
	        clearInterval(x); 
			swal({
				  title: "로그인을 연장하시겠습니까?",
				  text: "취소버튼을 누를 경우 보안을 위해 로그아웃 처리됩니다.",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal("시간이 연장되었습니다.", {
				      icon: "success",
				    }).then(() => {
	                    time = 10799; // 연장 후 시간을 다시 5로 설정
	                    x = setInterval(updateTimer, 1000); // 타이머 다시 시작
	                });
				  } else {
				    swal("로그아웃되었습니다.");
				    location.replace("/main/logout");
				  }
				});
		};
	};

	var x = setInterval(updateTimer, 1000);

	var refresh = document.getElementById("refresh");
	refresh.addEventListener("click", function() {
	    clearInterval(x); 
	    time = 10799; 
	    x = setInterval(updateTimer, 1000); 
	});
	
	getAlarmList();
	
	setInterval(() => {
		getAlarmList();
	}, 2000);
	
// 	AJAX를 통해 알림이 있는지 확인하는 함수
	function getAlarmList() {
		var timeline = $('#alarmLine');
   	 	const notificationDiv = document.querySelector('.alarm-count');
		$.ajax({
			url: "/hku/getAlarmList",
            type: "GET",
            dataType: "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
            success: function(res) {
				var data = ''
                if(res.length > 0) {
                	notificationDiv.style.display = "block";
            	    notificationDiv.innerText = res[0].totalCnt;
					showNotificationShadow();
					for(var i = 0; i < res.length; i++) {
						if(res[i].alarmType === 'counseling'){ // 학생이 상담 신청했을 경우
							data += `<li>
										<a href="/hku/student-counseling" class="link-move" data-alarmno="\${res[i].alarmNo}">
											<div class="timeline-panel">
												<div class="media me-2" style="width: 50px; height: 50px; border: 1px solid #40404073;">`
							if(res[i].sendProfile == 'null' || res[i].sendProfile == null || res[i].sendProfile == 'undefined' || res[i].sendProfile == '') {
								data +=					`<img alt="image" width="50" src="/images/기본프로필.png">`
							}else{
								data +=					`<img alt="image" width="50" src="/download\${res[i].sendProfile}">`
							}
								data +=		    `</div>
												<div class="media-body">
													<h6 class="mb-1" style="font-size: 16px;">\${res[i].alarmTtl}</h6>
													<small class="d-block" style="font-size: 14px;">\${res[i].alarmRegDt}</small>
												</div>
											</div>
										</a>
									</li>`
						}else if(res[i].alarmType === 'counseling-std'){ // 교수가 상담 요청 처리 보낸경우
							data += `<li>
										<a href="/hku/counseling-record" class="link-move" data-alarmno="\${res[i].alarmNo}">
											<div class="timeline-panel">
												<div class="media me-2" style="width: 50px; height: 50px; border: 1px solid #40404073;">`
							if(res[i].sendProfile == 'null' || res[i].sendProfile == null || res[i].sendProfile == 'undefined' || res[i].sendProfile == '') {
								data +=				`<img alt="image" width="50" src="/images/기본프로필.png">`
							}else{
								data +=				`<img alt="image" width="50" src="/download\${res[i].sendProfile}">`
							}
								data +=	    	`</div>
												<div class="media-body">
													<h6 class="mb-1" style="font-size: 14px;">\${res[i].alarmTtl}</h6>
													<small class="d-block" style="font-size: 14px;">\${res[i].alarmRegDt}</small>
												</div>
											</div>
										</a>
									</li>`
						}else if(res[i].alarmType === 'assign-reg'){
							data += `<li>
										<a href="/hku/student/assignmentDetail/\${res[i].alarmPathNo}" class="link-move" data-alarmno="\${res[i].alarmNo}">
											<div class="timeline-panel">
												<div class="media me-2" style="width: 50px; height: 50px; border: 1px solid #40404073;">`
							if(res[i].sendProfile == 'null' || res[i].sendProfile == null || res[i].sendProfile == 'undefined' || res[i].sendProfile == '') {
								data +=				`<img alt="image" width="50" src="/images/기본프로필.png">`
							}else{
								data +=				`<img alt="image" width="50" src="/download\${res[i].sendProfile}">`
							}
								data +=	    	`</div>
												<div class="media-body">
													<h6 class="mb-1" style="font-size: 14px;">\${res[i].alarmTtl}</h6>
													<small class="d-block" style="font-size: 14px;">\${res[i].alarmRegDt}</small>
												</div>
											</div>
										</a>
									</li>`
						}
					}
				
                } else {
                	notificationDiv.style.display = "none";
					data += `<div class="media-body">
								<h6 class="mb-1" style="font-size: 18px; margin-left: 27px; color: #6e6e6e;">알람이 존재하지 않습니다.</h6>
							</div>`
                    hideNotificationShadow();
                }
				timeline.html(data);
            }
		})
	}
	
$(document).on("click",".link-move",function(){
	var alarmNo = this.dataset.alarmno
	var obj = {
		alarmNo:alarmNo
	}
	$.ajax({
		url:"/hku/alarm-delete",
		type:"delete",
		data:JSON.stringify(obj),
		contentType:"application/json; charset=UTF-8",
		beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
        success:function(res){
            console.log(res);
            getAlarmList();
        }
	})
})

	// 알림이 도착하면 잔상을 표시합니다.
	function showNotificationShadow() {
		const notificationShadow = document.querySelector('.notification-shadow');
	  notificationShadow.style.display = 'block';
	}

	// 알림이 닫힐 때 잔상을 숨깁니다.
	function hideNotificationShadow() {
		const notificationShadow = document.querySelector('.notification-shadow');
	  	notificationShadow.style.display = 'none';
	}
	
	// 알람 개수를 업데이트하는 함수
	function updateNotificationCount(count) {
	  const notificationDiv = document.querySelector('.alarm-count');
	  notificationDiv.innerText = count;
	}
	
 
   
</script>