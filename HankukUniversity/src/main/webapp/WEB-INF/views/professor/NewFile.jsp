<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="content">
   <div class="container-fluid">
      <div class="row">
         <div class="col-md-12">
            <div class="card card-primary">
               <div class="card-header">
                  <h3 class="card-title">${notice.boTitle} </h3>
                  <div class="card-tools">${notice.boWriter } ${notice.boDate } ${notice.boHit }</div>
               </div>
               <form id="quickForm" novalidate="novalidate">
                  <div class="card-body">${notice.boContent }</div>
                  <div class="card-footer bg-white">
                     <ul
                        class="mailbox-attachments d-flex align-items-stretch clearfix">
                        <li><span class="mailbox-attachment-icon"> <i
                              class="far fa-file-pdf"></i>
                        </span>
                           <div class="mailbox-attachment-info">
                              <a href="#" class="mailbox-attachment-name"> <i
                                 class="fas fa-paperclip"></i> 파일명
                              </a> <span class="mailbox-attachment-size clearfix mt-1"> <span>파일
                                    Fancy사이즈 KB</span> <a href="다운로드 url"> <span
                                    class="btn btn-default btn-sm float-right"> <i
                                       class="fas fa-download"></i>
                                 </span>
                              </a>
                              </span>
                           </div></li>
                     </ul>
                  </div>
                  <div class="card-footer">
                     <button type="button" id="btnList" class="btn btn-primary">목록</button>
                     <button type="button" id="btnModify" class="btn btn-info">수정</button>
                     <button type="button" id="btnDelete" class="btn btn-danger">삭제</button>
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
<script>
$(function(){
   var btnList = $("#btnList");
   var btnModify = $("#btnModify");
   var btnDelete = $("#btnDelete");
   var noticeForm = $("#noticeForm");
   
   // 목록 버튼 클릭시 이벤트
   btnList.on("click", function(){
      location.href="/notice/list.do";
   })
   
   // 수정 버튼 클릭시 이벤트
   btnModify.on("click", function(){
      noticeForm.attr("method", "get");
      noticeForm.attr("action", "/notice/update.do");
      noticeForm.submit();
   })
   
   // 삭제 버튼 클릭시 이벤트
   btnDelete.on("click", function(){
      if(confirm("정말 삭제하시겠습니까?")){
         noticeForm.submit();
      }
   })
   
})
</script>
</body>
</html>