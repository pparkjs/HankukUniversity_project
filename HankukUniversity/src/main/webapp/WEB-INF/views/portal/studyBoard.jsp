<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/css/student/study-pjs.css">
<style>
.row{
    margin-right: calc(-36.5 * var(--bs-gutter-x));
}
#mainDiv{
    width: 995px;
    margin-left: -40px;
    margin-top: 15px;
}
</style>
	<div class="container-fluid" id="mainDiv">
		<div class="card" id="card-title-1" style="height: 850px;">
			<div style="margin-top: 20px; margin-left: 30px;">
				<div class="basic-form">
					<form class="row g-3 custom-form" action="" style="margin-left: 140px;">
						<div class="col-md-2">
						   <select class="default-select form-control" id="stype">
							  <option value="">선택</option>
							  <option value="title">스터디명</option>
							  <option value="writer">작성자</option>
						   </select>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control input-default" placeholder="검색어를 입력해주세요" id="sword">
						</div>
						<input type="hidden" name="page" id="page">
						<div class="col-auto">
							<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">글쓰기</button>
						</div>	
					 </form>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive" style="height: 683px;">
					<div class="row" id="boardList" style="width: 100%; margin: 10px; margin-right: -10px;">
					
						<div class="studycard-wrap">
							<div class="study-top">
								<span class="study-text">[ 스터디명 : </span>
								<div class="study-name">정처기스터디 ]</div>
							</div>
							<hr>
							<div class="study-title">정처기 스터디 같이 하실 분??</div>
							<hr>
							<div class="study-bottom">
								<div class="bottom1">
									<span class="date-text">작성일 :</span>
									<div class="reg-date">2023-05-10</div>
									<div>
										<button class="end-button">모집완료</button>
									</div>
								</div>
								<div class="bottom2">
									<img alt="" src="/images/왕관.png" class="crownImg">
									<div class="master-name">박정수</div>
									<div class="hit-con">
										<img alt="" src="/images/조회수.png" class="hitImg">
										<div class="study-hit">0</div>
										<div class="cnt-text">정원 :</div>
										<div class="study-cnt">6 / 6</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="studycard-wrap">
							<div class="study-top">
								<span class="study-text">[ 스터디이름 : </span>
								<div class="study-name">정처기스터디 ]</div>
							</div>
							<hr>
							<div class="study-title">정처기 스터디 같이 하실 분??</div>
							<hr>
							<div class="study-bottom">
								<div class="bottom1">
									<span class="date-text">작성일 :</span>
									<div class="reg-date">2023-05-10</div>
									<div>
										<button class="ing-button">모집중</button>
									</div>
								</div>
								<div class="bottom2">
									<img alt="" src="/images/왕관.png" class="crownImg">
									<div class="master-name">박정수</div>
									<div class="hit-con">
										<img alt="" src="/images/조회수.png" class="hitImg">
										<div class="study-hit">0</div>
										<div class="cnt-text">정원 :</div>
										<div class="study-cnt">2 / 6</div>
									</div>
								</div>
							</div>
						</div>
				
						
					</div>
				</div>
			</div>
			<div class="card-body" id="pageNation" style="margin-top: -12px;">
                 <nav>
                     <ul class="pagination pagination-xs">
                         <li class="page-item page-indicator">
                             <a class="page-link" href="javascript:void(0)">
                             <i class="la la-angle-left"></i></a>
                         </li>
                         <li class="page-item active">
                             <a class="page-link" href="javascript:void(0)">1</a>
                         </li>
                         <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                         <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                         <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>
                         <li class="page-item page-indicator">
                             <a class="page-link" href="javascript:void(0)">
                             <i class="la la-angle-right"></i></a>
                         </li>
                     </ul>
                 </nav>
             </div>
		</div>
	</div>

<!-- modal -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true" id="addModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="font-weight: bold;">스터디 모집 게시판</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal">
				</button>
			</div>
			<div class="modal-body">
				<div class="basic-form" id="regDiv">
					<div class="form-validation">
						<form class="needs-validation" id="frm1" name="frm1" enctype="multipart/form-data" method="post">
							<div class="mb-3">
								<input type="hidden" name="stboWriter" id="stboWriter" class="form-control" id="validationCustom01" value="${stdNm }" required>
							</div>
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom01">
									제목 <span class="text-danger">*</span>
								</label>
								<input type="text" name="stboTitle" id="stboTitle" class="form-control" id="validationCustom01" placeholder="제목을 입력하세요." required>
								<div class="invalid-feedback">
									제목을 입력해주세요.
								</div>
							</div>
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom04">
									내용 <span class="text-danger">*</span>
								</label>
								<textarea name="stboContent" id="stboContent" class="form-control h-50" id="validationCustom04" rows="5" placeholder="내용을 입력하세요." required></textarea>
								<div class="invalid-feedback">
									내용을 입력해주세요.
								</div>
							</div>
							<div class="col-xl-6 mb-3">
								<label class="form-label mt-3">스터디선택<span class="text-danger">*</span></label>
								<div class="input-group">
									<select class="default-select form-control" name=studyNo>
									<option value="" >스터디 선택</option>
									 <c:choose>
								 		<c:when test="${empty myStudy}">
											<option value="" >보유중인 스터디가 없습니다.</option>
										</c:when>
										<c:otherwise>
											<c:forEach items="${myStudy }" var="study">
												<option value="${study.studyNo }" >${study.studyName }</option>
											</c:forEach>
										</c:otherwise>
									 </c:choose>
						           </select>
								</div>
							</div>
							<div class="mb-3">
								<input class="form-control form-control-sm" id="atchFileNo" type="file" multiple>
							</div>
							<!-- 파일 이미지  -->
							<div class="row previewFile"></div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" onclick="insertBoard()" id="btn1">등록</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var sendData = {};
function boardDetail(element) {
    var stboNo = $(element).attr("id");
    var sessStdNo = ${sessionScope.std.stdNo};
    console.log("id:", stboNo);
	location.href = `/hku/student/studyBoardDetail?stboNo=\${stboNo}`
}


function boardList() {
	
// 	let stype = $('#stype').val();
//     let sword = $('#sword').val();
//     let page = $('#page').val();
    
    sendData.stype = $('#stype').val();
	sendData.sword = $('#sword').val();
	sendData.page = $('#page').val();
    
	console.log(sendData);
    
    
    var body = $("#boardList");
    $.ajax({
        type: "get",
        url: "/hku/student/studyBoardList",
        dataType: "json",
        contentType: 'application/json;charset=utf-8',
        data: sendData,
        success: function(res) {
            console.log("res: ", res);
            var stdBoardList = res.dataList;
            
            var data = '';
            for (var i = 0; i < stdBoardList.length; i++) {
            	const regDate = `\${stdBoardList[i].stboRegdate}`;
            	const splitDate = regDate.split(" ")[0];
            	console.log("splitDate", splitDate);
            	console.log("stdBoardList",stdBoardList);
                data += `
	                	<div class="studycard-wrap" id="\${stdBoardList[i].stboNo}" onclick="boardDetail(this)">
							<div class="study-top">
								<span class="study-text">[ 스터디이름 : </span>
								<div class="study-name">\${stdBoardList[i].studyName} ]</div>
							</div>
							<hr>
							<div class="study-title">\${stdBoardList[i].stboContent}</div>
							<hr>
							<div class="study-bottom">
								<div class="bottom1">
									<span class="date-text">작성일 :</span>
									<div class="reg-date"> \${splitDate} </div>
									<div>`;
				if(stdBoardList[i].count < stdBoardList[i].studyCpcy){
					data +=	`<button class="ing-button">모집중</button>`		
				}else{
					data +=	`<button class="end-button">모집완료</button>`							
				}					
				data +=		`</div>
								</div>
								<div class="bottom2">
									<img alt="" src="/images/왕관.png" class="crownImg">
									<div class="master-name">\${stdBoardList[i].stboWriter}</div>
									<div class="hit-con">
										<img alt="" src="/images/조회수.png" class="hitImg">
										<div class="study-hit">\${stdBoardList[i].stboReadCnt}</div>
										<div class="cnt-text">정원 :</div>
										<div class="study-cnt">\${stdBoardList[i].count}/\${stdBoardList[i].studyCpcy}</div>
									</div>
								</div>
							</div>
						</div>
                        `;
            }
            body.html(data);
			pageNation.html(res.pagingHTML);
			
	        }
	    });
	}

function insertBoard(){
	var addModal = $("#addModal");
	
	var modalForm = document.forms.frm1;
	
	var stboTitle = modalForm.stboTitle.value;
	var stboContent = modalForm.stboContent.value;
	var studyNo = modalForm.studyNo.value;
	var stboWriter = modalForm.stboWriter.value;


	if(stboTitle == ""){
		swal({
			title: "제목을 입력하지 않았습니다!", 
			icon: "error"
		});
		return false;
	}
	if(stboContent == ""){
		swal({
			title: "내용을 입력하지 않았습니다!", 
			icon: "error"
		});
		return false;
	}
	if(studyNo == ""){
		swal({
			title: "스터디를 선택해주세요!", 
			icon: "error"
		});
		return false;
	}

	var data = {
		"stboTitle": stboTitle,
		"stboContent": stboContent,
		"studyNo": studyNo,
		"stboWriter": stboWriter,
		}

	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/student/insertStudyBoard",true);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText === "SUCCESS"){
				console.log("");
				addModal.modal('hide');
				 swal({
						title: "게시글 등록이 완료되었습니다.", 
						icon: "success"
					});
			} else if(xhr.responseText === "FAILED"){
				swal({
        			title: "게시글 등록에 실패하였습니다!", 
        			icon: "error"
        		});
			}
			boardList();
		}
	}
	xhr.send(JSON.stringify(data));
}


$(document).ready(function() {
	var boardBody = document.querySelector("#boardList");
	var pageNation = $('#pageNation');
    
   
	boardList();
		
	$('#searchBtn').on('click',function(){
		boardList();
	});
	
	// 페이징
	pageNation.on('click','a',function(event){
		event.preventDefault();
		pageNo = $(this).data('page'); // 페이지 번호 날라옴
		$('#page').val(pageNo);
		console.log("페이지번호 클릭", $('#page').val());
		boardList();
	});
	
});
</script>