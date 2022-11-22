<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/board/boardWrite.css">
<link rel="stylesheet" href="../resources/css/asiana/reset.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../resources/css/header.css" rel="stylesheet">
<link href="../resources/css/mypage/mypageHeader.css" rel="stylesheet">
<!-- summerNote -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>

</head>
<body>

	<header>
		<c:import url="../layout/header.jsp"></c:import>
	</header>



	<!---- container ---->
	<div id="wrap_container">
		<h3>글 작성하기</h3>
	</div>
	<div class="writeForm">
		<h5>내용 작성</h5>
		<div class="mar">
			<span>*은 필수항목입니다.</span>
		</div>

		<form action="${board2}Write" method="post"
			enctype="multipart/form-data" id="frm">
			<table class="table_form">
				<tr>
					<th scope="row">제목 <span>*</span>
					</th>
					<td><input type="text" name="title" id="title"
						class="full common textWrite" style=""> <input
						type="hidden" id="writer" name="writer" value="${member.id}">
					</td>
				</tr>

				<tr>
					<th scope="row">분류선택</th>
					<td><select id="cate" name="cate"
						class=" cate common textWrite">
							<option value="선택안함" selected>선택안함</option>
							<option value="공항">공항</option>
							<option value="비행기">비행기</option>
							<option value="여행">여행</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>

				<tr>
					<th scope="row">내용 <span>*</span>
					</th>
					<td>
						<div class="textarea_wrap">

							<textarea name="contents" class="common textWrite summernote"
								id="contents" rows="4" cols="50" style="position: relative;"></textarea>


							<div class="txt_count">
								<em id="counter"></em> /4000자
							</div>
						</div>
					</td>
				</tr>
				<tr>
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

		$(document).ready(function() {
			var markupStr = '${vo2.textContents}';
			$('#counter').html(markupStr.length);

			$('.summernote').summernote({
				height : 300,
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
		/***** 파일 추가 삭제 *****/

		$('#attfile1').change(
				function() {

					if (window.FileReader) {
						var filename = $(this)[0].files[0].name;
					} else {
						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
					}
					$('#fileName1').val(filename);
				});

		$('#btn_delete1').click(function() {
			$("#attfile1").val("");
			$("#fileName1").val("");
		});

		$('#attfile2').change(
				function() {

					if (window.FileReader) {
						var filename = $(this)[0].files[0].name;
					} else {
						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
					}
					$('#fileName2').val(filename);
				});

		$('#btn_delete2').click(function() {
			$("#attfile2").val("");
			$("#fileName2").val("");
		});
		$('#attfile3').change(
				function() {

					if (window.FileReader) {
						var filename = $(this)[0].files[0].name;
					} else {
						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
					}
					$('#fileName3').val(filename);
				});

		$('#btn_delete3').click(function() {
			$("#attfile3").val("");
			$("#fileName3").val("");
		});

		/**** Null여부 ****/
		$('#btnTransfer').click(function() {

			var title = $('#title').val();
			var cate = $("select[name=cate]").val();
			var contents = $('#contents').val();

			if (title !== "" && cate !== "" && contents !== "") {
				$('#frm').submit();
				/* $("#btnTransfer").attr('disabled',false); */
			} else {
				alert('필수항목을 확인해주세요.')
			}

		});
	</script>

</body>
</html>