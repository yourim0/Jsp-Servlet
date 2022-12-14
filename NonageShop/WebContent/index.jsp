<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@ include file="../header.jsp"%>

<div class="clear"></div>

<div id="main_img">
	<img src="images/main_img.jpg">
</div>

<div class="clear"></div>

<div id="front">
	<h2> New Item </h2>
	<div id="bestProduct">
		<c:forEach items="newProductList" var="productVO">
			<div id="item">
				<a href="NanageServlet?command=product_detail&pseq=${productVO.pseq }">
					<img src="product_images/${productVO.image }" />
					<h3>${productVO.name }</h3>
					<p>${productVO.price2 }</p>
				</a>
			</div>
		</c:forEach>
	</div>
	
	<div class="clear"></div>
	
	<h2> Best Item</h2>
	<div id="bestProduct">
		<c:forEach items="newProductList" var="productVO">
			<div id="item">
				<a href="NanageServlet?command=product_detail&pseq=${productVO.pseq }">
					<img src="product_images/${productVO.image }" />
					<h3>${productVO.name }</h3>
					<p>${productVO.price2 }</p>
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
</div>

<%@ include file="../footer.jsp" %>