<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/certificate.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">증명서</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">증명서 발급</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">기본 정보</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="myInfo">
					학과:&nbsp;&nbsp;&nbsp;
					<input type="text" class="deptText" value="${std.deptNm }" disabled>
					학번:&nbsp;&nbsp;&nbsp;
					<input type="text" class="noText" value="${std.stdNo }" disabled>
					이름:&nbsp;&nbsp;&nbsp;
					<input type="text" class="nameText" value="${std.stdNm }" disabled>
					학년:&nbsp;&nbsp;&nbsp;
					<input type="text" class="yearText" value="${std.grade}" disabled>
					상태:&nbsp;&nbsp;&nbsp;
					<c:set value="${std.stdSttsCd}" var="sttsCd"/>
					<input type="text" class="semText" value="${std.stdSttsNm}" disabled>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid cc">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">유의 사항</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div>
					<span><h5>▶ 잠깐! 학교에 확인하셨나요?</h5></span>
					<span class="uu">졸업 증명서/성적 증명서와 같이 학기가 변경된 직후에 최신 내용이<span><br/>
					<span class="uu">업데이트 되는 증명서는 학교에서 전산 입력을 완료하였는지 발급 전 필히 확인하신 후 신청하시기 바랍니다.</span><br/><br/>

					<span><h5>▶ 문의 : 한국대학교 042-123-4567</h5></span>

					<span class="uu">목록에 없는 증명서는 학교 및 학적 상태에 따라 인터넷 발급이 불가한 증명서입니다. 발급 가능여부를 학교에 문의하시기 바랍니다.</span><br/><br/>

					<span><h5>▶ 이용기간 안내</h5></span>
					<span class="uu">전자증명서는 신청(결제)한 날로부터 30일간 다운로드가 가능합니다.</span><br/>
					<span class="uu">열람내역, 열람차단 설정은 신청(결제)한 날로부터 90일간 이용 가능하며, 이후 [증명서 발급 내역]에서 사라집니다.</span><br/><br/>

					<span><h5>▶ 취소/환불 규정</h5></span>
					<span class="uu">증명서 내용에 문제가 있는 경우 결제 후 30일 이내 취소/환불이 가능하며, 단순변심이나 사용자 과실에 의한 취소/환불은 불가합니다.</span><br/><br/>

					<span><h5>▶ 본 서비스를 통해 출력한 증명서는 원본증명서 입니다.</h5></span>
					
					<!-- <span><h5>▶ 증명서를 제출(전송)할 경우, 반드시 보안증명서 사용법 파일(.html)과 증명서 파일(.min)을 함께 제출(전송)해주십시요.</h5></span> -->
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid cc">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">증명서 발급</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="tb-wrap" style="font-size: 15px;">
					<table id="certifiTable" border="1">
						<thead>
							<tr>
								<td colspan="3" style="text-align: center; padding: 15px;">
									<div style="width: 40%; text-align: left; display: inline-block;">
										※ 여러가지 증명서를 한번에 신청할 수 없습니다. 한개씩 신청해 주세요.<br/>
										▶ 문의 : 한국대학교 042-123-4567
									</div>
								</td>
							</tr>
							<tr>
								<th>증명서</th>
								<th>금액</th>
								<th>신청</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${certifiList}" var="certifi">
								<tr>
									<input type="hidden" value="${certifi.ctfctNo}"/>
									<td>${certifi.ctfctNm}</td>
									<td>${certifi.ctfctAmt}원</td>
									<td><button type="button" class="btn btn-sm btn-danger" stat="1" style="width: 70px; background: #0070c0; border-color: #0070c0;" onclick="certificate(this)">신청</button></td>
								</tr>
							</c:forEach>
							<!-- <tr>
								<td>성적 증명서</td>
								<td>1000원</td>
								<td><button type="button" class="btn btn-sm btn-danger" stat="1" style="background: #0070c0; border-color: #0070c0;" onclick="scoreCertifi()">확인서 출력</button></td>
							</tr>
							<tr>
								<td>졸업 증명서</td>
								<td>1000원</td>
								<td><button type="button" class="btn btn-sm btn-danger" stat="1" style="background: #0070c0; border-color: #0070c0;" onclick="graduCertifi()">확인서 출력</button></td>
							</tr> -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
var IMP = window.IMP;
IMP.init('imp08611603');

function kakaoPay(param) {
    IMP.request_pay(
    	{
		    pg: "kakaopay",
		    pay_method: "card",
		    merchant_uid: param.merchant_uid,
		    // merchant_uid: "00003",
		    name: "[한국대학교]"+param.name,
		    amount: param.amount,
		    buyer_email: "hankukUni@hankuk.com",
		    buyer_name: "한국대학교 학생지원팀",
		    buyer_tel: "010-1234-5678",
		    buyer_addr: "대전광역시 강남구 삼성동",
		    buyer_postcode: "123-456",
    	},
		function (rsp) {
			// callback
			//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
			// console.log("rsp",rsp);
			// console.log("rsp.imp_uid",rsp.imp_uid);
			if(rsp.success) {
				// console.log("param",param);
				$.ajax({
					type: "POST",
					url: "/hku/payInfoInsert",
					data: JSON.stringify(param),
					dataType: "text",
					contentType: 'application/json;charset=UTF-8',
					beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
					success: function(res){
						swal({
							title: "결제 완료!",
							text: "증명서 보관함으로 이동합니다",
							icon: "success",
							buttons: true,
							dangerMode: true,
						})
						.then((willDelete) => {
							if (willDelete) {
								location.href = "/hku/certificate-list";
							} else {
								return false;
							}
						});
					},
					error: function(){
						alert("실패");
					}
				});
			}
		}
    );
}

function certificate(target){
	var ctfctNo = $(target).parents('tr').children().eq(0).val();
	// console.log("ctfctNo",ctfctNo);

	let payData = {
		"merchant_uid": nextCtfctisNo(),
		"name": "",
		"ctfctNo": ctfctNo,
		"amount": 0,
		"stdNo": "${std.stdNo }"
	};
	
	var sttsCd = "${sttsCd}";	// 학생 상태코드
	if(ctfctNo == "CTFCT001"){
		// console.log("재학증명서 클릭");
		payData.name = "재학증명서";
		payData.amount = 1000;
		
	} else if(ctfctNo == "CTFCT002"){
		// console.log("성적증명서 클릭");
		payData.name = "성적증명서";
		payData.amount = 2000;
		
	} else if(ctfctNo == "CTFCT003"){
		// console.log("졸업증명서 클릭");
		if(sttsCd != "stts04"){
			swal({
				title: "졸업자만 츨력가능합니다!",
				icon: "error"
			});
			return false;
		}
		payData.name = "졸업증명서";
		payData.amount = 1000;
	}
	// console.log("payData",payData);
	kakaoPay(payData);
}

function nextCtfctisNo(){
	let nextCtfctisNo = "";
	$.ajax({
		type: "GET",
		url: "/hku/nextCtfctisNo",
		dataType: "text",
		async: false,
		success: function(res){
			console.log("res",res);
			nextCtfctisNo = res;
		},
		error: function(){

		}
	});
	return nextCtfctisNo;
}

</script>