<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.BounsMall.model.*"%>
<%@ page import="com.productType.model.*"%>

<%
	BMVO bmVO = (BMVO) request.getAttribute("bmVO");
%>

<jsp:useBean id="ptSvc" scope="page"
	class="com.productType.model.PtService" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>新增紅利商品資料</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>
<style>
img.boImg {
	width: 150px;
	height: 150px;
}
</style>
<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}

#preview img {
	width: 200px;
}
</style>
</head>
<body bgcolor='white'>

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->

		<!-- 錯誤列表 -->

		<main>
			<form method="post"
				action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
				name="form1" enctype="multipart/form-data">


				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active" aria-current="page">新增紅利商品管理</li>
					</ol>
				</nav>

				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-11">
							<div class="card alert alert-info">
								<div class="card-header">
									<h1>新增紅利商品資料</h1>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-12">
											<div class="card alert alert-light mb-6 p-4">
												<div class="media alert alert-success">
													<div class="media-body">
														<div
															class="media justify-content-around align-items-center">

															<div class="col-4">
																<h5>商品名稱：</h5>

																<div align="center">
																	<h5>
																		<input type="text" name="bon_name" size="45"
																				<c:if test="${not empty bmVO.getBon_id()}">
																					value="<%=bmVO.getBon_name()%>"
																				</c:if>
																			placeholder="請輸入商品名稱" />
																	</h5>
																</div>
																<h5>所需紅利點數 :</h5>
																<div class="col-4">
																	<div align="center"></div>
																</div>
																<h5>
																	<input type="TEXT" name="bon_price" size="45"
																			<c:if test="${not empty bmVO.getBon_price()}">
																				value="<%=bmVO.getBon_price()%>"
																			</c:if>
																		placeholder="請輸入所需紅利" />
																</h5>
																<h5>紅利商品描述：</h5>

																<h5>
																	<textarea rows="5" cols="48" name="bon_info"
																		placeholder="請輸入商品描述"><c:if test="${not empty bmVO.getBon_info()}"
																			>value="<%=bmVO.getBon_info()%>"</c:if></textarea>
																</h5>
																<h5>紅利商品總量：</h5>
																<h5>
																	<input type="TEXT" name="bon_stock" size="45"
																			<c:if test="${not empty bmVO.getBon_stock()}">
																				value="<%=bmVO.getBon_stock()%>
																			</c:if>
																		placeholder="請輸入商品總量" />
																</h5>
																<jsp:useBean id="bmSvc" scope="page"
																	class="com.BounsMall.model.BMService" />
																<h5>紅利商品圖片：</h5>
																<img alt=""
																	src="<%=request.getContextPath()%>/BounsMall/BounsMall.do?bon_image=${bmVO.bon_image}">
																<input type="file" name="bon_image" id="myFile"
																		<c:if test="${not empty bmVO.getBon_image()}">
																			value="<%=bmVO.getBon_image()%>
																		</c:if>
																	accept="image/gif, image/jpeg, image/png" /><br>
																<div class="row">
																	<div id="preview"></div>
																</div>

																商品分類編號：<font color=red><b>*</b></font> <select size="1"
																	name="pt_id">
																	<c:forEach var="ptVO" items="${ptSvc.all}">
																		<option value="${ptVO.pt_id}">${ptVO.typename}</option>
																	</c:forEach>
																</select>
														
																<button type="submit" class="btn btn-outline-secondary">送出新增</button>
																<input type="hidden" name="action" value="insert">
																<script>
																
																	function init() {

																		var myFile = document
																				.getElementById("myFile");
																		var preview = document
																				.getElementById('preview');

																		myFile
																				.addEventListener(
																						'change',
																						function(
																								e) {

																							var files = myFile.files;

																							if (files !== null
																									&& files.length > 0) {

																								var file = files[0];

																								console
																										.log(file.type);
																								if (file.type
																										.indexOf('image') > -1) {

																									var reader = new FileReader();

																									reader
																											.addEventListener(
																													'load',
																													function(
																															e) {

																														var result = e.target.result;

																														var img = document
																																.createElement('img');

																														img.src = result;
																														preview.innerHTML = "";
																														preview
																																.append(img);
																													});

																									reader
																											.readAsDataURL(file); // ***** 

																								}
																							}
																						});
																	}

																	window.onload = init;
																</script>
																<div>
																<c:if test="${not empty errorMsgs}">
																	<font style="color: red">請修正以下錯誤：</font>
																	<ul>
																		<c:forEach var="message" items="${errorMsgs}">
																			<li style="color: red">${message}</li>
																		</c:forEach>
																	</ul>
																</c:if>
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
					</div>
		</main>
	</div>

</body>
</html>