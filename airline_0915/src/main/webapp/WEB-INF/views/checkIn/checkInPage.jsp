<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="KO">
<head>

<link href="../resources/css/header.css" rel="stylesheet">
<link href="../resources/css/reset.css" rel="stylesheet">
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css"
	href="https://flyasiana.com/C/pc/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="https://flyasiana.com//C/pc/css/layout.css">
<link rel="stylesheet" type="text/css"
	href="https://flyasiana.com//C/pc/css/common.css">
<link rel="stylesheet" type="text/css"
	href="https://flyasiana.com//C/pc/css/flyasiana.css">
<link rel="stylesheet" type="text/css"
	href="https://flyasiana.com//C/pc/css/calendar.css">
<link rel="stylesheet" type="text/css"
	href="https://flyasiana.com//C/pc/css/corp.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../resources/css/checkIn/checkIn.css" rel="stylesheet">
<title>EVERY AIR / Check in</title>
<body>
	<c:import url="../layout/header.jsp" />
	<!-- util_wrap -->
	<div class="container" id="container">
		<h3>카드 검색</h3>

		<div class="title_wrap_type3">
			<h4>조회</h4>
		</div>
		<ul class="list_type3">
			<li>카드정보를 입력하시면 회원님께 맞는 할인정보를 확인 가능합니다.</li>
			<li>팝업 차단 해제 후 이용해주시기 바랍니다.</li>
		</ul>
		<div class="search_box mar_to10">
			<form id="frm" action="./search/searchCardPage" method="post">
				<div class="inner alC">
					<!-- <select id="numTypeSelect" style="width: 200px" title="종류별 번호">
						<option value="reservNo">카드사명들</option>
					</select>  -->
					<select name="cardTypeSelect" style="width: 300px" id="card_list">
						<option value="card1">BC카드</option>
						<option value="card2">KB국민카드</option>
						<option value="card3">삼성카드</option>
						<option value="card4">신한카드</option>
						<option value="card5">하나카드</option>
						<option value="card6">롯데카드</option>
						<option value="card7">현대카드</option>
						<option value="card8">NH농협카드</option>
					</select> 
					<select name="airPortSelect" style="width: 200px" id="airPort_list">
						<option value="KE/대한항공/1">대한항공</option>
						<option value="OZ/아시아나항공/2">아시아나항공</option>
						<option value="7C/제주항공/3">제주항공</option>
						<option value="LJ/진에어항공/4">진에어항공</option>
						<option value="BX/에어부산항공/5">에어부산항공</option>
						<option value="RS/에어서울/6">에어서울</option>
						<option value="TW/티웨이항공/7">티웨이항공</option>
						<option value="4V/플라이강원/8">플라이강원</option>
						<option value="RF/에어로케이항공/9">에어로케이항공</option>
					</select>
					<!-- <input type="text" id="bookingNum" name="bookingNum" maxlength="8"
						placeholder=""
						title="카드사별 카드상품"
						style="width: 280px; text-transform: uppercase;"> -->


					
					<button type="button" id="btn_search" class="btn_M red">조회하기</button>
				</div>
			</form>
		</div>


		<div id="div_captcha" style="display: none;">

			<div id="g-recaptcha" class="g-recaptcha"
				style="display: inline-block;">
				<div style="width: 304px; height: 78px;">
					<div>
						<iframe
							src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6LcyoDwUAAAAAG42mLWkJPNAs35QRLvnl2O0xOCJ&amp;co=aHR0cHM6Ly9mbHlhc2lhbmEuY29tOjQ0Mw..&amp;hl=ko&amp;v=A1Aard-wURuGsXRGA7JMOqVO&amp;size=normal&amp;cb=vf1g44civ4lq"
							width="304" height="78" role="presentation" name="a-sqpi35n32am6"
							frameborder="0" scrolling="no"
							sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox"></iframe>
					</div>
					<textarea id="g-recaptcha-response" name="g-recaptcha-response"
						class="g-recaptcha-response"
						style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
				</div>
			</div>

		</div>

		<p class="col_brown">
			* 회원 로그인 후 카드 정보 조회를 할 수 있습니다.<a href ='${pageContext.request.contextPath}/member/memberLogin'
				id="btnMoveLogin" class="btn_arrow">로그인</a>
		</p>
		<div class="title_wrap_type3">
			<h4>카드조회 안내</h4>
		</div>

		<div class="line_row_wrap">
			<dl class="line_row">
				<dt>
					<span class="tit">카드조회란?</span>
				</dt>
				<dd>
					<p>카드조회는 회원님의 항공권 구매에 도움을 줄 수 있는 서비스입니다.</p>
					<p class="col_black">자신의 카드에 맞는 항공사별 할인을 쉽고 간편하게 체크하고, 탑승권을
						구매하세요!</p>
				</dd>
			</dl>
			<dl class="line_row">
				<dt>
					<span class="tit">다양한 조회 방법</span>
				</dt>
				<dd>
					<p>카드조회는 집이나 사무실에서 또는 이동 중 모바일 기기에서도 언제든지 가능합니다.</p>
					<p class="col_black">어디서나 편리한 방법으로 할인 받으세요~</p>
				</dd>
				<dd class="full"></dd>
			</dl>
		</div>


		<div class="gray_box">
			<h5>유의사항</h5>
			<ul class="list_type2">
				<li class="col_red">여권정보가 부정확하거나 유효하지 않을 경우 사전심사 결과에 따라 체크인 및
					탑승권 발급이 불가할 수 있습니다.</li>
				<li>모바일 탑승권이 허용되지 않는 일부 해외공항에서는 탑승권 전송이 제한됩니다.</li>
				<li><span class="col_black">이용 제한 대상</span>
					<ul>
						<li>체크인 : 부산 출발 국내선 및 일부 부정기편은 체크인이 제한됩니다.</li>
						<li>좌석배정 : 10인 이상 단체예약, 24개월 미만 소아 동반시 48시간 이전 좌석배정이 제한됩니다.
							(체크인은 가능)</li>
					</ul></li>
				<li>타사 항공기로 운항하는 공동운항편을 이용하실 경우 체크인 및 좌석배정 이용이 제한됩니다. (운항 항공사로
					문의)</li>
				<li>이미 좌석배정 및 체크인을 마치신 경우에도 입력 정보 확인 및 변경이 가능합니다.</li>
				<li>온라인 체크인에 대해 더 궁금한 점이 있으신가요?<a id="btnOnlineCheckInfo"
					href="javascript:sharpNothig();" class="btn_arrow">온라인 체크인 안내</a></li>

			</ul>
		</div>

	</div>

</body>
</html>