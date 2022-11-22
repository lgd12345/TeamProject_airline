<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul>

	
	<c:if test="${cate != '전체'}">
	
		<c:if test="${empty list}">
			<li class="nolist">검색결과가 없습니다.</li>
		</c:if>
		
		<c:forEach items="${list}" var="vo">
			<li>
				<div class="ttitle">${vo.title}</div>
				<div class="tcons">${vo.textContents}</div>
			</li>
		</c:forEach>

	</c:if>


	<c:if test="${cate == '전체'}">
							<li class="cate">공지</li>							
						<c:forEach items="${list}" var="vo">
							
							<c:if test="${not empty vo}">
							<c:if test="${vo.cate == '공지'}">
								<li OnClick="location.href ='./board_r/board2Select1?num=${vo.num}'" style="cursor:pointer;" >
									<div class="ttitle">${vo.title}</div>
									<div class="tcons">${vo.textContents}</div>
								</li>
							</c:if>
							</c:if>
						</c:forEach>
						
						<li class="cate">공항</li>							
						<c:forEach items="${list}" var="vo">

						
							<c:if test="${not empty vo}">
							<c:if test="${vo.cate == '공항'}">
								<li OnClick="location.href ='./board_r/board2Select1?num=${vo.num}'" style="cursor:pointer;" >
									<div class="ttitle">${vo.title}</div>
									<div class="tcons">${vo.textContents}</div>
								</li>
							</c:if>
							</c:if>
						</c:forEach>
						
						<li class="cate">비행기</li>							
						<c:forEach items="${list}" var="vo">

							<c:if test="${not empty vo}">
							<c:if test="${vo.cate == '비행기'}">
								<li OnClick="location.href ='./board_r/board2Select1?num=${vo.num}'" style="cursor:pointer;" >
									<div class="ttitle">${vo.title}</div>
									<div class="tcons">${vo.textContents}</div>
								</li>
							</c:if>
							</c:if>
						</c:forEach>
						
						<li class="cate">여행</li>							
						<c:forEach items="${list}" var="vo">

						
							<c:if test="${not empty vo}">
							<c:if test="${vo.cate == '여행'}">
								<li OnClick="location.href ='./board_r/board2Select1?num=${vo.num}'" style="cursor:pointer;" >
									<div class="ttitle">${vo.title}</div>
									<div class="tcons">${vo.textContents}</div>
								</li>
							</c:if>
							</c:if>
						</c:forEach>
						
						<li class="cate">기타.</li>							
						<c:forEach items="${list}" var="vo">

							
							<c:if test="${not empty vo}">
							<c:if test="${vo.cate == '기타.'}">
								<li OnClick="location.href ='./board_r/board2Select1?num=${vo.num}'" style="cursor:pointer;" >
									<div class="ttitle">${vo.title}</div>
									<div class="tcons">${vo.textContents}</div>
								</li>
							</c:if>
							</c:if>
						</c:forEach>						
						
	
	
	
	</c:if>


</ul>
