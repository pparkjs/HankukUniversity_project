<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
</style>
<div class="header">
	<div class="header-content">
		<nav class="navbar navbar-expand">
			<div class="collapse navbar-collapse justify-content-between">
				<div class="header-left">

					<!--  검색에 대한 div -->
					<div class="input-group search-area">
						<span class="input-group-text"> <a
							href="javascript:void(0)"> <svg width="19" height="19"
									viewBox="0 0 19 19" fill="none"
									xmlns="http://www.w3.org/2000/svg">
									<circle cx="8.78605" cy="8.78605" r="8.23951" stroke="white"
										stroke-linecap="round" stroke-linejoin="round" />
									<path d="M14.5168 14.9447L17.7471 18.1667" stroke="white"
										stroke-linecap="round" stroke-linejoin="round" />
								</svg>
						</a>
						</span> <input type="text" class="form-control" placeholder="Search">
					</div>

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
							class="nav-link bell-link" href="javascript:void(0);"> <svg
									width="20" height="22" viewBox="0 0 22 20" fill="none"
									xmlns="http://www.w3.org/2000/svg">
									<path
										d="M16.9026 6.85114L12.4593 10.4642C11.6198 11.1302 10.4387 11.1302 9.59922 10.4642L5.11844 6.85114"
										stroke="white" stroke-width="1.5" stroke-linecap="round"
										stroke-linejoin="round" />
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M15.9089 19C18.9502 19.0084 21 16.5095 21 13.4384V6.57001C21 3.49883 18.9502 1 15.9089 1H6.09114C3.04979 1 1 3.49883 1 6.57001V13.4384C1 16.5095 3.04979 19.0084 6.09114 19H15.9089Z"
										stroke="white" stroke-width="1.5" stroke-linecap="round"
										stroke-linejoin="round" />
									</svg>
						</a></li>
					</c:if>
					<li class="nav-item align-items-center header-border"><a
						href="/main/logout" class="btn btn-primary btn-sm" onclick="logout()">Logout</a></li>
					<li class="nav-item ps-3">
						<div class="dropdown header-profile2">
							<a class="nav-link" href="javascript:void(0);" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">
								<div class="header-info2 d-flex align-items-center">
									<div class="header-media">
										<img src="/images/tab/1.jpg" alt="">
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
							<div class="dropdown-menu dropdown-menu-end" style="">
								<div class="card border-0 mb-0">
									<div class="card-header py-2">
										<div class="products">
											<img src="/images/tab/1.jpg" class="avatar avatar-md" alt="">
											<div>
												<c:if test="${not empty std}">
													<h6>${std.stdNm}</h6>
													<span>${std.stdNo }</span>
												</c:if>
												<c:if test="${not empty pro}">
													<h6>${pro.proNm}</h6>
													<span>${pro.proNo }</span>
												</c:if>
												<c:if test="${not empty emp}">
													<h6>${emp.empName}</h6>
													<span>${emp.empNo }</span>
												</c:if>
											</div>
										</div>
									</div>
									<div class="card-body px-0 py-2">
										<a href="/hku/student/mypage" class="dropdown-item ai-icon ">
											<svg width="20" height="20" viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
													<path fill-rule="evenodd" clip-rule="evenodd"
													d="M11.9848 15.3462C8.11714 15.3462 4.81429 15.931 4.81429 18.2729C4.81429 20.6148 8.09619 21.2205 11.9848 21.2205C15.8524 21.2205 19.1543 20.6348 19.1543 18.2938C19.1543 15.9529 15.8733 15.3462 11.9848 15.3462Z"
													stroke="var(--primary)" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round" />
													<path fill-rule="evenodd" clip-rule="evenodd"
													d="M11.9848 12.0059C14.5229 12.0059 16.58 9.94779 16.58 7.40969C16.58 4.8716 14.5229 2.81445 11.9848 2.81445C9.44667 2.81445 7.38857 4.8716 7.38857 7.40969C7.38 9.93922 9.42381 11.9973 11.9524 12.0059H11.9848Z"
													stroke="var(--primary)" stroke-width="1.42857"
													stroke-linecap="round" stroke-linejoin="round" />
													</svg> <span class="ms-2">Profile </span>
										</a> <a href="app-profile.html" class="dropdown-item ai-icon ">
											<svg xmlns="http://www.w3.org/2000/svg" width="19"
												height="19" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2"
												stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-pie-chart">
												<path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path>
												<path d="M22 12A10 10 0 0 0 12 2v10z"></path></svg> <span
											class="ms-2">My Project</span><span
											class="badge badge-sm badge-secondary light rounded-circle text-white ms-2">4</span>
										</a> <a href="javascript:void(0);" class="dropdown-item ai-icon ">
											<svg width="20" height="20" viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
													<path
													d="M17.9026 8.85114L13.4593 12.4642C12.6198 13.1302 11.4387 13.1302 10.5992 12.4642L6.11844 8.85114"
													stroke="var(--primary)" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round" />
													<path fill-rule="evenodd" clip-rule="evenodd"
													d="M16.9089 21C19.9502 21.0084 22 18.5095 22 15.4384V8.57001C22 5.49883 19.9502 3 16.9089 3H7.09114C4.04979 3 2 5.49883 2 8.57001V15.4384C2 18.5095 4.04979 21.0084 7.09114 21H16.9089Z"
													stroke="var(--primary)" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round" />
													</svg> <span class="ms-2">Message </span>
										</a> <a href="email-inbox.html" class="dropdown-item ai-icon ">
											<svg width="20" height="20" viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
														<path fill-rule="evenodd" clip-rule="evenodd"
													d="M12 17.8476C17.6392 17.8476 20.2481 17.1242 20.5 14.2205C20.5 11.3188 18.6812 11.5054 18.6812 7.94511C18.6812 5.16414 16.0452 2 12 2C7.95477 2 5.31885 5.16414 5.31885 7.94511C5.31885 11.5054 3.5 11.3188 3.5 14.2205C3.75295 17.1352 6.36177 17.8476 12 17.8476Z"
													stroke="var(--primary)" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round" />
														<path
													d="M14.3888 20.8572C13.0247 22.372 10.8967 22.3899 9.51947 20.8572"
													stroke="var(--primary)" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round" />
														</svg> <span class="ms-2">Notification </span>
										</a>
									</div>
									<div class="card-footer px-0 py-2">
										<a href="javascript:void(0);" class="dropdown-item ai-icon ">
											<svg width="20" height="20" viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
														<path fill-rule="evenodd" clip-rule="evenodd"
													d="M20.8066 7.62355L20.1842 6.54346C19.6576 5.62954 18.4907 5.31426 17.5755 5.83866V5.83866C17.1399 6.09528 16.6201 6.16809 16.1307 6.04103C15.6413 5.91396 15.2226 5.59746 14.9668 5.16131C14.8023 4.88409 14.7139 4.56833 14.7105 4.24598V4.24598C14.7254 3.72916 14.5304 3.22834 14.17 2.85761C13.8096 2.48688 13.3145 2.2778 12.7975 2.27802H11.5435C11.0369 2.27801 10.5513 2.47985 10.194 2.83888C9.83666 3.19791 9.63714 3.68453 9.63958 4.19106V4.19106C9.62457 5.23686 8.77245 6.07675 7.72654 6.07664C7.40418 6.07329 7.08843 5.98488 6.8112 5.82035V5.82035C5.89603 5.29595 4.72908 5.61123 4.20251 6.52516L3.53432 7.62355C3.00838 8.53633 3.31937 9.70255 4.22997 10.2322V10.2322C4.82187 10.574 5.1865 11.2055 5.1865 11.889C5.1865 12.5725 4.82187 13.204 4.22997 13.5457V13.5457C3.32053 14.0719 3.0092 15.2353 3.53432 16.1453V16.1453L4.16589 17.2345C4.41262 17.6797 4.82657 18.0082 5.31616 18.1474C5.80575 18.2865 6.33061 18.2248 6.77459 17.976V17.976C7.21105 17.7213 7.73116 17.6515 8.21931 17.7821C8.70746 17.9128 9.12321 18.233 9.37413 18.6716C9.53867 18.9488 9.62708 19.2646 9.63043 19.5869V19.5869C9.63043 20.6435 10.4869 21.5 11.5435 21.5H12.7975C13.8505 21.5 14.7055 20.6491 14.7105 19.5961V19.5961C14.7081 19.088 14.9088 18.6 15.2681 18.2407C15.6274 17.8814 16.1154 17.6806 16.6236 17.6831C16.9451 17.6917 17.2596 17.7797 17.5389 17.9393V17.9393C18.4517 18.4653 19.6179 18.1543 20.1476 17.2437V17.2437L20.8066 16.1453C21.0617 15.7074 21.1317 15.1859 21.0012 14.6963C20.8706 14.2067 20.5502 13.7893 20.111 13.5366V13.5366C19.6717 13.2839 19.3514 12.8665 19.2208 12.3769C19.0902 11.8872 19.1602 11.3658 19.4153 10.9279C19.5812 10.6383 19.8213 10.3981 20.111 10.2322V10.2322C21.0161 9.70283 21.3264 8.54343 20.8066 7.63271V7.63271V7.62355Z"
													stroke="var(--primary)" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round" />
														<circle cx="12.175" cy="11.889" r="2.63616"
													stroke="var(--primary)" stroke-width="1.5"
													stroke-linecap="round" stroke-linejoin="round" />
														</svg> <span class="ms-2">Settings </span>
										</a> <a href="page-login.html" class="dropdown-item ai-icon">
											<svg xmlns="http://www.w3.org/2000/svg" width="18"
												height="18" viewBox="0 0 24 24" fill="none"
												stroke="var(--primary)" stroke-width="2"
												stroke-linecap="round" stroke-linejoin="round">
												<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
												<polyline points="16 17 21 12 16 7"></polyline>
												<line x1="21" y1="12" x2="9" y2="12"></line></svg> <span
											class="ms-2">Logout </span>
										</a>
									</div>
								</div>

							</div>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</div>
<div id="micIcon" style="cursor:pointer; display: flex; justify-content: center;  align-items: center; position: fixed;bottom: 50px; right: 50px; z-index: 9999;width:70px; height:70px; background: #800000; border-radius: 50px; border:3px solid white; box-shadow: 1px 1px 3px 1px #dadce0;">
	<i class="fa-solid fa-microphone" style="color: #ffffff; font-size:2em;"></i>
	<p id="stop"></p>	
</div>
<script>
const speech = new webkitSpeechRecognition();
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