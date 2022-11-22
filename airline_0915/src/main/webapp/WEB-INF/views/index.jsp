<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVERY AIR</title>
<link href="../resources/css/reset.css" rel="stylesheet">
<link href="../resources/css/header.css" rel="stylesheet">
<link href="../resources/css/index/main.css" rel="stylesheet">
<c:import url="./template/boot.jsp"></c:import>

<!-- 전반적인 CSS -->
<link rel="stylesheet" href="../resources/css/jquery.bxslider.css">
<link rel="stylesheet" href="../resources/newni/dist/css/swiper.min.css">
<link rel="stylesheet" href="../resources/newni/dist/fullpage.css">

<!-- 예약 -->
<!-- Icons font CSS-->
<link
	href="../resources/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link
	href="../resources/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- .../resources/vendor CSS-->
<link href="../resources/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link href="../resources/vendor/datepicker/daterangepicker.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="../resources/vendor/css/main.css" rel="stylesheet"
	media="all">

<!-- icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script type="text/javascript">
$(document).ready(function() {
	$('.slider').bxSlider();
});
</script>

<style type="text/css">
.alert {
	background-color: #f4b136;
	color: white;
	padding: 10px;
	margin-bottom: 0;
	border: 1px solid transparent;
	border-radius: 0;
}

.closebtn {
	margin-left: 15px;
	font-weight: bold;
	float: right;
	font-size: 22px;
	line-height: 20px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}
</style>
</head>
<div class="alert">
	<span class="closebtn"
		onclick="this.parentElement.style.display='none';">&times;</span>

	<!-- <strong>신종 코로나 바이러스</strong>&nbsp주의 하세여 -->
	<p class="strong">
		비운항 및 감편 노선 안내 <a
			href="${pageContext.request.contextPath}/notice/noticeSelect?num=134"
			style="text-decoration: underline;">자세히보기</a>
	</p>

</div>
<header id="header">
	<c:import url="./layout/header.jsp" />
</header>

<body>
	<div id="body">
		<div id="fullpage">
			<div class="section " id="section0">
				<div class="intro">
					<!-- 슬라이드 맘에 안들면 여기서부터 -->


					<div class="bxslider" style="position: relative;">
						<div style="height: 392px;">
							<img src="./images/index/index_pic1.jpg">
							<div class="text text1">어디로 떠나볼까요?</div>
						</div>
						<div style="height: 392px;">
							<img src="./images/index/index_pic2.jpg" style="width: 1910px;">
							<div class="text text2">
								<p>함께 여행을 떠나요</p>
								EveryAir가 항공권, 주차권, 리무진 예약까지 간편하게 해결해 드릴게요
							</div>
						</div>
						<div style="height: 392px">
							<img src="./images/index/index_pic3.png">
							<div class="text text3">
								<p>나만의 완벽한 여행을 계획하세요</p>
								EveryAir에서 가장 편리한 공항의 항공편, 주차권, 리무진을 검색해 보세요
							</div>
						</div>
						<div style="height: 392px">
							<img src="./images/index/index_pic4.png">
							<div class="text text4">
								<p>2020 EveryAir LIKE</p>
								하루 한번, EveryAir와 함께 떠나는 365일 국내여행
							</div>
						</div>
						<div style="height: 392px">
							<img src="./images/index/index_pic5.png">
							<div class="text text5">
								새로워진 <span>EveryAir</span>에
								<p>오신 것을 환영합니다!</p>
							</div>
						</div>
						<div style="height: 392px">
							<img src="./images/index/index_pic6.png">
							<div class="text text6">
								<p>EveryAir 웹 체크인</p>
								좌석 선택부터 탑승권 발급까지 빠르고 간편하게 이용해 보세요!
							</div>
						</div>

					</div>


					<!-- 예약시작 -->
					<div class="resWrap">

						<div class="card card-4" style="background: none">
							<div class="tab-content">
								<div class="tab-pane active" id="tab1">

									<form method="post" action="./booking/bookingMain" id="frm">

										<div class="radio-row" style="margin-bottom: 20px;">
											<label class="radio-container m-r-45">왕복 <input
												type="radio" name="kind" value="왕복" id="round"
												checked="checked"> <span class="radio-checkmark"></span>
											</label> <label class="radio-container m-r-45">편도 <input
												type="radio" name="kind" value="편도" id="eachWay"> <span
												class="radio-checkmark"></span>
											</label>
										</div>

										<div id="body">
											<div class="input-group mid small">
												<label class="label">출발지 :</label> <input
													class="input--style-1 t1" type="text" name="depLoc"
													placeholder="지역 또는 공항명" required="required" id="loc">
												<!--   <input type="hidden" id="t2" readonly="readonly" name = "depLoc"> -->
											</div>

											<div class="input-group mid small">
												<label class="label">도착지 :</label> <input
													class="input--style-1" type="text" name="arrLoc"
													placeholder="지역 또는 공항명" required="required" id="arrloc">
											</div>


											<div class="input-group1 mid large">
												<label class="label">탑승일 :</label> <input
													class="input--style-12" type="text" name="date"
													placeholder="yyyy/mm/dd" id="input-start">
											</div>

											<div class="input-group123 mid">

												<label class="label">탑승객 :</label>
												<div class="input-group-icon" id="js-select-special">
													<input class="input--style-1 input--style-1-small"
														type="text" name="traveller" value="성인 1, 아이 0"
														disabled="disabled" id="info"> <i
														class="zmdi zmdi-chevron-down input-icon"
														style="height: 100%; background-color: transparent;"></i>
												</div>


												<div class="dropdown-select">
													<ul class="list-room">
														<li class="list-room__item">
															<ul class="list-person">
																<li class="list-person__item"><span class="name">성인</span>
																	<div class="quantity quantity1">
																		<span class="minus" id="a_minus">-</span> <input
																			class="inputQty" type="number" min="0" value="1"
																			name="adult" id="adult"> <span class="plus">+</span>
																	</div></li>

																<li class="list-person__item"><span class="name">아이</span>
																	<div class="quantity quantity2">
																		<span class="minus">-</span> <input class="inputQty"
																			type="number" min="0" value="0" name="child"
																			id="child"> <span class="plus">+</span>
																	</div></li>
															</ul>
														</li>
													</ul>

												</div>
											</div>

											<div class="col-2">
												<button class="btn-submit" id="booking_btn" type="button">검색</button>
											</div>

										</div>
									</form>
								</div>
							</div>
						</div>

						<!-- 공항검색 -->
						<div id="locSearch" class="search">
							<table id="locTable" class="tab">
								<c:forEach items="${airportList}" var="airPort">
									<tr>
										<td class="loctd loctdd">${airPort}</td>
									</tr>
								</c:forEach>
							</table>
						</div>


						<div id="depLocDiv"></div>
						<!-- 공항검색끝 -->

					</div>
					<!-- 예약 끝 -->

					<div
						style="width: 80%; margin: auto; height: 150px; position: relative; top: -205px;">
						<div class="swiper-container" style="height: max-content">
							<div class="swiper-wrapper">
								<div class="swiper-slide"
									style="background: url('./images/index/mainslider.jpg'); height: 180px; margin-right: 8px; background-size: cover;">
								</div>
								<div class="swiper-slide"
									style="background: url('https://ozimg.flyasiana.com/image_fixed/destination/des_M_CJU.jpg'); height: 180px; margin-right: 8px; background-size: cover;">
								</div>
								<div class="swiper-slide"
									style="background: url('https://ozimg.flyasiana.com/image_fixed/destination/des_M_FUK.jpg'); height: 180px; margin-right: 8px; background-size: cover;">
								</div>
								<div class="swiper-slide"
									style="background: url('https://ozimg.flyasiana.com/image_fixed/destination/des_M_OKA.jpg'); height: 180px; margin-right: 8px; background-size: cover;">
								</div>
							</div>
							<!-- Add Pagination -->
							<!-- <div class="swiper-pagination"></div> -->
							<!-- Add Arrows -->
							<div class="swiper-button-next" style="color: red;"></div>
							<div class="swiper-button-prev"></div>
						</div>
						<!-- Swiper JS -->
						<script src="../resources/newni/dist/js/swiper.min.js"></script>
					</div>
					<!-- 여기까지 꺼내고 지우면됨 -->
				</div>
			</div>
			<div class="section" id="section1"
				style="background: url(https://flyasiana.com/C/pc/image/main/bg_section02_default.jpg); background-size: 1920px">
				<div class="intro">

					<span style="float: right;"> <a
						href="https://www.weather.go.kr/w/index.do"><img alt="weather"
							src="../images/weather.png"
							style="width: 180px; height: 180px; margin-top: -50px; cursor: pointer;"></a>
						<a
						href="https://www.weatheri.co.kr/forecast/forecast03.php?mNum=1&aircode=RKSI"><img
							alt="weather" src="../images/weather2.png"
							style="width: 60px; height: 60px; float: right; margin-right: 50px; cursor: pointer;"></a>
					</span>

					<div class="weather">
						<div class="airLine_weather">
							<span class="airLine_weather_text">공항별 날씨정보</span>
						</div>
						<div class="weather_wrap">
							<div class="weather_select_wrap">
								<select name="airLine" id="weather_sel">
									<option value="RKSI/인천공항/1">인천공항</option>
									<option value="RKSS/김포공항/2">김포공항</option>
									<option value="RKNY/양양공항/3">양양공항</option>
									<option value="RKTU/청주공항/4">청주공항</option>
									<option value="RKTN/대구공항/5">대구공항</option>
									<option value="RKJB/무안공항/6">무안공항</option>
									<option value="RKJY/여수공항/7">여수공항</option>
									<option value="RKPK/김해공항/8">김해공항</option>
									<option value="RKPU/울산공항/9">울산공항</option>
									<option value="RKPC/제주공항/10">제주공항</option>
									<!-- <option value="ICN/인천공항/1">인천공항</option>
									<option value="GMP/김포공항/2">김포공항</option>
									<option value="YNY/양양공항/3">양양공항</option>
									<option value="CJJ/청주공항/4">청주공항</option>
									<option value="TAE/대구공항/5">대구공항</option>
									<option value="MWX/무안공항/6">무안공항</option>
									<option value="RSU/여수공항/7">여수공항</option>
									<option value="PUS/김해공항/8">김해공항</option>
									<option value="USN/울산공항/9">울산공항</option>
									<option value="CJU/제주공항/10">제주공항</option> -->
								</select>
								<!-- <button id="weather_select">선택</button> -->
								<!-- <img alt="search" src="../images/search.png" style="width: 35px; height: 35px; cursor:pointer; top:-5px; position: relative;" id="weather_select"> -->
							</div>
						</div>
						<div id="weather_view">
							<div class="weather_view_wrap">
								<span class="weather_view_wrap_text">현재날씨</span>
							</div>
							<div class="weather_info">${weather}</div>
							<div class="weather_view_wrap2">
								<span class="weather_view_wrap_text">날씨예보</span>
							</div>
							<div class="weather_info">${weather2}</div>
						</div>
					</div>


				</div>
			</div>

			<script type="text/javascript">
							$('#searchDepArr').click(function(){

								$('.slide_inner').css('top','40px');
								$('#deptt').css('display','block');
								var soptsel =  $('#searchDate option:selected').val().replace('.','').replace('.','').trim();
								var dc = $('#txtDepartureAirportF').val().trim();
								var ac = $('#txtArrivalAirportF').val().trim();
								

  								$.ajax({
									data : {
										depAirportNm : dc,
										arrAirportNm : ac,
										depPlandTime : soptsel
									},
									type : "GET",
									url : "/indexdep",
									success : function(data) {

										$('#te').html(data);

									}
								}); 

								
							});
						

						</script>







		</div>


	</div>

<%-- <div class="section" id="section4" style="height: 500px;">
<div class="footer" style="width: 100%; height: 300px; background-color: black;">테스트</div>

<c:import url="../template/fffooter.jsp" />

			</div>
		</div>
		<div class="footer" style="width: 100%; height: 300px; background-color: black;">테스트</div> --%>
	</div>

	</div>
	<!-- 전반적인 CSS -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script type="text/javascript"
		src="../resources/newni/dist/fullpage.js"></script>


	<!-- 예약 -->
	<!-- Jquery JS-->
	<!-- .../resources/vendor JS-->
	<script src="../resources/vendor/select2/select2.min.js"></script>
	<script
		src="../resources/vendor/jquery-validate/jquery.validate.min.js"></script>
	<script src="../resources/vendor/bootstrap-wizard/bootstrap.min.js"></script>
	<script
		src="../resources/vendor/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
	<script src="../resources/vendor/datepicker/moment.min.js"></script>
	<script src="../resources/vendor/datepicker/daterangepicker.js"></script>
	<!-- Main JS-->
	<script src="../resources/vendor/js/global.js"></script>

	<script>
		$(".menu1").hover(function() {
			$(".sub1").slideDown(500);

		});

		/* $(".menu1").hover(function(){
		 $(".sub1").slideDown(300);
		 $(".sub1").css("display", "block"); 
		 });
		 $(".menu1").mouseleave(function(){
		 $(".sub1").slideUp(500);
		 $(".sub1").css("display", "none"); 
		
		 }); */
		 
		$(".sub1").hover(function() {
			$(".sub1").css("display", "block");
		});

			
		var myFullpage = new fullpage('#fullpage', {
			//fixedElements: '#header',
			navigation:true,
			showActiveTooltip: true,
			anchors : [ 'firstPage', 'secondPage', '3rdPage', '4rdPage' ], 
			sectionsColor : [ '#FFFFFF', '#1BBC9B', '#7E8F7C' ],
			responsiveHeight : 600,
			afterResponsive : function(isResponsive) {
			}
		});


/* 		var myFullpage = new fullpage('#fullpage', {
			anchors : [ '1stPage', '2ndPage', '3rdPage', '4rdPage' ], 
			navigation:true,
			navigationTooltips: ['Page 1', 'Page 2', 'Page 3', 'Page 4'],
			showActiveTooltip: true,
			menu: '#menu',
			scrollBar: true,
			autoScrolling: true,
			slidesNavigation: true,
			responsiveHeight: 800,
			scrollingSpeed: 700,
			controlArrows: false,
			sectionsColor : [ '#FFFFFF', '#1BBC9B', '#7E8F7C' ],
			afterResponsive : function(isResponsive) {
			}
		}); */
		

		var appendNumber = 4;
		var swiper = new Swiper('.swiper-container', {
			pagination : '.swiper-pagination',
			nextButton : '.swiper-button-next',
			prevButton : '.swiper-button-prev',
			slidesPerView : 5,
			centeredSlides : true,
		      pagination: {
			        el: '.swiper-pagination',
			        clickable: true,
			      },
			spaceBetween : 8,
			loop : true,
		      freeMode: true,
		});

		$('.bxslider').bxSlider({
			auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true,
			mode : 'fade',
			slideWidth : 1920,
			slideHeight : 500
		});


		

/* 예약 */
/*** dateRangePicker ***/
 $('#input-start').daterangepicker({
	singleDatePicker:false,
	autoApply: true,
	 minDate: new Date() 
	});
$('input:radio[name=kind]').click(function(){
	if($('input:radio[id=eachWay]').is(":checked")){
			 $('#input-start').daterangepicker({
				singleDatePicker:true,
				 minDate: new Date() 
				}); 
		}else{
			$('#input-start').daterangepicker({
				singleDatePicker:false,	
				autoApply: true,
				 minDate: new Date() 
				}); 	
		}
});
/*** dateRangePicker 끝  ***/

/**** 공항검색 ****/
 	 var a = false;
//-------------------- 검색어 필터 -----------------------------		
	$("#loc").on("keyup", function(){
		var value = $(this).val().toLowerCase();
		a = false;
	if(value ==""){
		$("#locSearch").css("display", "none");
		}else{
			$("#locSearch").css("display", "block");
			$("#locTable tr").filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);		
				if($(this).text().toLowerCase().indexOf(value) > -1){
					a=true;
					}
				});
			}	
		});
	//--------------------- 검색어 필터 -----------------------------	
 	$("#locSearch").css("display","none");
	 var loc= ""; 
	//--------------------- click -----------------------------		
  $('.loctd').on("click", function(){
		if($('#loc').val(loc) != ""){
				$('#loc').val("");
				a = false;
		} 
		 loc = $(this).text();
		$('#loc').val(loc);
		$("#locSearch").css("display","none"); 
		}); 
//--------------------- blur -----------------------------		
 	$('#loc').on("blur",function(){
 	 			var v = $(".tab").text().trim();
 	 			 console.log("a : "+ a); 
		
			var value = $('#loc').val();
				var check=false;
			 	if(a){	
				$(".loctd").each(function(){
						if($(this).html()==value){
							 $("#locSearch").css("display","none"); 
							check=true; 
							}
					}); 
				}else {
				 	var t = $('#loc').val();
					 <c:forEach items="${airportList}" var="airPort">	
						if('${airPort}' == t){
						} else {	
							    $('#loc').val("");  
								$("#locSearch").css("display","none"); 
								a=false;     
								}
					 </c:forEach>
				}
		}); 
/**** 공항검색 끝 ****/

 /***** 공항유효성검사 *****/
	  $('body').on("click",'#booking_btn',function(){
			var loc = $('#loc').val().trim();
			var arrloc = $('#arrloc').val().trim();

			var child = $('#child').val();
			var adult = $('#adult').val();

			  $.ajax({
				url : "airportCheck",
				data :{
						depLoc:loc,
						arrLoc:arrloc
					},
				type : "GET",
				success : function(data){
					if(data == true){
						
						if(child <= adult){
							if(adult < 6){
								$('#frm').submit();	
								}else{
									alert("예약인원은 성인5명 아이5명까지 가능합니다.")									
									}							
							}else{												
								alert("성인 한 사람당 아이 1명만 허용됩니다.")
							}
						
						}else{
							alert("출발지나 도착지를 올바르게 입력하세요.");
							}
					},error:function(){
							alert("fail");
						}
		  });
	  });
 /***** 공항유효성검사  끝*****/
 
 $('#loc').keydown(function(){
		 $("#arrloc").val("");	
	 });
/****** 도착지  *******/
$('#arrloc').focus(function(){
	var depLoc = $("#loc").val(); 
	var query = {depLoc : $("#loc").val()};
			
			$.ajax({
					url : "airportDepList",
					data : query,
					type : "POST",
					success : function(data){
						$("#depLocDiv").html(data);
						},error:function(){
							console.log("fail");
							}	
				});	 			
});



/* 예약 끝 */


/* 검색 */
$('body').on('blur', '.search__input', function(){
		$('#frm2').submit();
 });


$("#weather_sel").change(function(){
	var weather = $("#weather_sel").val();
	$.ajax({
		type:'get',
		url:"weather/weatherInfo",
		async: false,
		data:{
			"airLine":weather
		},
		success: function(data){
			data = data.trim();
			$("#weather_view").html(data);
		}
	});
	$("#weather_view tr").css("background-color", "transparent");
	$("#weather_view td").css("background-color", "transparent");
	$("#weather_view td").css("border-style", "hidden");
	$("#weather_view td").css("font-weight","bold");
	$("#weather_view td").css("vertical-align","middle");
});
$("#weather_view td").css("font-weight","bold");
$("#weather_view td").css("vertical-align","middle");
$("#weather_view tr").css("background-color", "transparent");
$("#weather_view td").css("background-color", "transparent");
$("#weather_view td").css("border-style", "hidden");
var depChecks=[]; // 가는 비행기의 좌석에 체크된 항목을 담을 배열
var arrChecks=[]; // 오는 비행기의 좌석에 체크된 항목을 담을 배열
var depLoc;
var arrLoc;

$(function() { // 구매가능한 좌석만 호버 
	$('.bookable').mouseover(function() {
		$(this).addClass('over');
	});
	$('.bookable').mouseout(function() {
		$(this).removeClass('over');
	});
});

$("input:checkbox").click(function(){
	// alert($(this).attr('id'));
	// alert($(this).attr('class'));
	if ($(this).prop('checked')) {
		$(this).parent().closest('label').addClass('booking');
		$(this).parent().closest('label').removeClass('bookable');
	}
	else{
		//alert($(this).attr('id')+" 좌석을 취소");
		$(this).parent().closest('label').addClass('bookable');
		$(this).parent().closest('label').removeClass('booking');
	}
	// 가는 편 좌석을 모두 선택시 체크박스 제어
	if($(".depAir input:checkbox:checked").length == $("#people").val()){
		$(".depAir input:checkbox").not(":checked").attr('disabled', true);
		$(".depAir input:checkbox").not(":checked").parent().closest('label').removeClass('bookable');
		$(".depAir input:checkbox").not(":checked").parent().closest('label').addClass('bookend');
	}
	else if($(".depAir input:checkbox:checked").length < $("#people").val()){
		// 이미 예매 되어있는 좌석을 제외한 나머지 좌석의 disabled을 해제
		$(".depAir input:checkbox").not(".booked input:checkbox").attr('disabled', false); 
		$(".depAir input:checkbox").not(":checked").addClass('bookable');
		$(".depAir input:checkbox").not(":checked").parent().closest('label').removeClass('bookend');
		$(".depAir input:checkbox").not(":checked").parent().closest('label').addClass('bookable');
	} 
	// 오는 편 좌석을 모두 선택시 체크박스 제어
	if($(".arrAir input:checkbox:checked").length == $("#people").val()){
		$(".arrAir input:checkbox").not(":checked").attr('disabled', true);
		$(".arrAir input:checkbox").not(":checked").parent().closest('label').removeClass('bookable');
		$(".arrAir input:checkbox").not(":checked").parent().closest('label').addClass('bookend');
	}
	else if($(".arrAir input:checkbox:checked").length < $("#people").val()){
		$(".arrAir input:checkbox").not(".booked input:checkbox").attr('disabled', false);
		$(".arrAir input:checkbox").not(":checked").addClass('bookable');
		$(".arrAir input:checkbox").not(":checked").parent().closest('label').removeClass('bookend');
		$(".arrAir input:checkbox").not(":checked").parent().closest('label').addClass('bookable');
	} 
	if($(this).closest("div").parent().attr("class") == "depSeat"){
		if($(this).is(":checked")) {
			// 좌석 선택시 배열에 넣음 
			depChecks.push($(this).attr('title'));
		} else if ($(this).not(":checked")) {
			// 좌석 선택 해제시 해제한 값을 찾아서 배열에서 삭제
			depChecks.splice(depChecks.indexOf($(this).attr('title')),1);	
		}
		<c:forEach items='depChecks' var='depCheck'>
			$("#depSeat").val(${depCheck}); // 선택한 좌석을 파라미터로 넘기기 위해 input에 담아줌
		</c:forEach>
	}
	if($(this).closest("div").parent().attr("class") == "arrSeat"){
		if($(this).is(":checked")) {
			arrChecks.push($(this).attr('title'));
		} else if ($(this).not(":checked")) {
			arrChecks.splice(arrChecks.indexOf($(this).attr('title')),1);	
		}
		<c:forEach items='arrChecks' var='arrCheck'>
			$("#arrSeat").val(${arrCheck});
		</c:forEach>
	}
});
$("#btn_search").click(function() {
	var  bookingNum = $('#bookingNum').val();
	$.get("./checkIn/bookingCheck?bookingNum=" + bookingNum, function(data) {
		$(".ajax").html(data);
		var result = $(".ajax").find(".result").text();
		if (result == 2) {
			var people = $(".ajax").find(".people").text();
			var depFNum = $(".ajax").find(".depFNum").text();
			var arrFNum = $(".ajax").find(".arrFNum").text();
			var tripData = $(".ajax").find(".tripData").text();
			var booked = $(".ajax").find(".booked").text();
			depLoc = $(".ajax").find(".depLoc").text();
			arrLoc = $(".ajax").find(".arrLoc").text();
			var depSeat = $(".ajax").find(".depSeat").text();
			var arrSeat = $(".ajax").find(".arrSeat").text();
			var bookingNum = $(".ajax").find(".bookingNum").text();
			var kind = $(".ajax").find(".kind").text();
			var id = $(".ajax").find(".id").text();
			var tripDate = $(".ajax").find(".tripDate").text();
			$("#myModal").css('display','block');
			$("#people").val(people);
			$("#tripData").val(tripData);
			$(".modalInnerRightDown #bookingNum").val(bookingNum);
			$("#depFNum").val(depFNum);
			$("#arrFNum").val(arrFNum);
			$("#kind").val(kind);
			$("#depLoc").html(depLoc);
			$("#arrLoc").html(arrLoc);
			$(".nameViewInner").html(id);
			$(".tripDate").html(tripDate);
			$(".spanPeople").html(people);
			$(".spanBookingNum").html(bookingNum);
			var depSplit = depSeat.split(",");
			for(var i = 0; i < depSplit.length; i++){
				var depSeat = depSplit[i].replace("[","").replace("]","").trim();
				$(".depSeat input:checkbox[id=dep"+depSeat+"]").attr('disabled', true); // 이미 예매 되어있는 좌석을 선택불가로 바꿈
				$(".depSeat input:checkbox[id=dep"+depSeat+"]").parent().closest('label').addClass('booked'); // 색상도 바꿔줌
				$(".depSeat input:checkbox[id=dep"+depSeat+"]").parent().closest('label').removeClass('bookable'); // 색상도 바꿔줌
				}
			var arrSplit = arrSeat.split(",");
			for(var i = 0; i < arrSplit.length; i++){
				var arrSeat = arrSplit[i].replace("[","").replace("]","").trim();
				$(".arrSeat input:checkbox[id=arr"+arrSeat+"]").attr('disabled', true); // 이미 예매 되어있는 좌석을 선택불가로 바꿈
				$(".arrSeat input:checkbox[id=arr"+arrSeat+"]").parent().closest('label').addClass('booked'); // 색상도 바꿔줌
				$(".arrSeat input:checkbox[id=arr"+arrSeat+"]").parent().closest('label').removeClass('bookable'); // 색상도 바꿔줌
				}
			var span = document.getElementsByClassName("close")[0];
			span.onclick = function() {
				  $("#myModal").css('display','none');
				}
			window.onclick = function(event) {
				  if (event.target == $("#myModal")) {
				    $("#myModal").css('display','none');
				  }
				}
			if($("#kind").val() == 1){
				$(".modalInnerBottom").click(function(){
					if($("#people").val() == $(".depAir input:checkbox:checked").length){
						$(".depAir").css("display","none");
						$(".arrAir").css("display","block");
						$(".modalInnerBottom").css('display','none');
						$(".modalInnerBottom2").css('display','block');
						$("#depLoc").html(arrLoc);
						$("#arrLoc").html(depLoc);
					} else {
						alert('좌석을 선택하세요.');
					}
				});
			} else {
				$(".modalInnerBottom").text('좌석 선택 완료');
				$(".roundOnly").html("");
				$(".modalInnerBottom").click(function(){
					if($("#people").val() == $(".depAir input:checkbox:checked").length){
						$("#frm3").submit();
					} else {
						alert('좌석을 선택하세요.');
					} 
				});
			}		
				
		} else if (result == 1){
			alert('이미 체크인 하셨습니다.');
		} else {
			alert('정보 조회에 실패했습니다. 예매번호를 확인해주세요.');
		}
		
	});
});

$(".depBookGo").click(function(){
	$(".depAir").css("display","block");
	$(".arrAir").css("display","none");
	$(".modalInnerBottom").css('display','inline-block');
	$(".modalInnerBottom2").css('display','none');
	$("#depLoc").html(depLoc);
	$("#arrLoc").html(arrLoc);
});
$(".bookOk").click(function(){
	if($("#people").val() == $(".depAir input:checkbox:checked").length && $("#people").val() == $(".arrAir input:checkbox:checked").length){
		$("#frm3").submit();
	}
	else{
		alert('좌석 선택이 완료되지 않았습니다.');
	}
});

		
	</script>
</body>
</html>