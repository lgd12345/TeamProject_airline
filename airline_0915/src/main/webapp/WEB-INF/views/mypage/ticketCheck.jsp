<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVERY AIR / Ticket check</title>
<link href="../resources/css/reset.css" rel="stylesheet">
<link href="../resources/css/mypage/ticketCheck.css" rel="stylesheet">
<link href="../resources/css/mypage/mypageHeader.css" rel="stylesheet">
<c:import url="../template/boot.jsp"></c:import>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="../resources/css/header.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,600,700' rel='stylesheet' type='text/css'>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">

</style>
</head>
<body>


<c:import url="../layout/header.jsp" />
<div id="headerBottom">
<div id="hbh">
<div id="hbhome"><i class="fa fa-home"></i></div>
<div id="hbselect">
<select onchange="location.href=this.value">
<option value="./main">나의 Every Air</option>
<option value="./memberUpdate">회원정보수정</option>
<option value="./mileage">마일리지</option>
<option selected="selected" value="./ticketCheck">예매내역</option>
<option value="./notice22List">나의이용후기</option>
<option value="./limo">리무진 예약내역</option>
</select>
</div>
</div>
</div>



	<div>
	<div class="bookingList">예매내역</div>
	<div class="bookingInfo">
		<div class="bookingTable list">
				<c:forEach items="${bookList}" var="book" varStatus="i">
					<div class="bookList bookDesign li" id="${i.count}">
						<span id="bookingNum" style="display: none">${book.bookingNum}</span>
						<span class="bkn">예매번호 : ${book.bookingNum}</span>
						<span class="bookDate">예매일 : ${book.resDate}</span>
						<span class="depNm" id="depNm${i.count}">${book.depAirportNm}</span>
						<span class="arrNm" id="arrNm${i.count}">${book.arrAirportNm}</span>
						<span class="flightTime" id="flightTime${i.count}">${book.flightTime}분</span>
						<c:if test= "${book.kind eq '왕복' }">
						<span class="arrNm2">${book.depAirportNm}</span>
						<span class="depNm2">${book.arrAirportNm}</span>
						<span class="flightTime2">${book.flightTime}분</span>
						</c:if>
						<div class="bar1" id="bar${i.count}"></div>
						<div class="bar3"></div> 
						<div class="round1" id="round${i.count}"></div>
						<c:if test= "${book.kind eq '왕복' }">
							<div class="round2"></div>
						</c:if>
						<img class="airplaneImg" id="airplaneImg${i.count}"alt="" src="../resources/newni/airplane.png">
						<c:if test= "${book.kind eq '왕복' }">
							<img class="airplaneImg2" alt="" src="../resources/newni/airplane.png">
							<div class="bar2"></div>
						</c:if>
					</div>
					<div class="timelineView${i.count} toggle${i.count}" style="display: none"></div>
					<div class="dataView${i.count} toggle${i.count} dataViewDesign" style="display: none"></div>
				</c:forEach>
				<c:if test="${!empty bookList}">
				 <button class="btn more-trigger">더보기</button>
				 </c:if>
				 <c:if test="${empty bookList}">
				 	<p class="noBook">예매 하신 내역이 없습니다.</p>
				 </c:if>
			</div>
			<div class="ajax" style="display: none">
				
			</div>
		</div>
	</div>
<script type="text/javascript">
var completes = document.querySelectorAll(".complete");
var toggleButton = document.getElementById("toggleButton");
	var cancelList = [];
	
	var bookingList = [];
		<c:forEach begin="0" end="${fn:length(bookList)}" var="i" varStatus="e">
			if("${bookList[i].kind}" == "편도"){
				console.log("${e.count}");
				bookingList.push("${e.count}");
			}
		</c:forEach>
		for(var i = 0; i < bookingList.length; i++){
			 $("#depNm"+bookingList[i]).css({
				   "position" : "relative",
				   "top" : "80px",
				   "left" : "90px"
				});
			 $("#arrNm"+bookingList[i]).css({
				   "position" : "relative",
				   "top" : "80px",
				   "left" : "463px"
				});
			 $("#airplaneImg"+bookingList[i]).css({
				   "position" : "relative",
				   "top" : "-212px",
				});
			 $("#round"+bookingList[i]).css({
				   "top" : "-190px"
				});
			 $("#bar"+bookingList[i]).css({
				   "top" : "67px"
				});
			 $("#flightTime"+bookingList[i]).css({
				   "top" : "46px",
				   "left" : "207px"
				});
		}
	$(".bookList").click(function(){
		var num = $(this).attr('id');
			$.get("./bookingMore?bookingNum=" + $(this).find('#bookingNum').text(),function(data) {
				$(".ajax").html(data);
				var count = $(".ajax").find(".count").text();
				var rowItem = '<table class="open"><tr class="tableTop"><td class="td1">eticket</td><td class="td2">출발일자</td><td class="td3">출발지 → 도착지</td><td class="td4">출발 → 도착시간</td><td class="td5">편명</td><td class="td6">좌석</td><td class="td7">운임</td><td class="td8">탑승번호</td><td class="td9">탑승자명</td></tr>';
				for(var i = 1; i <= count ; i++){
					var depPlandTime = $(".ajax").find(".depPlandTime"+i).text();
					var depPlandTime2 = depPlandTime.substring(0,4) + "-" + depPlandTime.substring(4,6) + "-" + depPlandTime.substring(6,8);
					var depPlandTime3 = depPlandTime.substring(8,10) + ":" + depPlandTime.substring(10,12);
					var depPlandTime4 = depPlandTime.substring(0,8);
					var arrPlandTime = $(".ajax").find(".arrPlandTime"+i).text();
					var arrPlandTime2 = arrPlandTime.substring(8,10) + ":" + arrPlandTime.substring(10,12);
					var arrPlandTime3 = arrPlandTime.substring(0,4) + "-" + arrPlandTime.substring(4,6) + "-" + arrPlandTime.substring(6,8);
					var arrPlandTime4 = arrPlandTime.substring(0,8);
					var seatName = $(".ajax").find(".seatName"+i).text();
					var flightBnum = $(".ajax").find(".flightBNum"+i).text();
					var totalPrice = $(".ajax").find(".totalPrice"+i).text();
					var bookingNum = $(".ajax").find(".bookingNum"+i).text();
					var bnum = $(".ajax").find(".bnum"+i).text();
					var name = $(".ajax").find(".name"+i).text();
					var flightBnum2 = $(".ajax").find(".flightBNum"+i).text();
					if(seatName == "")
						seatName = "X";
					if (flightBnum == "")
						flightBnum = "X";
					else 
						flightBnum = "체크인 완료";
					if (flightBnum2 == "")
						flightBnum2 = "X";
					if(totalPrice == "0")
						totalPrice = "운임정보없음";
					rowItem += '<tr class="tableContents">';
					rowItem += '<td><input type="button" value="출력" class="eticketBtn" id="eticket'+num+'"></td>';
					rowItem += '<td style="display:none">'+bnum+'</td>';
					rowItem += '<td style="display:none">'+bookingNum+'</td>';
					rowItem += '<td style="display:none">'+$(".ajax").find(".kind"+i).text();+'</td>';
					rowItem += '<td>'+depPlandTime2+'</td>';
					rowItem += '<td>'+$(".ajax").find(".depAirportNm"+i).text()+" → "+$(".ajax").find(".arrAirportNm"+i).text()+'</td>';
					rowItem += '<td>'+depPlandTime3+" → "+arrPlandTime2+'</td>';
					rowItem += '<td>'+$(".ajax").find(".vihicleId"+i).text()+'</td>';
					rowItem += '<td>'+seatName+'</td>';
					rowItem += '<td>'+totalPrice+'</td>';
					rowItem += '<td>'+flightBnum2+'</td>';
					rowItem += '<td>'+name+'</td>';

				}
				rowItem += '</table>';
				var depPlandTimeGo = $(".ajax").find(".depPlandTime1").text();
				var depPlandTimeBack = $(".ajax").find(".depPlandTime2").text();
				var arrPlandTimeGo = $(".ajax").find(".arrPlandTime1").text();
				var arrPlandTimeBack = $(".ajax").find(".arrPlandTime2").text();
				var depPlandTimeGoPrint = depPlandTimeGo.substring(0,4) + "-" + depPlandTimeGo.substring(4,6) + "-" + depPlandTimeGo.substring(6,8);
				var depPlandTimeBackPrint = depPlandTimeBack.substring(0,4) + "-" + depPlandTimeBack.substring(4,6) + "-" + depPlandTimeBack.substring(6,8);
				var arrPlandTimeGoPrint = arrPlandTimeGo.substring(0,4) + "-" + arrPlandTimeGo.substring(4,6) + "-" + arrPlandTimeGo.substring(6,8);
				var arrPlandTimeBackPrint = arrPlandTimeBack.substring(0,4) + "-" + arrPlandTimeBack.substring(4,6) + "-" + arrPlandTimeBack.substring(6,8);
				var depPlandTimeGo2 = depPlandTimeGo.substring(0,4)+"-"+ depPlandTimeGo.substring(4,6)+"-"+depPlandTimeGo.substring(6,8)+" "+depPlandTimeGo.substring(8,10) + ":" + depPlandTimeGo.substring(10);
				var depPlandTimeBack2 = depPlandTimeBack.substring(0,4)+"-"+ depPlandTimeBack.substring(4,6)+"-"+depPlandTimeBack.substring(6,8)+" "+depPlandTimeBack.substring(8,10) + ":" + depPlandTimeBack.substring(10);
				var arrPlandTimeGo2 = arrPlandTimeGo.substring(0,4)+"-"+ arrPlandTimeGo.substring(4,6)+"-"+arrPlandTimeGo.substring(6,8)+" "+arrPlandTimeGo.substring(8,10) + ":" + arrPlandTimeGo.substring(10);
				var arrPlandTimeBack2 = arrPlandTimeBack.substring(0,4)+"-"+ arrPlandTimeBack.substring(4,6)+"-"+arrPlandTimeBack.substring(6,8)+" "+arrPlandTimeBack.substring(8,10) + ":" + arrPlandTimeBack.substring(10);
				var depPlandTimeGo3 = depPlandTime.substring(0,8);
				var arrPlandTimeGo3 = arrPlandTime.substring(0,8);
				
				var nowTime = String(new Date().getFullYear())+("0"+String(new Date().getMonth()+1)).slice(-2)+("0"+String(new Date().getDate())).slice(-2)+String(new Date().getHours())+String(new Date().getMinutes());
				
				/****** 가는편의 출발시간 30분전 구하기 (탑승 마감) *******/
				var boardingClosureGo = new Date(depPlandTimeGo2);
				boardingClosureGo.setMinutes(boardingClosureGo.getMinutes() - 30);
				boardingClosureGo = boardingClosureGo.getHours()+":"+boardingClosureGo.getMinutes();
				/********************************************/
				
				/****** 오는편의 출발시간 30분전 구하기 (탑승 마감) *******/
				var boardingClosureBack = new Date(depPlandTimeBack2);
				boardingClosureBack.setMinutes(boardingClosureBack.getMinutes() - 30);
				boardingClosureBack = boardingClosureBack.getHours()+":"+boardingClosureBack.getMinutes();
				/********************************************/

				/**** 가는편 출발날짜의 하루 전 날짜 구하기 (체크인 마감) ****/
				var nowDate = new Date(depPlandTimeGo.substring(0,4)+"/"+ depPlandTimeGo.substring(4,6)+"/"+depPlandTimeGo.substring(6,8));
				var yesterDate = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
				nowDate.setTime(yesterDate);
				var yesterYear = nowDate.getFullYear();
				var yesterMonth = nowDate.getMonth() + 1;
				var yesterDay = nowDate.getDate();
				if(yesterMonth < 10){ yesterMonth = "0" + yesterMonth;}
				if(yesterDay < 10) { yesterDay = "0" + yesterDay;}
				var depYesterDayGoNoHyphen = yesterYear + yesterMonth + yesterDay;
				var depYesterDayGo = yesterYear + "-" + yesterMonth + "-" + yesterDay;
				/*******************************************/
				
				/**** 오는편 출발날짜의 하루 전 날짜 구하기 (체크인 마감) ****/
				var nowDate = new Date(depPlandTimeBack.substring(0,4)+"/"+ depPlandTimeBack.substring(4,6)+"/"+depPlandTimeBack.substring(6,8));
				var yesterDate = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
				nowDate.setTime(yesterDate);
				var yesterYear = nowDate.getFullYear();
				var yesterMonth = nowDate.getMonth() + 1;
				var yesterDay = nowDate.getDate();
				if(yesterMonth < 10){ yesterMonth = "0" + yesterMonth;}
				if(yesterDay < 10) { yesterDay = "0" + yesterDay;}
				var depYesterDayBackNoHyphen = yesterYear + yesterMonth + yesterDay;
				var depYesterDayBack = yesterYear + "-" + yesterMonth + "-" + yesterDay;
				/*******************************************/
				var timeline = '<ul class="timeline timeline1" id="timeline"><li class="li" id="checkInTimeline"> <div class="timestamp"><span class="author">온라인 체크인</span><span class="checkInDate">'+flightBnum+'<span></div><div class="status"><h4> Online check in </h4></div></li>';
				timeline += '<li class="li" id="checkInCloseTimeline"><div class="timestamp"><span class="author">체크인 마감</span><span class="checkInClose" id="'+depYesterDayGoNoHyphen+'">'+depYesterDayGo+'</span></div><div class="status"><h4> Check in closure </h4></div></li>';
				timeline += '<li class="li" id="boardingCloseTimeline"><div class="timestamp"><span class="author">탑승마감</span><span class="boardingClose" >'+depPlandTimeGoPrint+" "+boardingClosureGo+'<span></div><div class="status"><h4> Boarding closure </h4></div></li>';
				timeline += '<li class="li" id="departTime"><div class="timestamp"><span class="author">출발</span><span class="depPlandTimeGo" id="'+depPlandTimeGo+'">'+depPlandTimeGo2+'</span></div><div class="status"><h4> Depart </h4></div></li>';
				timeline += '<li class="li" id="arrivalTime"><div class="timestamp"><span class="author">도착</span><span class="arrPlandTimeGo" id="'+arrPlandTimeGo+'" >'+arrPlandTimeGo2+'<span></div><div class="status"><h4> Arrival </h4></div></li></ul>';
				if( $(".ajax").find(".kind1").text() != '편도'){
					timeline += '<ul class="timeline timeline2" id="timeline" ><li class="li" id="checkInTimeline"> <div class="timestamp"><span class="author">온라인 체크인</span><span class="checkInDate" >'+flightBnum+'</span></div><div class="status"><h4> Online check in </h4></div></li>';
					timeline += '<li class="li" id="checkInCloseTimeline"><div class="timestamp"><span class="author">체크인 마감</span><span class="checkInClose" id="'+depYesterDayBackNoHyphen+'">'+depYesterDayBack+'</span></div><div class="status"><h4> Check in closure </h4></div></li>';
					timeline += '<li class="li" id="boardingCloseTimeline"><div class="timestamp"><span class="author">탑승마감</span><span class="boardingClose">'+depPlandTimeBackPrint+" "+boardingClosureBack+'<span></div><div class="status"><h4> Boarding closure </h4></div></li>';
					timeline += '<li class="li" id="departTime"><div class="timestamp"><span class="author">출발</span><span class="depPlandTimeBack" id="'+depPlandTimeBack+'">'+depPlandTimeBack2+'</span></div><div class="status"><h4> Depart </h4></div></li>';
					timeline += '<li class="li" id="arrivalTime"><div class="timestamp"><span class="author">도착</span><span class="arrPlandTimeBack" id="'+arrPlandTimeBack+'">'+arrPlandTimeBack2+'<span></div><div class="status"><h4> Arrival </h4></div></li></ul>';
				}
				

				$(".dataView"+num).html(rowItem);
				$(".timelineView"+num).html(timeline);

				var date = new Date();
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var day = date.getDate();
				if((month+"").length < 2){
					month = "0" + month;
				} 
				if((day+"").length < 2){
					day = "0" + day;
				} 

				
				var getDate = String(year) + String(month) + String(day);

				var getBoardingCloseTime = $(".timelineView"+num+" .timeline1 .boardingClose").text();
				var boardingYear = getBoardingCloseTime.substring(0,4);
				var boardingMonth = getBoardingCloseTime.substring(5,7);
				var boardingDate = getBoardingCloseTime.substring(8,10);
				var boardingTime = getBoardingCloseTime.substring(10);
				boardingTime = boardingTime.trim().split(":");
				var boardingHour = boardingTime[0];
				var boardingMinute = boardingTime[1];
				if((boardingMonth+"").length < 2){
					boardingMonth = "0" + month;
				} 
				if((boardingDate+"").length < 2){
					boardingDate = "0" + boardingDate;
				} 
				if((boardingHour+"").length < 2){
					boardingHour = "0" + boardingHour;
				} 
				if((boardingMinute+"").length < 2){
					boardingMinute = "0" + boardingMinute;
				} 
				getBoardingCloseTime = boardingYear+boardingMonth+boardingDate+boardingHour+boardingMinute;

				
				
				if($(".timelineView"+num).text()!=null){
					if ($(".timelineView"+num+" .timeline1 .checkInDate").text() != "X"){
						
					if($(".timelineView"+num+" .timeline1 .checkInDate").text() == "체크인 완료")
						$(".timelineView"+num+" #checkInTimeline").addClass("complete");
					
					if(Number(getDate) > $(".timelineView"+num+" .timeline1 .checkInClose").attr('id'))
						$(".timelineView"+num+" .timeline1 #checkInCloseTimeline").addClass("complete");
					
					if(nowTime > getBoardingCloseTime)
						$(".timelineView"+num+" .timeline1 #boardingCloseTimeline").addClass("complete");
					
					if(nowTime > $(".timelineView"+num+" .timeline1 .depPlandTimeGo").attr('id'))
						$(".timelineView"+num+" .timeline1 #departTime").addClass("complete");
					
					if(nowTime > $(".timelineView"+num+" .arrPlandTimeGo").attr('id'))
						$(".timelineView"+num+" .timeline1 #arrivalTime").addClass("complete");
					
					if($(".timelineView"+num+" .timeline2 .checkInDate").text() == "체크인 완료")
						$(".timelineView"+num+" #checkInTimeline").addClass("complete");
					
					if(Number(getDate) > $(".timelineView"+num+" .timeline1 .checkInClose").attr('id'))
						$(".timelineView"+num+" .timeline2 #checkInCloseTimeline").addClass("complete");
					
					if(nowTime > getBoardingCloseTime)
						$(".timelineView"+num+" .timeline2 #boardingCloseTimeline").addClass("complete");
					
					if(nowTime > $(".timelineView"+num+" .timeline1 .depPlandTimeGo").attr('id'))
						$(".timelineView"+num+" .timeline2 #departTime").addClass("complete");
					
					if(nowTime > $(".timelineView"+num+" .arrPlandTimeGo").attr('id'))
						$(".timelineView"+num+" .timeline2 #arrivalTime").addClass("complete");
					}
				}
				
				
				if($(".ajax").find(".isCheckIn").text() != 0)
					$("#"+depPlandTime4).text(depPlandTime2);
			});
			$(".toggle"+num).toggle(500);

			$(document).on('click', '#eticket'+num, function(){
				var eticketBookingNum = $(this).closest('td').next().next().text();
				var eticketKind = $(this).closest('td').next().next().next().text();
				var eticketName = $(this).closest('td').next().next().next().next().next().next().next().next().next().next().next().text();
				cancelList.push($(this).closest('td').next().text());
				if(eticketKind == "왕복"){
				if($(".timelineView"+num+" .timeline1 .checkInDate").text() == "체크인 완료" && $(".timelineView"+num+" .timeline2 .checkInDate").text() == "체크인 완료")
					window.open("../checkIn/eTicket?bookingNum="+eticketBookingNum+"&name="+eticketName,"eTicket","width=700, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes")
				else if($(".timelineView"+num+" .timeline1 .checkInDate").text() != "체크인 완료" && $(".timelineView"+num+" .timeline2 .checkInDate").text() != "체크인 완료")
					alert('체크인 후 확인 가능합니다.');
				} else {
					if($(".timelineView"+num+" .timeline1 .checkInDate").text() == "체크인 완료")
						window.open("../checkIn/eTicket?bookingNum="+eticketBookingNum+"&name="+eticketName,"eTicket","width=700, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes")
					else if($(".timelineView"+num+" .timeline1 .checkInDate").text() != "체크인 완료")
						alert('체크인 후 확인 가능합니다.');
				}
			});
	});

	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	if((month+"").length < 2){
		month = "0" + month;
	} 
	if((day+"").length < 2){
		day = "0" + day;
	} 

	
	var getDate = String(year) + String(month) + String(day);
	if(Number(getDate) > $(".checkInDate").attr('id'))
		$("#checkInTimeline").addClass("complete");
	if(Number(getDate) > $(".checkInClose").attr('id'))
		$("#checkInCloseTimeline").addClass("complete");
	if(Number(getDate) > $(".boardingClose").text())
		$("#boardingCloseTimeline").addClass("complete");
	/* alert(String(new Date().getHours()) + String(new Date().getMinutes())); */
	
	   	
	$(document).ready(function(){
      var list = $(".list .li");
      var numToShow = 5;
      var button = $(".more-trigger");
      var numInList = list.length;
      list.hide();
      if (numInList > numToShow) {
        button.show();
      }
      list.slice(0, numToShow).show();

      button.click(function(){
          var showing = list.filter(':visible').length;
          list.slice(showing - 1, showing + numToShow).fadeIn();
          var nowShowing = list.filter(':visible').length;
          if (nowShowing >= numInList) {
            button.hide();
          }
      });

});
	
</script>

</body>
</html>