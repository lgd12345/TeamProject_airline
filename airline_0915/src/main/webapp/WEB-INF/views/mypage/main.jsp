<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link href="../resources/css/reset.css" rel="stylesheet">
<link href="../resources/css/header.css" rel="stylesheet">
<link href="../resources/css/mypage/main.css" rel="stylesheet">
<link href="../resources/css/mypage/mypageHeader.css" rel="stylesheet">

<c:import url="../template/boot.jsp"></c:import>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css"
	href="../resources/assets/circle.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/demo.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/skins/yellowcircle.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/skins/purplecircle.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/skins/firecircle.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/skins/whitecircle.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/skins/simplecircle.css">
<style type="text/css">
body {
	background-color: #e4e4e4;
}

.header_bottom_inner {
	background-color: white;
}

td, th {
	padding: 10px;
}

.thBook {
	text-align: center;
}

.thMile {
	text-align: right;
}

th {
	background-color: #6d6e70;
	color: white;
	border: 1px solid #6d6e70;
}

td {
	border: 1px solid #e8e8e8;
}
</style>
</head>
<body>


	<header>
		<c:import url="../layout/header.jsp"></c:import>
	</header>
	<div id="headerBottom">
		<div id="hbh">
			<div id="hbhome">
				<i class="fa fa-home"></i>
			</div>
			<div id="hbselect">
				<select onchange="location.href=this.value">
					<option selected="selected" value="./main">나의 Every Air</option>
					<option value="./memberUpdate">회원정보수정</option>
					<option value="./mileage">Mileage</option>
					<option value="./notice22List">나의이용후기</option>
					
				</select>
			</div>
		</div>
	</div>

	<div class="myinfo">
		<div class="myinfoWrap">


			<div class="myInfoLeft">
				<div>
					<div id="miname">${member.name}님</div>
					<span id="miEname">(${member.id})</span>
				</div>

				<div id="cardInfo">
					<div>
						<span style="color: #d2e9ec;">회원번호 : </span>${member.memberNum}</div>
					<div>
						<span style="color: #d2e9ec;">전화번호 : </span>${member.phone}</div>
					<div>
						<span style="color: #d2e9ec;">이메일 : </span>${member.email}</div>
					<!-- <div style="padding-top: 30px;">바코드 / <span class="openQr">QR코드</span> / SMS</div> -->
				</div>

				<!-- 			<div style="height: 30px; background-color: green;">
				여기에는 공지사항?
			</div> -->
			</div>



			<div class="myInfoMiddle">
				<div class="page" style="width: 500px; margin: 0 auto;">
					<div class="circles-container bg-white">
						<div class="circlebar" data-circle-startTime=0
							data-circle-maxValue="${member.mileage/20000*100}"
							data-circle-dialWidth=10 data-circle-size="300px"
							data-circle-type="progress">
							<div class="loader-bg">
								<div class="text">88855</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="myInfoRight"></div>

		</div>
	</div>
	<div class="wrapper">
		<div class="bar2"></div>
		<div class="box1">
			<div class="box1_box1">
				<span>Mileage</span> <img alt="" src="../resources/newni/van.png"
					class="threeImage">
			</div>
			<div class="box1_box2">
				<span>나의이용후기</span> <img alt=""
					src="../resources/newni/carParking.png" class="threeImage">
			</div>
		</div>
		<div class="box3">
			<span>회원정보변경</span> <img alt="" src="../resources/newni/replace.png"
				class="threeImage">
		</div>
	</div>
	<footer>
		<!-- footer -->
		<div id="footer">
			<script type="text/javascript">
		if (/ip(hone|od)/i.test(navigator.userAgent)) {
			$(document).ready(function() {
				$('.family_site.select-box').addClass('iphone');
				$('.family_site.select-box select').selectric({
					disableOnMobile: false
				});
			});
		}
		function familySite(obj){
			if (obj.value != "") {
				window.open("http://" + obj.value,"","");				
			}
		}
	</script>
			<div class="foot_bottom clfix">
				<div class="foot_cont">
					<p class="foot_menu">
						<a href="/spexp/etc/svcstpl/SvcStpl.do">서비스 이용약관</a> <a
							href="/spexp/etc/indlstpl/IndlStpl.do">개인정보 처리방침</a> <a
							href="/spexp/etc/busstpl/BusStpl.do">고속버스 운송약관</a>
						<!-- <a href="/spexp/etc/cmsstpl/CmsStpl.do">전자금융거래 이용약관</a> -->
						<a>고객센터 1644-9030</a>
					</p>
					<p class="foot_addr">
						서울특별시 서초구 신반포로 194 <span class="mo_block">통신판매업신고:
							2009-서울서초 0587호 대표자 : 사조</span>
					</p>
					<p class="foot_copy">COPYRIGHT© 2022. WWW.AIRLINE.CO.KR . ALL
						RIGHT RESERVED</p>
				</div>
			</div>
		</div>
		<!-- //footer -->
	</footer>

	<script type="text/javascript">


		$(document).ready(function() {
			var t2 = new Circlebar({
				element : ".circlebar",
				maxValue : 50000,
				fontColor : "#777",
				fontSize : "25px",
				skin : "white",
				type : "progress"
			});
		});

		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();


		$(document).ready(function() {
		    var prefs = {
		        element: ".circlebar"
		    };
		    $('.circlebar').each(function() {
		        prefs.element = $(this);
		        new Circlebar(prefs);
		    });
		});

		function Circlebar(prefs) {
		    this.element = $(prefs.element);
		    this.element.append('<div class="spinner-holder-one animate-0-25-a"><div class="spinner-holder-two animate-0-25-b"><div class="loader-spinner" style=""></div></div></div><div class="spinner-holder-one animate-25-50-a"><div class="spinner-holder-two animate-25-50-b"><div class="loader-spinner"></div></div></div><div class="spinner-holder-one animate-50-75-a"><div class="spinner-holder-two animate-50-75-b"><div class="loader-spinner"></div></div></div><div class="spinner-holder-one animate-75-100-a"><div class="spinner-holder-two animate-75-100-b"><div class="loader-spinner"></div></div></div>');
		    this.value, this.maxValue, this.counter, this.dialWidth, this.size, this.fontSize, this.fontColor, this.skin, this.triggerPercentage, this.type, this.timer;
		    // var attribs = this.element.find("div")[0].parentNode.dataset;
		    var attribs = this.element[0].dataset,
		        that = this;
		    this.initialise = function() {
		        that.value = parseInt(attribs.circleStarttime) || parseInt(prefs.startTime) || 0;
		        that.maxValue = parseInt(attribs.circleMaxvalue) || parseInt(prefs.maxValue) || 80;
		        that.counter = parseInt(attribs.circleCounter) || parseInt(prefs.counter) || 80;
		        that.dialWidth = parseInt(attribs.circleDialwidth) || parseInt(prefs.dialWidth) || 10;
		        that.size = attribs.circleSize || prefs.size || "150px";
		        that.fontSize = attribs.circleFontsize || prefs.fontSize || "20px";
		        that.fontColor = attribs.circleFontcolor || prefs.fontColor || "rgb(135, 206, 235)";
		        that.skin = attribs.circleSkin || prefs.skin || " ";
		        that.triggerPercentage = attribs.circleTriggerpercentage || prefs.triggerPercentage || false;
		        that.type = attribs.circleType || prefs.type || "timer";


		        that.element.addClass(that.skin).addClass('loader');
		        that.element.find(".loader-bg").css("border-width", 20 + "px");
		        that.element.find(".loader-spinner").css("border-width", 20 + "px");
		        that.element.css({ "width": that.size, "height": that.size });
		        that.element.find(".loader-bg .text")
		            .css({ "font-size": that.fontSize, "color": that.fontColor });
		    };
		    this.initialise();
		    this.renderProgress = function(progress) {
		        progress = Math.floor(progress);
		        var angle = 0;
		        if (progress < 25) {
		            angle = -90 + (progress / 100) * 360;
		            that.element.find(".animate-0-25-b").css("transform", "rotate(" + angle + "deg)");
		            if (that.triggerPercentage) {
		                that.element.addClass('circle-loaded-0');
		            }

		        } else if (progress >= 25 && progress < 50) {
		            angle = -90 + ((progress - 25) / 100) * 360;
		            that.element.find(".animate-0-25-b").css("transform", "rotate(0deg)");
		            that.element.find(".animate-25-50-b").css("transform", "rotate(" + angle + "deg)");
		            if (that.triggerPercentage) {
		                that.element.removeClass('circle-loaded-0').addClass('circle-loaded-25');
		            }
		        } else if (progress >= 50 && progress < 75) {
		            angle = -90 + ((progress - 50) / 100) * 360;
		            that.element.find(".animate-25-50-b, .animate-0-25-b").css("transform", "rotate(0deg)");
		            that.element.find(".animate-50-75-b").css("transform", "rotate(" + angle + "deg)");
		            if (that.triggerPercentage) {
		                that.element.removeClass('circle-loaded-25').addClass('circle-loaded-50');
		            }
		        } else if (progress >= 75 && progress <= 100) {
		            angle = -90 + ((progress - 75) / 100) * 360;
		            that.element.find(".animate-50-75-b, .animate-25-50-b, .animate-0-25-b")
		                .css("transform", "rotate(0deg)");
		            that.element.find(".animate-75-100-b").css("transform", "rotate(" + angle + "deg)");
		            if (that.triggerPercentage) {
		                that.element.removeClass('circle-loaded-50').addClass('circle-loaded-75');
		            }
		        }
		    };
		    this.textFilter = function() {
		        var percentage = 0,
		            date = 0,
		            text = that.element.find(".text");
		        if (that.type == "timer") {
		            that.timer = setInterval(function() {
		                if (that.value < that.maxValue) {
		                    that.value += parseInt(that.counter / 1000);
		                    percentage = (that.value * 100) / that.maxValue;
		                    that.renderProgress(percentage);
		                    text[0].dataset.value = that.value;
		                    date = new Date(null);
		                    date.setSeconds(that.value); // specify value for seconds here
		                    text.html(date.toISOString().substr(11, 8));
		                } else {
		                    clearInterval(that.timer);
		                }
		            }, (that.counter));
		        }
		        if (that.type == "progress") {
		            function setDeceleratingTimeout(factor, times) {
		                var internalCallback = function(counter) {
		                    return function() {
		                        if (that.value < that.maxValue && that.value < 100) {
		                            that.value += 1;
		                            that.renderProgress(that.value);
		                            text[0].dataset.value = that.value;
		                            text.html(${member.mileage} + "점");
		                            setTimeout(internalCallback, ++counter * factor);
		                        }
		                    }
		                }(times, 0);
		                setTimeout(internalCallback, factor);
		            };
		            setDeceleratingTimeout(0.1, 100);
		        }
		    }
		    this.textFilter();
		    this.setValue = function(val) {
		        text = that.element.find(".text");
		        that.value = val;
		        that.renderProgress(that.value);
		        text[0].dataset.value = that.value;
		        text.html(that.value);
		    }
		}

		(function($) {
		    $.fn.Circlebar = function(prefs) {
		        prefs.element = this.selector;
		        new Circlebar(prefs);
		    };
		})(jQuery);
		
		$(".openQr").click(function(){
			window.open("./openQrcode","qrcode","width=300, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
					
		});
		
		$(".box1_box1").click(function(){
			location.href = './mileage';
		});
		$(".box1_box2").click(function(){
			location.href = './notice22List';
		});
		/* $(".box3").click(function(){
			location.href = './ticketCheck';
		}); */
		$(".box3").click(function(){
			location.href = './memberUpdate';
		});
		$(".plus").click(function(){
			location.href = './mileage';
		});
		
	</script>

	<!-- footer -->

	<!-- //footer -->
</body>

</html>