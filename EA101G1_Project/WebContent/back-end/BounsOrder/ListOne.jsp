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
												<div class="col-8">
													<div style="margin_left: 0%">
														<form action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" method="post">
															<input type="hidden" name="ord_id" value="${boVO.ord_id}">
															<input type="hidden" name="action" value="getOne_For_Update">
															<button type="submit" class="btn btn-warning float-left" >修改紅利訂單</button>
														</form>
													</div>
													<div style="margin-left: 75%">
														<form action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" method="post" >
															<input type="hidden" name="ord_id" value="${boVO.ord_id}" >
															<input type="hidden" name="action" value="delete">
															<button type="submit" class="btn btn-danger float-left" >刪除紅利訂單</button>
														</form>
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
	
	
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<th>訂單編號</th> -->
<!-- 			<th>會員編號</th> -->
<!-- 			<th>紅利商品名稱</th> -->
<!-- 			<th>下訂日期</th> -->
<!-- 			<th>訂單狀態</th> -->
<!-- 			<th colspan="2">執行動作</th> -->
<!-- 		</tr> -->
		
<!-- 		<tr> -->
<%-- 			<td>${boVO.ord_id}</td> --%>
<!-- 			<td> -->
<%-- 				<a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByMember&mem_id=${boVO.mem_id}" --%>
<%-- 					>${boVO.mem_id}</a> --%>
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 				<a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByName&bon_id=${boVO.bon_id}" --%>
<%-- 					>${bmSvc.getByPK(boVO.bon_id).bon_name}</a> --%>
<!-- 			</td> -->
<%-- 			<td>${boVO.ord_Date}</td> --%>
<!-- 			<td> -->
<%-- 				<a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByBS&bs_id=${boVO.bs_id}" --%>
<%-- 					>${bsSvc.getOneBS(boVO.bs_id).bs_stat}</a> --%>
<!-- 				</td> -->
<!-- 			<td> -->
<%-- 				<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" style="margin-bottom: 0px;"> --%>
<%-- 					<input type="hidden" name="ord_id" value="${boVO.ord_id}"> --%>
<!-- 					<input type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 					<input type="submit" value="修改" > -->
<!-- 				</form> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 				<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" style="margin-bottom: 0px;"> --%>
<%-- 					<input type="hidden" name="ord_id" value="${boVO.ord_id}"> --%>
<!-- 					<input type="hidden" name="action" value="delete"> -->
<!-- 					<input type="submit" value="刪除" > -->
<!-- 				</form> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
</body>
</html>