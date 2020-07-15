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
	<title>���Q�ӫ~�q��޲z</title>
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
	
<!-- 	���~�C�� -->
	<c:if test="">
		<font style="color:red">�Эץ��H�U���~�G</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<main>
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item active" aria-current="page">���Q�ӫ~�q��޲z</li>
		  </ol>
		</nav>
		
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-11">
					<div class="card alert alert-info">
						<div class="card-header">
							<h1>�������Q�q��d��</h1>
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
															<button type="submit" class="btn btn-warning float-left" >�ק���Q�q��</button>
														</form>
													</div>
													<div style="margin-left: 75%">
														<form action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" method="post" >
															<input type="hidden" name="ord_id" value="${boVO.ord_id}" >
															<input type="hidden" name="action" value="delete">
															<button type="submit" class="btn btn-danger float-left" >�R�����Q�q��</button>
														</form>
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
				</div>
			</div>
		</div>
	</main>
</body>
</html>