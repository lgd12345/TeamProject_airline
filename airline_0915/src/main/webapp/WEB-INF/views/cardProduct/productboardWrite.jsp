<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/board/boardWrite.css">
<link rel="stylesheet" href="../resources/css/asiana/reset.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../resources/css/header.css" rel="stylesheet">
<link href="../resources/css/mypage/mypageHeader.css" rel="stylesheet">
 <!-- summerNote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>

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
<div id="wrap_container">
	<h3>글 작성하기</h3>
</div>
<div class="writeForm">
<h5>내용 작성</h5>	
<div class="mar">
<span>*은 필수항목입니다.</span>
</div>

<form action="${product}Write" method="post" enctype="multipart/form-data" id = "frm">
<table class="table_form">
		<tr>
		<th scope="row">
				주요공지
		</th>
		<td>
			<input type="checkbox" name="fix" id="fix" value="Y">
			<label for="fix" class="chk"></label>
		</td>	
	</tr>
	
	<tr>
		<th scope="row">
				카드상품
			<span>*</span>
		</th>
		<td>
			<input type="text" name="title" id="title" class="full common textWrite" style="100%;">
			<input type="hidden" id="writer" name="writer" value = "${member.id}">
		</td>	
	</tr>
	
	<tr>
		<th scope="row">
				분류선택
			<span>*</span>
		</th>
		<td>
			<select id="cate" name="cate" class=" cate common textWrite">
				<option>선택하세요</option>
				<option value="롯데카드">롯데카드</option>
				<option value="삼성카드">삼성카드</option>
				<option value="KB국민카드">KB국민카드</option>	
				<option value="신한카드">신한카드</option>
				<option value="BC카드">BC카드</option>		
			</select>
		</td>
	</tr>
	<tr>
		<th scope="row">
			내용
			<span>*</span>
		</th>
		<td>
			<div class="textarea_wrap">

				<textarea name="contents" class="common textWrite summernote" id="contents" rows="4" cols="50" style="position: relative;"></textarea>	

				
				<div class="txt_count">
					<em id="counter"></em>
					/4000자
				</div>	
			</div>
		</td>
	</tr>	
	
	
</table>

<div class="btn_wrap">
	<button id="btnTransfer" type="button">등록</button>
</div>


<div id="hidden" style="display: none;"></div>
<input type="hidden" id="ihidden" name="textContents">

</form>

</div>
	
	
	
	
	
<!---------------------------------- Script ------------------------------------>
<script type="text/javascript">

	/**** SummerNote *****/
	
	$(document).ready(function(){
		var markupStr = '${vo.productExp}';
		$('#counter').html(markupStr.length);
		
			$('.summernote').summernote({
					height:300,				
				}); 			
		});


	$('.summernote').on('summernote.keyup', function() {
		var markupStr = $('#contents').val();
		$('#contents').val("");
		$('#contents').val(markupStr.trim());	
		$('#hidden').html(markupStr.trim());
		markupStr = $('#hidden').text();	
		$('#ihidden').val(markupStr.trim());
		//글자수 세기
		$('#counter').html(markupStr.length);	
	});
	
/* 	function uploadFile(file, editor) {
		var formData = new FormData();
		
		formData.append('file', file);		
		
		$.ajax({
			data: formData,
			type:"POST", 
			url:"./summerFile", 
			enctype: "multipart/form-data",
			contentType: false,
			cache: false,
			processData: false,
			
			success:function(data){
					
				data = data.trim();
					console.log(data);
				data = '../resources/upload/summerfile/'+data;
				$(editor).summernote('insertImage', data);
			}
			 ,
			error:function(){		
							
			} 
			
		}); */
	//}
	
	
	
	
	
	
	/**** Null여부 ****/
	var check = false;
	
	$('#btnTransfer').click(function(){
	
		var title = $('#title').val();
		var cate = $("select[name=cate]").val();
		var contents = $('#contents').val();

		if(title !=="" && cate !=="" && contents !=="" && check == true){
					 $('#frm').submit();
						/* $("#btnTransfer").attr('disabled',false); */
		}else{
					alert('필수항목을 확인해주세요.')
			} 

	});



	
	/**** captcha ****/
	
		$('#capReload').on('click', function(){

		/* $("#btnTransfer").attr('disabled',true); */
		
		$.ajax({
			 url : "captchaKey.do", 
		//	dataType:"json",
			success : function(data) {
				console.log(data);
	//			var key = data;
	//			location.href = "captchaImg.do?key="+key;
				$('#key').val(data);
				
				getCaptchaImg();
	
			}, error : function(data){
				console.log("error : "+data);
			}
		});
	});
	
	$(document).ready(function() {
		$.ajax({
			url : "captchaKey.do",
		//	dataType:"json",
			success : function(data) {
				console.log(data);
	//			var key = data;
	//			location.href = "captchaImg.do?key="+key;
				$('#key').val(data);
				
				getCaptchaImg();
	
			}, error : function(data){
				console.log("error : "+data);
			}
		});
		
	});
	function getCaptchaImg(){
		$(function(){
		//	alert("이미지 캡차 메소드 실행 ");
		var key = $("#key").val();
			$.ajax({
				url: "captchaImg.do",
				data: {key: key},
				success: function(data){
					$("#captchaDiv").html("<img src='${ contextPath }/resources/captchaImg/"+data+"'>").css('float','left');
				}
			});
		});
	}
	
	/*  $("#checkNo").on("click",function(){
	//	var form01Data = $("#form01").serialize();
	//	console.log(form01Data);
		var key = $("#key").val();
		var value = $("#value").val();
		$.ajax({
			url : "checkNo.do",
			data : {key:key,value:value},
			dataType:"json",
			success : function(data) {
				console.log(data.result);
				if(data.result){
					alert("인증되었습니다.");
					check=true;
					/* $("#btnTransfer").attr('disabled',false); */
				}else{
					alert("일치하지 않습니다. 다시 확인해주세요.");
				}
			},error : function(data){
				alert("에러");
				console.log(data);
			}
		});
	});  */


</script>

</body>
</html>