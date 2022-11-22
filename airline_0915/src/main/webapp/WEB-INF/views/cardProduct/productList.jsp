<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@page import="com.airline.a1.search.CardProductsBoardVO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


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


<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/board/boardList.css">
<link rel="stylesheet" href="../resources/css/asiana/reset.css">
<link href="../resources/css/header.css" rel="stylesheet">
<link href="../resources/css/mypage/mypageHeader.css" rel="stylesheet">


<title>EVERY AIR / CardSearch</title>
</head>
<body>
	<header>
		<c:import url="../layout/header.jsp"></c:import>
	</header>
	<!-- util_wrap -->

	<div class="container" id="container">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800"><a href="./productList">카드상품조회</a></h1>
			
			<div class="search_box mar_to10 total_search_input">
				<form id="frm" action="" method="post">
					<div class="inner alC ">						
						<select name="cardTypeSelect" style="width: 300px" id="card_list">
							<option value="BC카드">BC카드</option>
							<option value="KB국민카드">KB국민카드</option>
							<option value="삼성카드">삼성카드</option>
							<option value="신한카드">신한카드</option>
							<option value="하나카드">하나카드</option>
							<option value="롯데카드">롯데카드</option>
							<option value="현대카드">현대카드</option>
							<option value="NH농협카드">NH농협카드</option>
						</select> 
						<select name="airlineTypeSelect" style="width: 200px" id="airline_list">
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
						
						<button type="submit" id="btn_search productSearch"
							class="btn_M red">조회하기</button>
					</div>
				</form>
			</div>

			<!-- DataTales Example -->
			<div id="container">

				<br>
				<h6 class="m-0 font-weight-bold text-primary">카드 상품 정보</h6>
				<br>
				<div id="tab-1" class="tab-content current">
					<div class="bbs_list">
						<ul>
							<c:choose>
								<c:when test="${empty vo.product and not empty pager.search}">
									<div>
										<div class="total_search_txt">
											<strong>조회하신 카드사와 일치하는 상품이 없습니다.</strong>
										</div>
										<div class="btn_wrap_ceType1">
											<a href="./productList" id="btnList" type="button">전체리스트</a>
										</div>
									</div>
								</c:when>

								<c:otherwise>
									<c:forEach items="${list}" var="vo">
										<c:if test="${not empty vo.fix}">
											<li class="bg_point">
												<div class="left">
													<div class="title">
														<a
															href="./productSelect?num=${vo.num}&dispCt=all&curPage=${pager.curPage}&search=${pager.search}&kind=${pager.kind}">
															<span class="txt_notice">공지</span> <em>${vo.product}</em>
														</a>
													</div>
													<p class="txt">${vo.productExp}</p>
												</div>
												<div class="right">
													<div class="right_sub">
														<span class="views">조회수: ${vo.hit}</span> <span
															class="date">${vo.regDate}</span>
													</div>
												</div>
											</li>
										</c:if>

										<c:if test="${empty vo.fix}">
											<li>
												<div class="left">
													<div class="title">
														<a
															href="./productSelect?num=${vo.num}&dispCt=all&curPage=${pager.curPage}&search=${pager.search}&kind=${pager.kind}">
															<em>${vo.product}</em>
														</a>
													</div>
													<p class="txt">${vo.productExp}</p>
												</div>
												<div class="right">
													<div class="right_sub">
														<span class="views">조회수: ${vo.hit}</span> <span
															class="date">${vo.regDate}</span>
													</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<c:choose>
						<c:when test="${not empty list}">
							<div class="paging">
								<a href="./productList?curPage=1" class="btn_first btn_common">
								</a>

								<c:if test="${pager.curBlock>1}">
									<a href="./productList?curPage=${pager.startNum-1}"
										class="btn_prev btn_common"></a>
								</c:if>

								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
									var="i">
									<a href="./productList?curPage=${i}" class="pagingNo"
										id="page${i}">${i}</a>
								</c:forEach>

								<c:if test="${pager.curBlock<pager.totalBlock}">
									<a href="./productList?curPage=${pager.lastNum+1}"
										class="btn_next btn_common"></a>
								</c:if>
								<fmt:parseNumber var="pages" integerOnly="true" value="${tc/10}" />
								<a href="./productList?curPage=${pages+1}"
									class="btn_last btn_common"></a>
							</div>
						</c:when>
					</c:choose>
				</div>


			</div>


			<script type="text/javascript">
				/* 	$(document).ready(function() {
				 var list = '${fn:length(list)}';
				 var test = $('#searchText').val();

				 alert(test);
				
				 if(${fn:length(list)} = 0 && test !=''){
				 alert('ok');
				 }
				 }); */

				/* paging  */
				$("#page${pager.curPage}").addClass("on");

				var kind = '${pager.kind}';
				if (kind == '') {
					kind = "kt";
				}
				$("#" + kind).prop("selected", true);

				$('.list').click(function() {
					$("#curPage").val($(this).attr("id"));
					alert("ok");
					$("#frm").submit();

				});

				/* tab */
				$('ul.tabs li').click(function() {
					var tab_id = $(this).attr('data-tab');
					$('ul.tabs li').removeClass('current');
					$('.tab-content').removeClass('current');
					$(this).addClass('current');
					$("#" + tab_id).addClass('current');
				});

				/* tab 넘기기 */
				/* 	$('body').on('click','.tab-link',function(){
				 var menu = $(this).find('.val').text();
				 var curPage = 1;
				 var search = $('#searchText').val();
				 var aa = document.getElementById("kind");
				 kind = aa.options[aa.selectedIndex].value;
				
				 $.ajax({
				 data : {
				 menu:menu,
				 kind:kind,
				 curPage:curPage,
				 search:search						
				 },
				 type : "GET",
				 url : "./subNoticeList",
				 success : function(data){
				
				 $('.test').html(data);
				 }
				 });
				
				 });	 
				 */
			</script>
</body>

</html>

