<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.BounsOrder.model.*" %>

<%
	BOVO boVO = (BOVO) request.getAttribute("boVO");
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
<body bgcolor="white">
	
	
	<!-- header -->
	<%@ include file="/back-end/css/header.jsp" %>
	<!-- header -->
	    <div class="content d-md-flex">
	<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp" %>
	<!-- aside -->
	
	
	<main>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/BounsOrder/ListAll.jsp">紅利商品訂單管理</a></li>
				<li class="breadcrumb-item active" aria-current="page">訂單編號查詢</li>
			</ol>
		</nav>
		
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-11">
					<div class="card alert alert-info">
						<div class="card-header">
							<h1>訂單編號查詢</h1>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-12">
									<div class="card alert alert-light mb-3 p-4">
										<div class="media alert alert-success">
											<img class="boImg" src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${boVO.bon_id}">
											<div class="media-body">
												<div class="media justify-content-around align-items-center">
													<div class="col-4">
														<div align="center">
															<h4>訂單編號</h4>
															<h4>${boVO.ord_id}</h4>
														</div>
													</div>
													<div class="col-4">
														<div align="center">
															<h4>會員編號</h4>
															<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByMember&mem_id=${boVO.mem_id}"
																>${boVO.mem_id}</a></h4>
															<h4>商品名稱</h4>
															<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByName&bon_id=${boVO.bon_id}"
																>${bmSvc.getByPK(boVO.bon_id).bon_name}</a></h4>
														</div>
													</div>
													<div class="col-4">
														<div align="center">
															<h4>下定日期</h4>
															<h4>${boVO.ord_Date}</h4>
															<h4>訂單狀態</h4>
															<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByBS&bs_id=${boVO.bs_id}"
																>${bsSvc.getOneBS(boVO.bs_id).bs_stat}</a></h4>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
</body>
</html>