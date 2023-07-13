<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">


<div class="content-body">
	<!-- row -->
	<div class="container-fluid">
		<div class="col-xl-6 col-lg-6 bbb" style="width: 100%; height: 100%;">
			<div class="card">
				<div class="card-header aaa">
					<h4 class="card-title" 
						style="font-weight: bold; font-size: 1.2em; color: #800000;">
						苞力包府</h4>
				</div>
				<button type="button" id="regBtn"
					style="padding: 0.6rem 1.0rem; width: 80px; padding-top: 10px; margin-top: 15px; margin-left: 93.5%"
					class="btn btn-primary">殿废</button>
				<div class="card-body ccc" style="padding-top: 0;">
					<table class="table">
						<thead>
							<tr>
								<th>No</th>
								<th>累己磊</th>
								<th>力格</th>
								<th>累己老</th>
							</tr>
						</thead>
						<tbody id="tbtb">
							<c:forEach items="${list }" var="list" varStatus="status"> 
							<tr class="tbtr" onClick="location.href=/hku/professor/assignmentDetail">
								<td class="">${status.index + 1}</td>
								<td class="">${pro.proNm }</td>
								<td class="">${list.asmTtl }</td>
								<td class="">${list.asmRegdate }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

regBtn.addEventListener("click", function(){
	location.href = "/hku/professor/regiAssignment";
})

.tbtr("click", fucntion(){
 	var num = $(this).attr("number");
 	location.href = "/hku/professor/assignmentDetail?" + num;
})



</script>