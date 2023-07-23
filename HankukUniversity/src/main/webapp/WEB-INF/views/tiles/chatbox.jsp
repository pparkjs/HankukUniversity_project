<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty std}">

</c:if>
<div class="chatbox">
	<div class="chatbox-close"></div>
	<div class="custom-tab-1">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" data-bs-toggle="tab" href="#chat">Chat</a>
			</li>
		</ul>
		<!-- 채팅방 리스트 -->
		<div class="tab-content">
			<div class="tab-pane fade active show" id="chat">
				<div class="card mb-sm-3 mb-md-0 contacts_card dz-chat-user-box">
					<div class="card-header chat-list-header text-center">
						<h6 class="mb-1">Chat List</h6>
						<p class="mb-0">Show All</p>
					</div>
					
					<div class="card-body contacts_body p-0 dz-scroll  " id="DZ_W_Contacts_Body">
						<ul class="contacts" id="cBody">
							
						</ul>
					</div>
				</div>
				
								<!-- 채팅방 -->
				<div class="card chat dz-chat-history-box d-none">
					<div class="card-header chat-list-header text-center">
						<a href="javascript:void(0);" class="dz-chat-history-back">
							<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="18px" height="18px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><polygon points="0 0 24 0 24 24 0 24"/><rect fill="#000000" opacity="0.3" transform="translate(15.000000, 12.000000) scale(-1, 1) rotate(-90.000000) translate(-15.000000, -12.000000) " x="14" y="7" width="2" height="10" rx="1"/><path d="M3.7071045,15.7071045 C3.3165802,16.0976288 2.68341522,16.0976288 2.29289093,15.7071045 C1.90236664,15.3165802 1.90236664,14.6834152 2.29289093,14.2928909 L8.29289093,8.29289093 C8.67146987,7.914312 9.28105631,7.90106637 9.67572234,8.26284357 L15.6757223,13.7628436 C16.0828413,14.136036 16.1103443,14.7686034 15.7371519,15.1757223 C15.3639594,15.5828413 14.7313921,15.6103443 14.3242731,15.2371519 L9.03007346,10.3841355 L3.7071045,15.7071045 Z" fill="#000000" fill-rule="nonzero" transform="translate(9.000001, 11.999997) scale(-1, -1) rotate(90.000000) translate(-9.000001, -11.999997) "/></g></svg>
						</a>
						<div>
							<h6 class="mb-1" id="roomNm">Chat with Khelesh</h6>
						</div>							
						<div class="dropdown">
							<a href="javascript:void(0);" data-bs-toggle="dropdown" aria-expanded="false"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="18px" height="18px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="24" height="24"/><circle fill="#000000" cx="5" cy="12" r="2"/><circle fill="#000000" cx="12" cy="12" r="2"/><circle fill="#000000" cx="19" cy="12" r="2"/></g></svg></a>
							<ul class="dropdown-menu dropdown-menu-end">
								<li class="dropdown-item"><i class="fa fa-user-circle text-primary me-2"></i> View profile</li>
								<li class="dropdown-item"><i class="fa fa-users text-primary me-2"></i> Add to btn-close friends</li>
								<li class="dropdown-item"><i class="fa fa-plus text-primary me-2"></i> Add to group</li>
								<li class="dropdown-item"><i class="fa fa-ban text-primary me-2"></i> Block</li>
							</ul>
						</div>
					</div>
					<div class="card-body msg_card_body dz-scroll" id="DZ_W_Contacts_Body3">
						<div id="msgBody">
							<!-- 받은 메세지 -->
														
							<!-- 보낸 메세지 -->
						</div>							
					</div>
					
					<div class="card-footer type_msg">
						<div class="input-group">
							<textarea class="form-control" id="msgContent" name="msgContent" placeholder="Type your message..."></textarea>
							<div class="input-group-append">
								<button type="button" id="sendBtn" onclick="sendMessage()" class="btn btn-primary"><i class="fa fa-location-arrow"></i></button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>
<c:if test="${not empty std}">
	<script type="text/javascript">
	$(document).ready(function() {
		chatList();
		
		$(document).on("click", ".active.dz-chat-user", function() {
			$(".card.contacts_card.dz-chat-user-box").toggleClass("d-none");
			$(".card.chat.dz-chat-history-box").toggleClass("d-none");
		});
	});
	
	function chatList() {
		$.ajax({
			type: "get",
			url: "/hku/student/chatList",
			dataType: "json",
			success: function(res) {
			  var cBody = $("#cBody");
			  var chatList = '';
			  for (var i = 0; i < res.length; i++) {
			    chatList += `
						      <li class="active dz-chat-user" id ="\${res[i].studyNo}" value="\${res[i].stdNo}" onclick="enterRoom(this)">
						        <div class="d-flex bd-highlight">
						          <div class="img_cont">
						            <img src="/images/avatar/1.jpg" class="rounded-circle user_img" alt="">
						            <span class="online_icon"></span>
						          </div>
						          <div class="user_info">
						            <span>\${res[i].studyName}</span>
						            <p>\${res[i].count}</p>
						          </div>
						        </div>
						      </li>`;
			  }
			  cBody.html(chatList);
			},
			error: function(err) {
			  console.log(err);
			}
		});
	}
	
	// 해당 조건에 해당할 때만 connect 함수 실행
	var chatSocket = null;
	connect();
	
	// 입장 버튼을 눌렀을 때 호출되는 함수
	function connect() {
	    // 웹소켓 주소
	    var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/studyChat.do";
	    // 소켓 객체 생성
	    chatSocket = new WebSocket(wsUri);
	    // 웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록 (오버라이딩)
	    chatSocket.onopen = function () {
	        console.log('info: connection opened.');
	    }
	}
	
	//채팅방 이외의 공간에 있을 떄 실시간 채팅 개수 알람 받기.
	chatSocket.onmessage = function(evt) {
		console.log("evt.data : ", evt.data)
		
			if(evt.data == "reload"){
				//getChatCnt();
			}
	}
	
	//입장 버튼 누를때 onclick(this)으로 해당 함수 호출
	function enterRoom(obj){
		console.log("enterRoom 실행")
		studyNo = obj.getAttribute("id") // javaScript 객체에서 id 속성값 가져오기
		stdNo = obj.value
		const studyName = obj.querySelector('.user_info span').textContent;
		console.log("내가 접속한 방: ", studyName)
		var roomNm = $("#roomNm");
		// 방에 입장 시 해당 정보 서버에 전달
		const roomData = {
			 "studyNo" : studyNo,
			 "stdNo" : stdNo,
			 "type" : "enter-room"
		}
		chatSocket.send(JSON.stringify(roomData));
		
		roomNm.html(studyName);
		// 이전에 추가된 동적 태그를 모두 지우기
		$('.msgDiv').html("");
	
		msgList();
	}
	
	function msgList(){
		console.log("msgList불러오기");
		
		$.ajax({
		  type: "get",
		  url: "/hku/student/messageList",
		  data: {
		    "stdNo": stdNo,
		    "studyNo": studyNo
		  },
		  dataType: "json",
		  success: function (data) {
			console.log("메세지리스트 성공적으로 가져옴!");
		    var msgBody = $("#msgBody");
		    var msgList = '';
		    //console.log("stdNo: ", stdNo);
		    for (var i = 0; i < data.length; i++) {
		  	  //console.log("chatMsg",data);
		  	  var stdNo2 = data[i].stdNo
			  //console.log("stdNo2: ", stdNo2);
		      if (stdNo2 == stdNo) {
		        msgList += `
				          <div class="d-flex justify-content-end mb-4">
							<div class="msg_cotainer_send">
							 \${data[i].msgContent}
								<span class="msg_time_send">\${data[i].msgRegdate}
							</div>
							<div class="img_cont_msg">
								<img src="/images/avatar/2.jpg" class="rounded-circle user_img_msg" alt="">
								\${data[i].stdNm}
							</div>
						</div>
		        `;
		      } else {
		        msgList += `
				          <div class="d-flex justify-content-start mb-4">
				            <div class="img_cont_msg">
				              <img src="/images/avatar/1.jpg" class="rounded-circle user_img_msg" alt="">
				              \${data[i].stdNm}
				            </div>
				            <div class="msg_cotainer">
				              \${data[i].msgContent}
				              <span class="msg_time">\${data[i].msgRegdate}
				            </div>
				          </div>
		        `;
		      }
		    }
		    // for 루프 완료 후에 msgList를 msgBody에 추가
		    msgBody.html(msgList);
		    
		    // 스크롤 맨 아래로 이동
			var chatBody = document.getElementById("DZ_W_Contacts_Body3");
			chatBody.scrollTop = chatBody.scrollHeight;
		    },
		    error: function(err) {
	        	console.log("에러 발생",err);
		    	console.log("메세지리스트 못가져옴 ㅠ");
	        }
		});
	}
	//enter 누르면 메시지 전송
	$(document).on('keydown', '#msgContent', function(e) {
	    if (e.keyCode == 13 && !e.shiftKey) { // 엔터키가 눌렸을 때 동작하도록 조건 추가
	        e.preventDefault(); // 엔터키가 입력되는 것을 막아준다. (줄바꿈 동작 막음)
	        sendMessage(); // sendMessage() 함수 호출
	    }
	});
	
	//* 1 메시지 전송
	function sendMessage(){
		console.log("sendMessage실행!");
		msgContent = $('#msgContent').val();
		
		// 입력된 메시지가 공백 또는 문자열로만 이루어져 있을 때 함수 실행 멈춤
		if (msgContent.replace(/\s|  /gi, "").length == 0) {
		    return false;
		    $('#msgContent textarea').focus();
		}
		const data = {
			    "stdNo": stdNo,
			    "studyNo": studyNo,
				"msgContent" : msgContent,
				"type" : "msg"
		 };
		 console.log("보낸데이터: ", data);
		 $('#msgContent').val('');
		
		// websocket 서버에 해당 data 전송
		chatSocket.send(JSON.stringify(data));
	}
	
	 //2 메세지 수신 (웹소켓 서버로부터 메시지를 수신하는 함수)
	chatSocket.onmessage = function(evt) {
		 	console.log("evt.data : ", evt.data)
		 	
		    if(evt.data == "reload"){
		    	msgList();
		    	chatList();
		    	//chatMessageList();
		    }else{
			 	let receive = evt.data.split(","); // evt.data 서버에서 전송된 메시지 데이터
		    }
	 }
	
	// function chatMessageList() {
	  
	      
	//       // studymemberList Ajax 요청 실행
	//       $.ajax({
	//         url: "/hku/student/studymemberList",
	//         data: {
	//           "studyNo": studyNo
	//         },
	//         dataType: "json",
	//         success: function (res) {
	//           var cnt = 0;
	//           var member = "스터디원: ";
	//           for (var i = 0; i < res.length; i++) {
	//             console.log("res: ", res);
	//             if (res[i].studyRole == 'Y') {
	//               console.log("스터디장: ", res[i].stdNm);
	//               //$("#leader").html(`스터디장 : ${res[i].stdNm}`);
	//             } else if (i == res.length - 1) {
	//               member += `${res[i].stdNm}`;
	//             } else {
	//               member += `${res[i].stdNm}, `;
	//             }
	//             cnt += 1;
	//           }
	//           if (cnt > 1) {
	//             console.log("멤버: ", member);
	//             //$("#stMem").html(member);
	//           } else {
	//             member += "없음";
	//             console.log("멤버: ", member);
	//             //$("#stMem").html(member);
	//           }
	//         }
	//       });
	
	// }
	
	</script>			
</c:if>			
				

