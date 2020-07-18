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
	<title>���Q�ӫ~�q��޲z</title>
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
				<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/BounsOrder/ListAll.jsp">���Q�ӫ~�q��޲z</a></li>
				<li class="breadcrumb-item active" aria-current="page">�q��s���d��</li>
			</ol>
		</nav>
		
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-11">
					<div class="card alert alert-info">
						<div class="card-header">
							<h1>�q��s���d��</h1>
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
															<h4>�q��s��</h4>
															<h4>${boVO.ord_id}</h4>
														</div>
													</div>
													<div class="col-4">
														<div align="center">
															<h4>�|���s��</h4>
															<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByMember&mem_id=${boVO.mem_id}"
																>${boVO.mem_id}</a></h4>
															<h4>�ӫ~�W��</h4>
															<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByName&bon_id=${boVO.bon_id}"
																>${bmSvc.getByPK(boVO.bon_id).bon_name}</a></h4>
														</div>
													</div>
													<div class="col-4">
														<div align="center">
															<h4>�U�w���</h4>
															<h4>${boVO.ord_Date}</h4>
															<h4>�q�檬�A</h4>
															<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getAllByBS&bs_id=${boVO.bs_id}"
																>${bsSvc.getOneBS(boVO.bs_id).bs_stat}</a></h4>
														</div>
													</div>
												</div>
											</div>
										</div>
										<c:choose>
												<c:when test="${boVO.bs_id=='BS001'}">
													<div align="center">
						    							<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" style="margin-bottom: 0px;">
															<input type="hidden" name="ord_id" value="${boVO.ord_id}">
															<input type="hidden" name="mem_id" value="${boVO.mem_id}">
															<input type="hidden" name="bon_id" value="${boVO.bon_id}">
															<input type="hidden" name="bs_id" value="BS003">
															<input type="hidden" name="action" value="cancel">
															<button type="submit" class="btn btn-warning float-center">�����X�f</button>
														</form>
													</div>
												</c:when>
												<c:when test="${boVO.bs_id=='BS005'}">
													<div align="center">
						    							<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" style="margin-bottom: 0px;">
															<input type="hidden" name="ord_id" value="${boVO.ord_id}">
															<input type="hidden" name="mem_id" value="${boVO.mem_id}">
															<input type="hidden" name="bon_id" value="${boVO.bon_id}">
															<input type="hidden" name="bs_id" value="BS006">
															<input type="hidden" name="action" value="cancel">
															<button type="submit" class="btn btn-warning float-center">�����h��</button>
														</form>
													</div>
												</c:when>
											</c:choose>
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