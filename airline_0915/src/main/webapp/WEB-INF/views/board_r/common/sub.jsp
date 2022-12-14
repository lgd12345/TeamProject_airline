<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     

	
				<div class="bbs_list">
				<ul>
			<!-- 		<li class="bg_point">
						<div class="left">
							<div class="title">
								<p class="txt"></p>
							</div>
						</div>
						<div class="right">
							<span class="views"></span>
							<span class="date"></span>
						</div>
					</li> -->						
					
					<c:forEach items="${list}" var = "vo">
					<li>
						<div class="left">
							<div class="title">
								<a href="#">
									<em>${vo.title}</em>
								</a>
							</div>
							<p class="txt">${vo.contents}</p>
						</div>
						<div class="right">
							<div class="right_sub">
							<span class="views">์กฐํ์: ${vo.hit}</span>
							<span class="date">${vo.regDate}</span>
							</div>
						</div>
					</li>
					</c:forEach>
				 </ul>	
			</div>
			
			<div class="paging">
			
			<a href="./notice2List?curPage=1" class="btn_first btn_common">
			</a>
		
		 	  <c:if test = "${pager.curBlock>1}"> 
				<a href="./notice2List?curPage=${pager.startNum-1}" class="btn_prev btn_common"></a>	
			 </c:if> 
						
			<c:forEach begin="${pager.startNum}" end = "${pager.lastNum}" var="i">

				<a href="./notice2List?curPage=${i}" class="pagingNo" id="page${i}">${i}</a>
			</c:forEach>
			
			<c:if test = "${pager.curBlock<pager.totalBlock}">
			<a href="./notice2List?curPage=${pager.lastNum+1}" class="btn_next btn_commont"></a>			
			</c:if>		
			<fmt:parseNumber var="pages" integerOnly="true" value="${tc/10}"/>			
			<a href="./notice2List?curPage=${pages+1}" class="btn_last btn_common"></a>
		</div>

		
		
		