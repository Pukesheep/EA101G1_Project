<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.BounsOrder.model.*" %>

<%
	BOService boSvc = new BOService();
	List<BOVO> list = boSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="bsSvc" scope="page" class="com.BounsState.model.BSService"/>
<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService"/>

<!DOCTYPE html>
<html>
<head>
	<title>紅利商品訂單管理</title>
	<%@ include file="/back-end/css/BackHeaderCssLink" %> 

	<style>
		img.boImg {
			width: 150px;
			height: 150px;
		}
	</style>
</head>
<body bgcolor='white'>
	
	<%@ include file="/back-end/css/header.jsp" %>
<!-- header -->

    <div class="content d-md-flex">

<!-- aside -->
	<%@ include file="/back-end/css/aside.jsp" %>
<!-- aside -->
	
<!-- 	錯誤列表 -->
	<c:if test="">
		<font style="color:red">請修正以下錯誤：</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<main>
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item active" aria-current="page">紅利商品訂單管理</li>
		  </ol>
		</nav>
		
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-11">
					<div class="card alert alert-info">
						<div class="card-header">
							<h1>全部紅利訂單查詢</h1>
						</div>
						<div class="card-body">
							<div class="row">
								<%@ include file="../../files/page1.file" %>
								<c:forEach var="boVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
									<div class="col-12">
										<div class="card alert alert-light mb-3 p-4">
											<div class="media alert alert-success">
												<img class="boImg" src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${boVO.bon_id}">
												<div class="media-body">
													<div class="media justify-content-around align-items-center">
														<div class="col-4">
															<div align="center">
																<h4>訂單編號</h4>
																<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getOneForDisplay&ord_id=${boVO.ord_id}"
																	title="依此訂單編號查詢" >${boVO.ord_id}</a></h4>
															</div>
														</div>
														<div class="col-4">
															<div align="center">
																<h4>會員編號</h4>
																<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByMember&mem_id=${boVO.mem_id}"
																	title="依此會員編號查詢" >${boVO.mem_id}</a></h4>
																<h4>商品名稱</h4>
																<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByName&bon_id=${boVO.bon_id}"
																	title="依此遊戲名稱查詢" >${bmSvc.getByPK(boVO.bon_id).bon_name}</a></h4>
															</div>
														</div>
														<div class="col-4">
															<div align="center">
																<h4>下定日期</h4>
																<h4>${boVO.ord_Date}</h4>
																<h4>訂單狀態</h4>
																<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByBS&bs_id=${boVO.bs_id}"
																	title="依此訂單狀態查詢" >${bsSvc.getOneBS(boVO.bs_id).bs_stat}</a></h4>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row justify-content-center">
												<div class="dropdown">
													<button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
														修改訂單狀態
													</button>
													<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
														<a class="dropdown-item" href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=updateBS&ord_id=${boVO.ord_id}&bs_id=BS003">已出貨</a>
														<a class="dropdown-item" href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=updateBS&ord_id=${boVO.ord_id}&bs_id=BS004">已完成</a>
														<a class="dropdown-item" href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=updateBS&ord_id=${boVO.ord_id}&bs_id=BS005">待審核</a>
														<a class="dropdown-item" href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=updateBS&ord_id=${boVO.ord_id}&bs_id=BS006">已退換</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<%@ include file="../../files/page2.file" %>
					<form method="post" action="<%=request.getContextPath()%>/back-end/BounsOrder/insert.jsp">
						<input type="hidden" name="action" value="insert">
						<input type="submit" value="新增訂單">
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>