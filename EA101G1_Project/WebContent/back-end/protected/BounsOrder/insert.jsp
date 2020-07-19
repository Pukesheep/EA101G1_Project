<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.BounsOrder.model.*"%>

<%
	BOVO boVO = (BOVO) request.getAttribute("boVO");
%>

<jsp:useBean id="memSvc" scope="page"
	class="com.member.model.MemberService" />
<jsp:useBean id="bmSvc" scope="page"
	class="com.BounsMall.model.BMService" />

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>新增紅利訂單</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>

</head>
<body>
	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->

		<main>

			<div class="container-fluid">
				<div class="row justify-content-center mt-5">
					<div class="col-10">
						<div class="card alert alert-primary">
							<div class="card-header">
							<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" >
								<h1>紅利訂單新增</h1>
							</div>

							<div class="card-body">
								<div class="row mt-2">
									<div class="col-12">
										<div class="alert alert-success" role="alert">
											<div class="row">
												<div class="col-10">
													<h3>選擇會員：</h3>
													
													<select size="1" name="mem_id">
														<c:forEach var="memVO" items="${memSvc.all}">
															<option value="${memVO.mem_id}"
																${(boVO.mem_id==memVO.mem_id)? 'select':'' }>${memVO.mem_name}
														</c:forEach>
													</select>
												</div>
													<div class="card-body">
													<div class="row mt-3">
												<div class="col-10">
													<h3>選擇商品：</h3>
													<select size="1" name="bon_id">
														<c:forEach var="bmVO" items="${bmSvc.all}">
															<option value="${bmVO.bon_id}"
																${(boVO.bon_id==bmVO.bon_id)? 'select':''}>${bmVO.bon_name}
														</c:forEach>
													</select>
													</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<button type="submit" class="btn btn-outline-secondary">送出新增</button>
								<input type="hidden" name="action" value="insert"> 
<!-- 								<input type="submit" value="送出新增"> -->
								</div>
								</div>
								</div>
								
						</div>
				</div>
		</main>
	</div>
</body>
</html>