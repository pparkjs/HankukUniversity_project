<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content-body" style="min-height: 975px;">
<section class="content">
   <div class="container-fluid">
      <div class="row">
         <div class="col-md-12">
            <div class="card card-primary">
               <div class="card-header">
                  <h3 class="card-title" style="font-weight:bold; font-size:1.5em;">${noticeVO.lecntTtl}<input type="hidden" id="lecntNo" value="${noticeVO.lecntNo}"></h3>
                  <div class="card-tools">등록일 : ${noticeVO.lecntRegdate} 조회수 : ${noticeVO.lecntReadCnt}</div>
               </div>
               <form id="quickForm" novalidate="novalidate">
                  <div class="card-body" style="height:630px; font-size: 1.3em;">${noticeVO.lecntCn }</div>
                  <div class="card-footer bg-white">
                  <c:if test="${not empty noticeVO.fileList}">
                        <c:forEach items="${noticeVO.fileList}" var="file">
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
                           <c:if test="${empty noticeVO.fileList}">
                            <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
		                        <li>
		                        <span class="mailbox-attachment-icon"></span>
		                           <div class="mailbox-attachment-info">
		                              <a href="#" class="mailbox-attachment-name"> <i
		                                 class="fas fa-paperclip"></i> 첨부된 파일이 없습니다.
		                              </a> <span class="mailbox-attachment-size clearfix mt-1"> <span></span> <a href="#" download="#"> <span
		                                    class="btn btn-default btn-sm float-right"> 
		                                 </span>
		                              </a>
		                              </span>
		                           </div>
		                          </li>
                 			   </ul>
                           </c:if>
                           
                  </div>
                  <div class="card-footer" style="height:85px;" >
                 	<div style="float:right;">
                     <button type="button" id="canBtn" class="btn btn-primary">목록</button>
                     <button type="button" id="modifyBtn" class="btn btn-info">수정</button>
                     <button type="button" id="deleteBtn" class="btn btn-danger">삭제</button>
                  	</div>
                  </div>
               </form>
            </div>
         </div>
         <form action="/notice/delete.do" method="post" id="noticeForm">
            <input type="hidden" name="boNo" value="${notice.boNo }"/>
         </form>
         <div class="col-md-6"></div>
      </div>
   </div>
   </section>
</div>

<script>
// $(function(){
// 	CKEDITOR.replace("noticeCn",{
// 		footnotesPrefix : "a"
// 	});
// }
	var lecntNo = $('#lecntNo').val();

$('#modifyBtn').click(function(){
	
	location.href="/hku/professor/noticemodForm/"+lecntNo;
	
})

$('#canBtn').click(function(){
	location.href="/hku/professor/noticeList";
})
$('#deleteBtn').click(function(){
	location.href="/hku/professor/deleteNotice/"+lecntNo;
})

</script>