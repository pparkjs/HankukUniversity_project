$(function() {
const speech = new webkitSpeechRecognition();
	const icon = document.getElementById('realMic');

	  speech.continuous = false;
	
	  speech.onstart = function() {
	    icon.classList.add('recording'); // 아이콘에 클래스 추가하여 스타일 적용
	  };
	
	  speech.onend = function() {
	    icon.classList.remove('recording'); // 아이콘에 클래스 제거하여 스타일 제거
	  };
   	  
   	  //음성인식 이벤트 스탑
   	  document.getElementById('stop').addEventListener('click', function() {
   	    speech.stop();
   	  });

   	  //speech 결과 이벤트
   	  speech.addEventListener('result', function(event) {
   	    const transcript = event.results[0][0].transcript;
   	  //■■■■■■■■■■ 공통 ■■■■■■■■■■
   	    if (transcript.includes('로그아웃')) {
   	     location.href = "/main/logout"
     	    }
     	    
   	  //■■■■■■■■■■ 학생 ■■■■■■■■■■
   	  // ────── 학적 ───────
   	  	if (transcript.includes('기본 사항')||transcript.includes('기본사항')) {
   	      location.href = "/hku/student/record";
   	    }
   	  	if (transcript.includes('학적변동')|| transcript.includes('학적변동신청')||transcript.includes('학적 변동')) {
   	      location.href = "/hku/student/recordChange";
   	    }
   	  	if (transcript.includes('졸업')) {
   	      location.href = "/hku/student/gradute";
   	    }
   	  // ────── 수강정보 ───────
   	    if (transcript.includes('교과목 조회')||transcript.includes('교과목조회')) {
   	      location.href = "/hku/search-subject";
   	    }
   	    if (transcript.includes('수강 신청')||transcript.includes('수강신청')) {
   	      location.href = "/hku/course-req";
   	    }
   	    if (transcript.includes('수강 이력')||transcript.includes('수강이력')) {
   	      location.href = "/hku/course-record";
   	    }
   	    if (transcript.includes('수강중인강의')) {
   	      location.href = "/hku/present-course";
   	    }
   	  // ────── 성적 ───────
   	     if (transcript.includes('전체학기') || transcript.includes('전체학기성적조회')) {
   	      location.href = "/hku/student/all-grade";
   	    }
   	     if (transcript.includes('당학기') || transcript.includes('당학기성적조회')) {
   	      location.href = "/hku/student/subject-grade";
   	    }
   	  // ────── 시험 ───────
   	     if (transcript.includes('응시과목정보')) {
   	      location.href = "/hku/test-info";
   	    }
   	  // ────── 클래스룸 ───────
   	  	if (transcript.includes('클래스룸')) {
   	      location.href = "/hku/professor/voiceClassroom";
   	    }
   	  // ────── 상담  ───────
   	  	if (transcript.includes('상담 신청')||transcript.includes('상담신청')) {
   	      location.href = "/hku/counseling-req";
   	    }
   	    	if (transcript.includes('신청 내역 조회')||transcript.includes('신청내역')) {
   	      location.href = "/hku/counseling-record";
   	    }
   	    console.log(transcript);
   	   
   	  // ────── 스터디  ───────
   	 if (transcript.includes('스터디')) {
   	      location.href = "/hku/student/study";
   	    }
   	  // ────── 시설예약 ───────
   	   if (transcript.includes('사물함 예약')||transcript.includes('사물함')) {
   	      location.href = "/hku/locker-rsvt";
   	    }
   	     if (transcript.includes('시설물 예약')||transcript.includes('시설물')) {
   	      location.href = "/hku/facility-rsvt";
   	    }
   	     if (transcript.includes('나의 예약 현황')||transcript.includes('예약 현황')) {
   	      location.href = "/hku/my-reservation";
   	    }
   	  // ────── 등록금 ───────
   	  if (transcript.includes('등록금 납부 내역')||transcript.includes('납부 내역')) {
   	      location.href = "/hku/tuition-payment-details";
   	    }
   	    if (transcript.includes('등록금고지서')||transcript.includes('고지서')) {
   	      location.href = "/hku/tuition-bill";
   	    }
   	  // ────── 장학금  ───────
   	  if (transcript.includes('장학금신청')) {
   	      location.href = "";
   	    }
   	  if (transcript.includes('장학금수혜내역확인')||transcript.includes('수혜')) {
   	      location.href = "";
   	    }
   	  // ────── 증명서  ───────
   	  if (transcript.includes('증명서발급')||transcript.includes('증명서')) {
   	      location.href = "";
   	    }
   	  //■■■■■■■■■■ 교수 ■■■■■■■■■■
   	  // ────── 강의관리  ───────
   	  if (transcript.includes('강의개설신청')||transcript.includes('강의 개설')||transcript.includes('강의 개설 신청')) {
   	      location.href = "/hku/lecture/open";
   	    }
   	  if (transcript.includes('휴강신청')||transcript.includes('휴강 신청')) {
   	      location.href = "/hku/professor/restClass";
   	    }
   	  // ────── 클래스룸  ───────
   	  
   	   if (transcript.includes('클래스룸')||transcript.includes('클래스룸')) {
   	      location.href ="/hku/professor/voiceClassroom";
   	    }
   	  // ────── 상담관리  ───────
   	  if (transcript.includes('학생 상담 신청 내역')||transcript.includes('학생상담 신청 내역')||transcript.includes('학생 상담')) {
   	      location.href = "/hku/student-counseling";
   	    }
   	  //■■■■■■■■■■ 직원 ■■■■■■■■■■
   	  
   	  // ────── 학사관리  ───────
   	   if (transcript.includes('학과 관리')||transcript.includes('학과관리')) {
   	      location.href = "/hku/admin/dept-administration";
   	    }
   	     if (transcript.includes('학적 관리')||transcript.includes('학적관리')) {
   	      location.href = "/hku/admin/academic/fluctuation-list";
   	    }
   	     if (transcript.includes('교과목 관리')||transcript.includes('교과목관리')) {
   	      location.href = "/hku/admin/subject-administration";
   	    }
   	     if (transcript.includes('시설 관리')||transcript.includes('시설관리')) {
   	      location.href = "/hku/admin/facility-administration";
   	    }
   	     if (transcript.includes('사물함 관리')||transcript.includes('사물함관리')) {
   	      location.href = "/hku/admin/locker-administration";
   	    }
   	     if (transcript.includes('학사 일정 관리')||transcript.includes('학사일정관리')) {
   	      location.href = "/hku/admin/calendar";
   	    }
   	   // ────── 학사관리  ───────
   	   if (transcript.includes('사용자 관리')||transcript.includes('사용자관리')) {
   	      location.href = "/hku/admin/user-management";
   	    }
   	    if (transcript.includes('문자 발송')||transcript.includes('문자발송')) {
   	      location.href = "";
   	    }
   	   // ────── 교수행정  ───────
     	 if (transcript.includes('개설신청관리')||transcript.includes('개설 신청 관리')) {
   	      location.href = "/hku/admin/lecaplylist";
   	    }
     	 if (transcript.includes('휴강신청관리')||transcript.includes('휴강 신청 관리')) {
   	      location.href = "/hku/admin/lecture-canceled/management";
   	    }
   	   // ────── 장학금  ───────
     	 if (transcript.includes('장학금 정보 등록')||transcript.includes('장학금정보등록')) {
   	      location.href = "/hku/admin/scholarship-info";
   	    }
     	 if (transcript.includes('장학금 신청 내역')||transcript.includes('장학금신청내역')) {
   	      location.href = "/hku/admin/scholarship-aply-list";
   	    }
   	   // ────── 게시판관리  ───────
     	 if (transcript.includes('학사공지 게시판')||transcript.includes('학사 공지 게시판')) {
   	      location.href = "/hku/notice/list";
   	    }
     	 if (transcript.includes('채용정보 게시판')||transcript.includes('채용 정보 게시판')||transcript.includes('채용정보게시판')) {
   	      location.href = "/hku/employment/list";
   	    }
     	 if (transcript.includes('학과공지 게시판')||transcript.includes('학과 공지 게시판')) {
   	      location.href = "/hku/dept/notice";
   	    }
   	   // ────── 총지표  ───────
     	 if (transcript.includes('총지표')||transcript.includes('총 지표')) {
   	      location.href = "/hku/admin/totalChart";
   	    }
   	    
   	    
   	    if (transcript.includes('번글')||transcript.includes('번 글')||transcript.includes('번') ) {
   	    	var num = newsentence(transcript)
   	    	 var parsedNum = parseInt(num); // 문자열을 숫자로 변환합니다.
		  			if (!isNaN(parsedNum)) { // 숫자인지 확인합니다.
		  				  location.href = "/boardDetail/" + parsedNum;
		 			 } else {
		   			 console.log("유효한 번호를 인식할 수 없습니다.");
			 }
     	    }
   	  });

   	  //음성인식 시작이벤트
   	  document.getElementById('micIcon').addEventListener('click', function() {
   	    speech.start();
   	  });
   	  
   	  // 인식된 문장을 가공하는 메소드
   	  function newsentence(transcript) {
   		  var keyword = '번';
   		  
   		  const index = transcript.indexOf(keyword);
   		  
   		  if (index !== -1) {
   		    const sentence = transcript.slice(0,index);
   		    return sentence;
   		  }
   		  
   		  return '';
   		}
   	  //키보드로 음성인식 작동하는 메솓
   	  document.addEventListener('keydown', function(event) {
       	  if (event.shiftKey && event.which === 65) {
       	    // `shift`와 `a`가 동시에 눌렸을 때 수행할 동작을 여기에 작성합니다.
       		  speech.start();
       	  }
       	});
   	});