<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-body">
	<div class="container-fluid">
		<!-- row -->
		<div class="row">
			<form id="insertFrm" method="post" action="/hku/professor/insertNotice" enctype="multipart/form-data" class="col-xl-12 col-xxl-12">
				<c:if test="${not empty notice }">
					<input type="hidden" value="${notice.lecntNo}" name="lecntNo">
				</c:if>
				<div class="card">
					<div class="card-header">
					<c:if test="${empty notice}">
						<h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">${subNm} 공지사항  글등록</h4>
						<button type="button" 
						style="padding: 0.5rem 1.0rem; width: 80px; "
						class="btn btn-primary regBtn">등록</button>
					</c:if>
					<c:if test="${not empty notice}">
						<h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">${subNm} 공지사항  글수정</h4>
						<button type="button" 
						style="padding: 0.5rem 1.0rem; width: 80px; "
						class="btn btn-primary modBtn">수정</button>
					</c:if>
					</div>
					<div class="card-body">
					<div class="mb-3">
                         <label class="form-label">제목</label>
                         <input type="text" class="form-control" name="lecntTtl" id="lecntTtl" value="${notice.lecntTtl}" placeholder="제목을 입력하세요.">
                     </div>
                     <label class="form-label">내용</label>
                     <textarea class="form-txtarea form-control" rows="25" name="lecntCn" id="lecntCn" style="resize:none;" > ${notice.lecntCn} </textarea>
						<br>
						<div class="mb-3">
						<c:if test="${not empty notice.fileList}">
                        <c:forEach items="${notice.fileList}" var="file">
                     <ul
                        class="mailbox-attachments d-flex align-items-stretch clearfix">
                        <li><span class="mailbox-attachment-icon"> 
                        </span>
                           <div class="mailbox-attachment-info">
                              <a href="/download${file.filePath}" class="mailbox-attachment-name" download="${file.fileOrgnlFileNm}"> <i
                                 class="fas fa-paperclip"></i>${file.fileOrgnlFileNm}
                              </a> <span class="mailbox-attachment-size clearfix mt-1"> <span>${file.fileSize}</span> <a href="/download${file.filePath}" download="${file.fileOrgnlFileNm}"> <span
                                    class="btn btn-default btn-sm float-right"> <i
                                       class="fas fa-download"></i>
                                 </span>
                              </a>
                              </span>
                           </div>
                           </li>
                     </ul>
                           </c:forEach>
                           </c:if>
						  <label for="formFile" class="form-label"  >첨부파일을 선택하세요.</label>
						  <input class="form-control" type="file" id="formFile" name="attchNotice"  multiple="multiple">
						</div>
						<div style="display: flex; float:right;" >
						<button type="button" 
						style="padding: 0.5rem 1.0rem; width: 80px; margin-right: 5px; "
						class="btn btn-primary" id="canBtn">목록</button>
						<c:if test="${empty notice}">
						<button type="button" 
						style="padding: 0.5rem 1.0rem; width: 80px; "
						class="btn btn-primary regBtn">등록</button>
						</c:if>
						<c:if test="${not empty notice}">
						<button type="button" 
						style="padding: 0.5rem 1.0rem; width: 80px; "
						class="btn btn-primary modBtn">수정</button>
						</c:if>
						</div>
					</div>
				</div>
				<input type="hidden" name="lecntWriter" value="${pro.proNm}">
				<input type="hidden" name="lecapNo" value="${lecapNo}">
			</form>
		</div>
	</div>
</div>
<script>
// $(function(){
// 	CKEDITOR.replace("noticeCn",{
// 		footnotesPrefix : "a"
// 	});
// }

$('.regBtn').click(function(){
	var insertFrm = $('#insertFrm');
	var lecntTtl = $('#lecntTtl').val();
	console.log(lecntTtl);
	var lecntCn = $('#lecntCn').val();
	
	if(lecntTtl == '' || lecntTtl == null){
		 swal("확인요청!", "제목이 입력되지않았습니다.", "warning");
		 lecntTtl.focus();
		 return false;
	}
	if(lecntCn == '' || lecntCn == null){
		 swal("확인요청!", "내용 입력되지않았습니다.", "warning");
		 lecntTtl.focus();
		 return false;
	}
	
	insertFrm.submit();
	
})

$('.modBtn').click(function(){
	var insertFrm = $('#insertFrm');
	var lecntTtl = $('#lecntTtl').val();
	console.log(lecntTtl);
	var lecntCn = $('#lecntCn').val();
	
	if(lecntTtl == '' || lecntTtl == null){
		 swal("확인요청!", "제목이 입력되지않았습니다.", "warning");
		 lecntTtl.focus();
		 return false;
	}
	if(lecntCn == '' || lecntCn == null){
		 swal("확인요청!", "내용 입력되지않았습니다.", "warning");
		 lecntTtl.focus();
		 return false;
	}
	insertFrm.attr("action","/hku/professor/updateNotice");
	insertFrm.submit();
	
})

$('#canBtn').click(function(){
	location.href="/hku/professor/noticeList";
})

</script>