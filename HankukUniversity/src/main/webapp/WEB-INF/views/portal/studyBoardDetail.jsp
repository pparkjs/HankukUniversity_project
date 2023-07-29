<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
</style>

<div class="container-fluid mt-3">
    <div class="row" style="background: white; padding: 10px; height: 847px;">
    	<div class="col-xl-12 mb-3">
            <h2><c:out value="${studyBoard.stboTitle }"/></h2>
            <input type="hidden" name="stboNo" id="stboNo" value="<c:out value="${studyBoard.stboNo }"/>">
        </div>
        <hr>
        <div class="col-xl-12 mb-3">
            <div class="row">
                <div class="col-xl-4 mb-1" style="width: 25%;">
                    <p>● 등록일 : <c:out value="${studyBoard.stboRegdate }"/></p>
                </div>
                <div class="col-xl-4 mb-1" style="width: 25%;">
                    <p>● 스터디장 : <c:out value="${studyBoard.stboWriter }"/></p>
                </div>
                <div class="col-xl-4 mb-1" style="width: 25%;">
                    <p>● 인원 : <c:out value="${studyBoard.count }/${studyBoard.studyCpcy }"/></p>
                </div>
                <div class="col-xl-4 mb-1" style="width: 25%;">
                    <p>● 조회수 : <c:out value="${studyBoard.stboReadCnt }"/></p>
                </div>
            </div>
        </div>
        <hr>
    	<div class="col-xl-12 mb-3" style="height: 570px; overflow: auto;">
           ${studyBoard.stboContent }
        </div>
        <hr>
    	<div class="col-xl-12 mb-3">
    		<c:forEach items="" var="file">
    			<div class="mailbox-attachment-info">
					<a href="/download${file.filePath}" download="${file.fileOrgnlFileNm}" class="mailbox-attachment-name fileDown">
						<i class="fas fa-paperclip"></i> &nbsp;${file.fileOrgnlFileNm} &nbsp;[${file.fileSize}]
					</a>
				</div>
    		</c:forEach>
        </div>
        <div class="col-xl-12 mb-3">
            
                <div class="col-xl-10 mb-1" style="display: flex; justify-content: end; margin-right: 0px;">
                    <button class="btn btn-primary" id="listBtn" style="margin: 5px;">목록</button>
                    <c:choose>
	                	<c:when test="${studyBoard.stdNo eq stdNo }">
		                    <button class="btn btn-primary" id="listBtn" style="margin: 5px;" onclick="openModal()">수정</button>
		                    <button class="btn btn-primary" id="listBtn" style="margin: 5px;" onclick="delBoard()">삭제</button>          	
	                	</c:when>
	                	<c:otherwise>           	
		                	<button type="button" class="btn btn-primary" style="margin: 5px;" data-bs-toggle="modal" data-bs-target="#basicModal">가입신청</button>
	                	</c:otherwise>
	                </c:choose>     
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
	            		<input type="hidden" name="studyNo" id="studyNo3" value="${studyBoard.studyNo }">
	            		<input type="hidden" name="stdNo" id="stdNo" value="${studyBoard.stdNo }">
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
	                <c:choose>
	                	<c:when test="${studyBoard.stdNo eq stdNo }">
            	
	                	</c:when>
	                	<c:otherwise>
			                <button type="button" class="btn btn-primary" onclick="intoStudy()">가입신청</button>                	
	                	</c:otherwise>
	                </c:choose>          
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true" id="detailModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="font-weight: bold;">게시판 수정</h5>
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
								<input type="text" name="stboTitle" id="stboTitle2" value="${studyBoard.stboTitle }" class="form-control" id="validationCustom01" required>
							</div>
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom04">
									작성자 <span class="text-danger"></span>
								</label>
								<input  name="stboWriter" id="stboWriter2" class="form-control" id="validationCustom01" value="${studyBoard.stboWriter }" readonly="readonly" required>
							</div>
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom04">
									내용 <span class="text-danger"></span>
								</label>
								<textarea name="stboContent" id="stboContent2" class="form-control h-50" id="validationCustom04" rows="6"required>${studyBoard.stboContent }</textarea>
								<div class="invalid-feedback">
								</div>
							</div>
							<!-- 파일 이미지  -->
							<div class="row previewFile"></div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer" id="btnDiv">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" onclick="modifyStudyBoard()" id="btn2">수정</button>
				<button type="button" class="btn btn-primary" onclick="delBoard()" id="btn3">삭제</button>
			</div>
		</div>
	</div>
</div>

</div>
<script>

function openModal() {
    $('#detailModal').modal('show');
}
function closeModal() {
    $('#detailModal').modal('hide');
}

var listBtn = document.querySelector('#listBtn');

listBtn.addEventListener('click', ()=>{
    location.href = "/hku/student/studyBoard";
});
    
function intoStudy(){
	var aModal = $("#basicModal");
	
	var modalForm = document.forms.frm3;
	
	var studyNo = modalForm.studyNo3.value;
	var joinReason = modalForm.joinReason.value;
	
	var stdNo = modalForm.stdNo.value;
	var sessStdNo = ${sessionScope.std.stdNo};
	
	if(stdNo == sessStdNo){
		swal({
			title: "본인의 스터디에는 가입신청 할 수 없습니다.", 
			icon: "error"
		});
		return false;
	}

	var data = {
		"studyNo": studyNo,
		"joinReason": joinReason
		}

	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/student/intoStudy",true);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
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

function delBoard() {
    var stboNo = document.getElementById("stboNo").value;
	console.log("stdNo",stboNo);
    var stboNo = {
        "stboNo": stboNo
    };

    $.ajax({
        type: "POST",
        data: stboNo,
        url: "/hku/student/deleteStudyBoard",
        beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
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
	            location.href = "/hku/student/studyBoard";
	       	}
        
    });
}

function modifyStudyBoard(){
	var dModal = $("#detailModal");
	
	var modalForm = document.forms.frm2;
	
	var stboTitle = modalForm.stboTitle2.value;
	var stboContent = modalForm.stboContent2.value;
	var stboNo = document.getElementById("stboNo").value;

	var data = {
		"stboTitle": stboTitle,
		"stboContent": stboContent,
		"stboNo": stboNo
		}

	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/student/modifyStudyBoard",true);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
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
	   		closeModal();
		}
	}
	xhr.send(JSON.stringify(data));
	location.href = "/hku/student/studyBoard";
}


</script>



