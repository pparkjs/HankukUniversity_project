# ![로고(마크)](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/32e54a61-02e7-4606-ad65-902ba5893848)한국대학교 학사관리시스템 (HANKUK University LMS)

> ### *Who are we?*
- 제작 기간 : 2023-06-21 ~ 2023-08-11
- 팀구성 : 박정수(PL) 고영우(UA,DA) 조성희(TA,AA) 정재균(DA,UA) 황지현(AA,TA) 이성일(AA,TA)

### [프로젝트 노션링크](https://silicon-vegetable-8cc.notion.site/HanKuk-University-78e41355f95341929e4a102629ee664a?pvs=4)

<br/>

> ### *Overview*
*구시대적인 UI와 사용성이 떨어지는 기존의 학사관리 시스템을 탈피하고*

*사용자의 필요성과 편리성에 맞춰 효율적이고 적재적소에 맞는*

*학사관리 시스템을 제공하기 위하여 프로젝트를 진행함*

![팀의견](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/643715ff-b223-4f77-8c41-fb31438dd7c1)

# 👥 팀원 역할
> ### *박정수*
- 깃 사용법 강의 및 전반적인 프로젝트 배포 및 관리
- 교수와 학생간 실시간 알림
- 1:1, 멀티 화상채팅
- websocket 이용한 실시간 그룹채팅
- 온라인 시험 등록 및 시험 응시
- websocket 이용한 실시간 수강신청, 교과목 조회, 수강이력 조회, 수강중인 강의 조회
- 상담 신청 및 조회
- 사물함 예약, 시설물예약, 나의 예약 현황 조회
- 교수 대쉬보드
> ### *고영우*
- 프로젝트 DB설계
- 시설과 시설물 관리 기능
- POI 이용한 사용자 일괄 등록 및 수정, 삭제
- 사물함 관리기능
- 교과목 관리기능
- itext 이용한 등록금 납부 내역 확인, 고지서 조회, 고지서 다운로드
- 장학금 조회, 장학금 신청, 장학금 수혜내역확인
- itext 이용한 증명서 발급, 발급내역 조회
> ### *조성희*
- 마이페이지 기능
- 교수, 학생 클래스룸 목록 조회
- 교수의 학생과제 관리기능
- 교수의 학생성적 관리기능
- 교수의 학생출석 관리기능
- 학생의 출석 확인 및 이의신청기능
- 학생의 과제 제출기능
- 문자API를 이용한 사용자 주소록 문자 발송기능
- 카카오 결제API 설계
> ### *정재균*
- 프로젝트 DB설계
- gridstack.js를 이용한 포탈사이트의 사용자 편의 위젯 자유 배치 기능
- 강의개설신청 관리기능
- 문자API를 활용한 휴강신청 관리 기능
- 장학금 관리기능
- 풀캘린더를 이용한 학사,학과 일정관리
- 학적변동 관리기능
- 학사, 학과 공지관리 기능
> ### *황지현*
- 스프링 시큐리티를 이용한 액터별 로그인 접근 설계
- 음성인식 API를 이용한 스터디모집게시판 CRUD 및 페이지 이동기능
- 메일API를 이용한 비밀번호 찾기 기능
- 날씨 API 기능
- 학생의 당학기 성적 조회, 전체학기 성적 조회
- 교수의 강의 개설신청 및 조회
- 풀캘린더 이용한 교수의 휴강신청 기능
> ### *이성일*
- RESTful, 패키지구조설계
- 학생 학적조회, 변동기능
- 조기졸업, 졸업유예 신청 및 조회 기능
- 스터디룸 개설 삭제 가입 신청 관리 및 학생 시간표 비교기능
- websocket을 이용한 실시간 그룹 채팅 기능
- 스터디 모집게시판 기능
- 학교 총지표
- 캡쳐API를 이용한 로그인 보안
  
# 🛠️ 기술 스택
<div>
<img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/>
<img src="https://img.shields.io/badge/Java-F7DF1E?style=flat-square"/>
<img src="https://img.shields.io/badge/Node.js-339933?style=flat-square&logo=Node.js&logoColor=white"/>
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=ffffff"/>
<img src="https://img.shields.io/badge/CSS-1572B6?style=flat-square&logo=CSS3&logoColor=ffffff"/>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=ffffff"/>
<img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=Oracle&logoColor=white"/>
<img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=flat-square&logo=Eclipse IDE&logoColor=white"/>
<img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=Bootstrap&logoColor=white"/>
<img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat-square&logo=Apache Tomcat&logoColor=black"/>
<img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=white"/> 
<img src="https://img.shields.io/badge/Redmine-B32024?style=flat-square&logo=Redmine&logoColor=white"/>
<img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/>

</div>

<br/>

# 📋 주요 기능
> ### *학생 상담 신청 및 알림*
- 학생에 해당하는 학과의 교수님 리스트가 나오며 해당 주차에 대한 교수의 시간 시간표를 확인 후 원하는 시간에 상담예약을 신청할 수 있습니다. <br>교수의 주차별 시간표 테이블은 해당 시점 이전에 시간에 대해서 예약할 수 없습니다.
- 학생이 상담 신청을 할 시 해당 교수에게 실시간으로 알림이 나타나며 신청 내역을 조회 후 승인 및 반려가 가능하며 승인 및 반려시 학생에게 알림이 나타납니다.
  ![상담신청](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/c3771a3a-6934-4681-a398-13ae522d7fee)
  
  <br>
> ### *1:1 비대면 화상상담채팅*
- 실시간1:1화상채팅을 위해 nodeJs를 이용하여 webRTC의 시그널링 서버를 구축하였으며 해당 서버에서 socket.io를 이용하여 실시간으로 해당 방(스터디번호)에 접속한 클라이언트끼리 stream 정보를 서로 공유합니다. 
- 학생이 신청한 상담이 비대면인 경우 승인 할 시 입장 버튼이 학생과 교수에게 활성화 되며 입장 을 클릭시 1:1 화상채팅이 가능합니다.
  ![일대일](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/baeb3e3d-cd95-4a07-90d0-1c93bfc53d07)

  <br>
> ### *사용자 관리*
- 사용자관리에는 교직원이 엑셀 POI API를 이용하여 사용자의 많은 데이터를 한번에 일괄 등록을 할 수 있다는 장점이 있으며 엑터별로 개별 등록도 가능합니다.
- 또한 전반적인 사용자에 대한 CRUD가 가능합니다.
![사용자관리](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/33ff056c-eca6-4248-b7c5-5d05848739fa)

  <br>
> ### *학사/학과 일정관리*
- 학사 일정 관리는 풀캘린더API를 이용하여 학사 및 각 학과별로 일정에 대한 CRUD를 할 수 있습니다
- 이외에도 교수의 휴강신청 및 스터디룸 일정에도 같은 일정관리 기능이 구현되어 있습니다.
![캘린더](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/74b0e6b7-b8d3-4374-a7c2-730c27785254)

  <br>
> ### *사용자 문자발송*
- coolsms API를 활용한 문자발송 기능은 학교에 소속된 원하는 사용자들에게 교직원이 만든 문자 플랫폼을 이용하여 일괄로 문자를 전송할 수 있는 기능입니다.
- 이외에도 휴강신청 관리에서도 해당 문자 발송기능이 구현되어 있습니다.
![문자전송](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/ce84dec9-a5e1-4b08-9d3a-cb988a79373b)

  <br>
> ### *스터디원들간 비대면 멀티 화상채팅*
- 실시간 멀티화상채팅을 위해 nodeJs를 이용하여 webRTC의 시그널링 서버를 구축하였으며 해당 서버에서 socket.io를 이용하여 실시간으로 해당 방(스터디번호)에 스터디원이 접속할때마다 클라이언트들의 stream 정보들을 스터디의 화상채팅에 접속한 모든 사람들과 공유합니다.
- 스터디원에 소속되어있는 학생들은 해당 스터디룸에서 화상채팅 버튼을 클릭시 실시간으로 멀티 화상채팅이 가능합니다.
![멀티](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/dc8cb894-4f6c-4ec6-bb1f-b09942d1ab17)

  <br>
> ### *시험출제*
- 교수가 비대면 시험을 진행하기 위하여 pdf파일 형식으로 되어있는 시험지를 등록하면 pdfObject.js를 이용한 pdf파일 미리보기를 제공할 수 있습니다.
- 교수가 해당 시험지를 바라보며 문제의 답과 배점 및 선지수를 입력할 수 있다는 장점이 있습니다.
![시험출제 (2)](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/de6109fc-1398-4776-ac25-d5712810fc6f)

  <br>
> ### *시험응시*
- 교수가 출제한 시험을 응시할 수 있으며 해당 제한시간안에 풀지않으면 작성한 답안까지 자동 제출 및 채점 기능을 제공하며 마찬가지로 모든 답안을 작성후 제출하면 자동 채점이 되며 응시내역을 확인할 수 있습니다.
![시험응시](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/9cbe9bc9-0a4b-4969-bf72-fae3485be7a1)

  <br>
> ### *스터디원간 실시간 그룹채팅*
- 실시간 그룹채팅은 웹소켓 통신을 활용하여 해당 스터디의 스터디원들간 실시간으로 채팅이 가능하도록 한 기능입니다. 채팅방별 실시간 메시지 읽음처리기능과 안읽은 개수를 실시간으로 보여지도록 구현하였습니다.
![실시간채팅](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/6450587f-a6d8-40ac-aa4a-2344b70320ac)

  <br>
> ### *증명서 결제*
- 해당 학생에게 해당하는 증명서를 발급하기 위하여 카카오 API 결제를 이용하여 발급 할 수 있도록 구현하였습니다.
- 증명서 부분은 itext를 이용하여 학생에 대한 증명서를 pdf로 제작하여 미리보고 다운받을 수 있습니다.
![증명서결제](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/8fe25a4a-d9a1-40e3-ac6c-5b1dff051f1f)

  <br>
> ### *실시간 수강신청*
- 실시간 수강신청 기능은 웹소켓 통신을 활용하여 학생이 수강신청을 함에 있어 실시간으로 집계 되고 있는 수강신청 현황을 확인하면서 수강신청을 할 수 있다는 장점이 있습니다.
- 수강신청을 진행하면 수강신청 페이지에 있는 사람들은 잔여 수가 실시간으로 줄어드는 것을 확인할 수 있습니다.
![수강신청](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/587a9a04-f66f-4984-a3f1-b54b0b2d76c3)

  <br>
> ### *포털사이트 위젯 추가, 삭제, 배치 기능*
- gridstack.js를 이용하여 사용자의 편의성을 고려해 사용자가 원하는 웨짓을 보관함에 저장 및 추가가 가능하며 원하는 위치 배치를 직접할 수 있다는 장점이 있습니다.
![포틀릿2](https://github.com/pparkjs/HankukUniversity_project/assets/107859870/e161083f-1c2b-4865-bec0-85f6ce020fea)

  <br>
> ### *음성인식 이용항 페이지 이동 및 게시판 등록*
- 장애 및 팔을 다친 학생을 위하여 편의성을 제공하고자 해당 음성인식 기능을 이용하여 원하는 페이지로 이동 및 게시판을 등록할 수 있습니다.
 <br>
 <a href="https://youtu.be/zOPAZgUHY0w">음성인식 시연영상 보러가기</a>
