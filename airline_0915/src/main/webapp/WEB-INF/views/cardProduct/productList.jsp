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
		<h1 class="h3 mb-2 text-gray-800"><a href="./productList">??????????????????</a></h1>
			
			<div class="search_box mar_to10 total_search_input">
				<form id="frm" action="" method="post">
					<div class="inner alC ">						
						<select name="cardTypeSelect" style="width: 300px" id="card_list">
							<option value="BC??????">BC??????</option>
							<option value="KB????????????">KB????????????</option>
							<option value="????????????">????????????</option>
							<option value="????????????">????????????</option>
							<option value="????????????">????????????</option>
							<option value="????????????">????????????</option>
							<option value="????????????">????????????</option>
							<option value="NH????????????">NH????????????</option>
						</select> 
						<select name="airlineTypeSelect" style="width: 200px" id="airline_list">
							<option value="KE/????????????/1">????????????</option>
							<option value="OZ/??????????????????/2">??????????????????</option>
							<option value="7C/????????????/3">????????????</option>
							<option value="LJ/???????????????/4">???????????????</option>
							<option value="BX/??????????????????/5">??????????????????</option>
							<option value="RS/????????????/6">????????????</option>
							<option value="TW/???????????????/7">???????????????</option>
							<option value="4V/???????????????/8">???????????????</option>
							<option value="RF/?????????????????????/9">?????????????????????</option>
						</select>
						
						<button type="submit" id="btn_search productSearch"
							class="btn_M red">????????????</button>
					</div>
				</form>
			</div>

			<!-- DataTales Example -->
			<div id="container">

				<br>
				<h6 class="m-0 font-weight-bold text-primary">?????? ?????? ??????</h6>
				<br>
				<div id="tab-1" class="tab-content current">
					<div class="bbs_list">
						<ul>
							<c:choose>
								<c:when test="${empty vo.product and not empty pager.search}">
									<div>
										<div class="total_search_txt">
											<strong>???????????? ???????????? ???????????? ????????? ????????????.</strong>
										</div>
										<div class="btn_wrap_ceType1">
											<a href="./productList" id="btnList" type="button">???????????????</a>
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
															<span class="txt_notice">??????</span> <em>${vo.product}</em>
														</a>
													</div>
													<p class="txt">${vo.productExp}</p>
												</div>
												<div class="right">
													<div class="right_sub">
														<span class="views">?????????: ${vo.hit}</span> <span
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
														<span class="views">?????????: ${vo.hit}</span> <span
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

				/* tab ????????? */
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

