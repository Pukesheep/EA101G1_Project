<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.BounsOrder.model.*" %>

<%
	List<BOVO> list = (java.util.List<BOVO>) request.getAttribute("list");
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

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<main>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/BounsOrder/ListAll.jsp">���Q�ӫ~�q��޲z</a></li>
				<li class="breadcrumb-item active" aria-current="page">�q�檬�A�d��</li>
			</ol>
		</nav>
		
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-11">
					<div class="card alert alert-info">
						<div class="card-header">
							<h1>�q�檬�A�d��</h1>
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
																<h4>�q��s��</h4>
																<h4><a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=getOneForDisplay&ord_id=${boVO.ord_id}"
																	>${boVO.ord_id}</a></h4>
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
																<h4>${bsSvc.getOneBS(boVO.bs_id).bs_stat}</h4>
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
								</c:forEach>
							</div>
						</div>
					</div>
					<%@ include file="../../files/page2.file" %>
				</div>
			</div>
		</div>
	</main>
	
</body>
</html>