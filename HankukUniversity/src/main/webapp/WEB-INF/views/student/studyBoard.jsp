<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">스터디 게시판</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-body">
				<div class="basic-form">
					<form class="row g-3 custom-form" action="">
						<div class="col-md-2">
						   <select class="default-select form-control" id="stype">
							  <option value="">선택</option>
							  <option value="title">제목</option>
							  <option value="writer">작성자</option>
						   </select>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control input-default" placeholder="검색어를 입력해주세요" id="sword">
						</div>
						<input type="hidden" name="page" id="page">
						<div class="col-auto">
							<button type="button" class="btn btn-primary" id="searchBtn" onclick="">검색</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">글쓰기</button>
						</div>	
					 </form>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table id="example" class="table" style="min-width: 845px">
						<thead class="thead-dark">
							<tr>
								<th>제목</th>
								<th>작성자</th>
								<th>스터디명</th>								
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody id="boardBody" class="pagination-content">
						
						</tbody>
					</table>
				</div>
			</div>
			<div class="card-body" id="pageNation">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
var boardBody = document.querySelector("#boardBody");
$(document).ready(function() {
    boardList();
});

function boardList() {
    var body = $("#boardBody");
    $.ajax({
        type: "get",
        url: "/hku/student/studyBoardList",
        dataType: "json",
        success: function(res) {
            console.log("res: ", res);
            
            var data = '';
            for (var i = 0; i < res.length; i++) {
                data += `<tr>
                            <td id="\${res[i].stboNo}" onclick="boardDetail(this)" style="padding: 12px;">\${res[i].stboTitle}</td>
                            <td id="\${res[i].stboNo}" onclick="boardDetail(this)" style="padding: 12px;">\${res[i].stboWriter}</td>
                            <td id="\${res[i].stboNo}" onclick="boardDetail(this)" style="padding: 12px;">\${res[i].studyName}</td>
                            <td id="\${res[i].stboNo}" onclick="boardDetail(this)" style="padding: 12px;">\${res[i].stboRegdate}</td>
                            <td id="\${res[i].stboNo}" onclick="boardDetail(this)" style="padding: 12px;">\${res[i].stboReadCnt}</td>
                        </tr>`;
            }
            body.html(data);
        }
    });
}

function boardDetail(element) {
    var tdId = $(element).attr("id");
    var stboNo = {
        "stboNo": tdId
    };
    console.log("id:", tdId);
    openModal();

    $.ajax({
        type: "get",
        data: stboNo,
        url: "/hku/student/studyBoardDetail",
        dataType: "json",
        success: function(res) {
            console.log("res: ", res);

            $("#stboNo2").val(res.stboNo);
            $("#stboWriter2").val(res.stboWriter);
            $("#stboTitle2").val(res.stboTitle);
            $("#stboContent2").val(res.stboContent);
            $("#studyNo3").val(res.studyNo);
		    boardList();
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

function openModal() {
    $('#detailModal').modal('show');
}
function closeModal() {
    $('#detailModal').modal('hide');
}


</script>

<div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true" id="detailModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="font-weight: bold;">스터디 모집 게시판</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal">
				</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="" name="">
				<div class="basic-form" id="regDiv">
					<div class="form-validation">
						<form class="needs-validation" id="frm2" name="frm2" enctype="multipart/form-data" method="post">
							<input type="hidden" name="stboNo" id="stboNo2" >
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom01">
									제목 <span class="text-danger"></span>
								</label>
								<input type="text" name="stboTitle" id="stboTitle2" class="form-control" id="validationCustom01" required>
							</div>
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom04">
									작성자 <span class="text-danger"></span>
								</label>
								<input  name="stboWriter" id="stboWriter2" class="form-control" id="validationCustom01" value="" readonly="readonly" required>
							</div>
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom04">
									내용 <span class="text-danger"></span>
								</label>
								<textarea name="stboContent" id="stboContent2" class="form-control h-50" id="validationCustom04" rows="6"required></textarea>
								<div class="invalid-feedback">
								</div>
							</div>
							<!-- 파일 이미지  -->
							<div class="row previewFile"></div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" onclick="modifyStudyBoard()" id="btn2">수정</button>
				<button type="button" class="btn btn-primary" onclick="delBoard()" id="btn3">삭제</button>
				<button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal" data-bs-target="#basicModal">가입신청</button>
			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="basicModal" style="display: none;" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">스터디 가입신청</h5> 
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
            	<form action="" name="frm3">
            		<input type="hidden" name="studyNo" id="studyNo3">
            		<div class="mb-3">
						<label class="col-lg-4 col-form-label" for="validationCustom04">
							자기소개 <span class="text-danger"></span>
						</label>
						<textarea name="joinReason" id="joinReason" class="form-control h-50" id="validationCustom04" rows="3"required></textarea>
						<div class="invalid-feedback">
						</div>
					</div>
            	</form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="intoStudy()">가입신청</button>
            </div>
        </div>
    </div>
</div>
<script>
function delBoard() {
    var dModal = $("#detailModal");

    var mForm = document.forms.frm2;
    var no = mForm.stboNo2.value;
    var stboWriter = mForm.stboWriter2.value;

    var stboNo = {
        "stboNo": no
    };

    $.ajax({
        type: "POST",
        data: stboNo,
        url: "/hku/student/deleteStudyBoard",
        dataType: "json",
        success: function(res) {
            console.log("res: ", res);
	            if(res>0){
	            	swal({
						title: "삭제되었습니다.", 
						icon: "success"
					});
	            }else{
	            	swal({
	        			title: "삭제실패!", 
	        			icon: "error"
	        		});
	            }
	   		boardList();
	   		closeModal();
	       	}
    });
}

function modifyStudyBoard(){
	var dModal = $("#detailModal");
	
	var modalForm = document.forms.frm2;
	
	var stboTitle = modalForm.stboTitle2.value;
	var stboContent = modalForm.stboContent2.value;
	var stboNo = modalForm.stboNo2.value;

	var data = {
		"stboTitle": stboTitle,
		"stboContent": stboContent,
		"stboNo": stboNo
		}

	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/student/modifyStudyBoard",true);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText === "SUCCESS"){
				console.log("");
				 swal({
						title: "게시글 수정이 완료되었습니다.", 
						icon: "success"
					});
			} else if(xhr.responseText === "FAILED"){
				swal({
        			title: "게시글 수정에 실패하였습니다!", 
        			icon: "error"
        		});
			}
			boardList();
	   		closeModal();
		}
	}
	xhr.send(JSON.stringify(data));
}

function intoStudy(){
	var aModal = $("#basicModal");
	
	var modalForm = document.forms.frm3;
	
	var studyNo = modalForm.studyNo3.value;
	var joinReason = modalForm.joinReason.value;

	var data = {
		"studyNo": studyNo,
		"joinReason": joinReason
		}

	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/student/intoStudy",true);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText === "SUCCESS"){
				console.log("");
				 swal({
						title: "가입신청이 완료되었습니다.", 
						icon: "success"
					});
			} else if(xhr.responseText === "FAILED"){
				swal({
        			title: "가입신청에 실패하였습니다!", 
        			icon: "error"
        		});
			}
			boardList();
			$('#basicModal').modal('hide');
		}
	}
	xhr.send(JSON.stringify(data));
}

</script>