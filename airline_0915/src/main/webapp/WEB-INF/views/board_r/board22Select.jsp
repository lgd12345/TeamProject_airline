<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVERY AIR / Board</title>
	<c:import url="../template/boot.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/board/boardSelect.css">
	<link rel="stylesheet" href="../resources/css/asiana/reset.css">
	<link href="../resources/css/header.css" rel="stylesheet">
	<link href="../resources/css/mypage/mypageHeader.css" rel="stylesheet">
</head>
<body>

<header>
<c:import url="../layout/header.jsp"></c:import>
</header>



<!-- <div id="headerBottom">
<div id="hbh">
<div id="hbhome"><i class="fa fa-home"></i></div>
<div id="hbselect">
<select onchange="location.href=this.value">
<option selected="selected" value="./main">나의 Every Air</option>
<option value="./memberUpdate">회원정보수정</option>
<option value="./mileage">마일리지</option>
<option value="./ticketCheck">예매내역</option>
<option value="./park">주차장 예약내역</option>
<option value="./limo">리무진 예약내역</option>
</select>
</div>
</div>

</div> -->


<!---- container ---->
<div class = "container">
	<h3>나의 이용 후기</h3>

	<div class = "list_view">
		<div class="list_view_title">
			<div class="left">
				<p class="title">${vo.title}</p>
			</div>
			<div class="right">
				<div class= "hit"><span>조회수 ${vo.hit}</span></div>
				<div class= "hit"><span>${vo.writer}</span></div>
				<div class= "hit"><span>${vo.regDate}</span></div>
			</div>
		</div>
			<div class="list_view_cont">
				${vo.contents}
			</div>
			<div class="list_view_ctrl">
				<div>
					<span class="prev">다음글</span>
					 <a href="./notice22Select?num=${next.num}&menu=${param.menu}&curPage=${param.curPage}&search=${param.search}&kind=${param.kind}">${next.title}</a>
					<c:if test="${next eq null}"><a>다음글이 없습니다.</a></c:if>
				</div>
				<div>
					<span class="next">이전글</span>
					<a href="./notice22Select?num=${prev.num}&menu=${param.menu}&curPage=${param.curPage}&search=${param.search}&kind=${param.kind}">${prev.title}</a>
					<c:if test="${prev eq null}"><a>이전글이 없습니다.</a></c:if>
				</div>
			</div>
			<c:if test="${member.id eq vo.writer}">
			<div class="btn_area">
					<a href="../notice2/notice22Delete?num=${vo.num}" id="delete_btn">삭제하기</a>
					<a href="../notice2/notice2Update?num=${vo.num}" id="update_btn">수정하기</a>
			</div>
			</c:if>
			<div class="btn_wrap">
				<c:if test="${member.id ne 'admin'}">
					<a href="./notice22List" id="btnList" type="button">목록보기</a>
				</c:if>

				<c:if test="${member.id eq 'admin'}">
					<a href="/admin/admin3_1" id="btnList" type="button">목록보기</a>
				</c:if>
			</div>
		</div>
	</div>


</div>




<script type="text/javascript">

function getParam(sname) {
    var params = location.search.substr(location.search.indexOf("?") + 1);
    var sval = "";
	    params = params.split("&");

    	for(var i=0; i<params.length; i++){
	        temp = params[i].split("=");
        if([temp[0]] == sname){ 
            sval = temp[1]; 
            }
	    }
	    return sval;
	}

 /* 	$('#btnList').click(function(){
		var curpage= getParam("")
		
		if(getParam("dispCt") == 'all'){
			location.href="./boardList";
			}else{
				alert("no");
				}

		}); */
 

</script>




</body>
</html>