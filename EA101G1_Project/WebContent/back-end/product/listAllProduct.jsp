<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    ProService proSvc = new ProService();
    List<ProVO> list = proSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />

<html>
<head>
<%@ include file="/back-end/css/BackHeaderCssLink" %>
<title>商品列表</title>

<style>
	img.img-product-icon {
		width: 100px;
		height: 100px;
	}
</style>

</head>
<body>
<!-- header -->
	
	<%@ include file="/back-end/css/header.jsp" %>
<!-- header -->

    <div class="content d-md-flex">

<!-- aside -->
	<%@ include file="/back-end/css/aside.jsp" %>
<!-- aside -->
<main>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<nav aria-label="breadcrumb">
	<ol class="breadcrumb bg-transparent">
		<li class="breadcrumb-item"><a class="bread" href="<%=request.getContextPath()%>/back-end/index.jsp">後台首頁</a></li>
		<li class="breadcrumb-item"><a class="bread" href="#">頁面一</a></li>
		<li class="breadcrumb-item active text-warning" aria-current="page">商品列表</li>
	</ol>
</nav>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-10">
			<div class="card alert alert-success">
				<div class="card-header bg-dark">
					<ul class="nav float-right mr-1 mt-1 text-dark">
						<li class="nav-item">
							<a class="nav-link active h5" href="#">頁面一</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active h5" href="#">頁面二</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active h5" href="#">頁面三</a>
						</li>
					</ul>
					<h1 class="text-white">商品列表</h1>
				</div>
				<div class="card-body alert alert-warning">
					<%@ include file="/files/page1.file" %>
					<div class="row mt-3">
						<c:forEach var="proVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<div class="col-6 mb-1">
								<div class="card">
									<div class="card-header">
										<h4>${proVO.p_name}</h4>
									</div>
									<div class="card-body alert alert-info">
										<div class="media">
											<img alt="" src="<%=request.getContextPath()%>/product/proPic.do?p_id=${proVO.p_id}" class="img-product-icon">
											<div class="media-body alert alert-secondary">
												<ul>
													<li>商品價格： <fmt:formatNumber pattern="#" value="${proVO.p_price}" /></li>
													<li>
														商品狀態： 
														<c:choose>
															<c:when test="${proVO.p_stat eq 0}">
																下架
															</c:when>
															<c:when test="${proVO.p_stat eq 1}">
																上架
															</c:when>
														</c:choose>
													</li>
												</ul>
												<h6 class="mt-1">上架日期： <fmt:formatDate value="${proVO.p_add_date}" pattern="yyyy-MM-dd" /></h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<%@ include file="/files/page2.file" %>
				</div>
			</div>
		</div>
	</div>
</div>








</main>
</div>

</body>
</html>
