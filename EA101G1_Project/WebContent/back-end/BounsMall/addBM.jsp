<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.BounsMall.model.*"%>
<%@ page import="com.productType.model.*"%>

<%
	BMVO bmVO = (BMVO) request.getAttribute("bmVO");
%>

<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>新增紅利商品資料</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>
<style>
	table#table-1 {
		background-color: #CCCCFF;
		border: 2px solid black;
		text-align: center;
	}
	
	table#table-1 h4 {
		color: red;
		display: block;
		margin-bottom: 1px;
	}
	
	h4 {
		color: blue;
		display: inline;
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
<body style="background-color:white">
	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->


	<div class="content d-md-flex ">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->
		<div class="col">
<!-- 			<table id="table-1"> -->
<!-- 				<tr> -->
<!-- 					<td> -->
<!-- 						<h3>新增紅利商品資料</h3> -->
<!-- 						<h4> -->
<!-- 							<a -->
<%-- 								href="<%=request.getContextPath()%>/back-end/BounsMall/select_page.jsp"><img --%>
<!-- 								src="images/tomcat.png">回首頁</a> -->
<!-- 						</h4> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->

			<h3>新增商品資料</h3>

			<!-- 錯誤列表 -->
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤：</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>

			<form method="post"
				action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
				name="form1" enctype="multipart/form-data">
				<table>
					<tr>
						<td>商品名稱：</td>
						<td><input type="text" name="bon_name" size="45"
<%-- 							value="<%=(bmVO == null) ? "碧藍幻想 Versus" : bmVO.getBon_name()%>" --%>
							placeholder="請輸入商品名稱" /></td>
					</tr>
					<tr>
						<td>所需紅利點數：</td>
						<td><input type="TEXT" name="bon_price" size="45"
<%-- 							value="<%=(bmVO == null) ? "50" : bmVO.getBon_price()%>" --%>
							placeholder="請輸入所需紅利" /></td>
					</tr>

					<tr>
						<td>紅利商品描述：</td>
<%-- 						<td><textarea rows="5" cols="50" name="bon_info"><%=(bmVO == null) ? "50" : bmVO.getBon_info()%></textarea></td> --%>
						<td><textarea rows="5" cols="50" name="bon_info" placeholder="請輸入商品描述" ></textarea></td>
					</tr>
					<tr>
						<td>紅利商品總量：</td>
						<td><input type="TEXT" name="bon_stock" size="45"
<%-- 							value="<%=(bmVO == null) ? "50" : bmVO.getBon_stock()%>"  --%>
							placeholder="請輸入商品總量" /></td>
					</tr>

					<jsp:useBean id="bmSvc" scope="page"
						class="com.BounsMall.model.BMService" />
					<tr>
						<td>紅利商品圖片：</td>
						<td>
							<img alt="" src="<%=request.getContextPath()%>/BounsMall/BounsMall.do?bon_image=${bmVO.bon_image}">
							<input type="file" name="bon_image" id="myFile"
								<c:if test="${not empty bmVO.getBon_image()}">
									value="<%=bmVO.getBon_image()%>
								</c:if>
							accept="image/gif, image/jpeg, image/png" />
							<br>
							<div class="row">
								<div id="preview"></div>
							</div>
						</td>
					<tr>
						<td>商品分類編號：<font color=red><b>*</b></font></td>
						<td><select size="1" name="pt_id">
								<c:forEach var="ptVO" items="${ptSvc.all}">
									<option value="${ptVO.pt_id}">${ptVO.typename}</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>
				<br> <input type="hidden" name="action" value="insert">
				<input type="submit" value="送出新增">
			</form>
		</div>
		<script>
		function init() {

			var myFile = document.getElementById("myFile");
			var preview = document.getElementById('preview');

			myFile.addEventListener('change', function(e) {

				var files = myFile.files;

				if (files !== null && files.length > 0) {

					var file = files[0];

					console.log(file.type);
					if (file.type.indexOf('image') > -1) {

						var reader = new FileReader();

						reader.addEventListener('load', function(e) {

							var result = e.target.result;

							var img = document.createElement('img');

							img.src = result;
							preview.innerHTML = "";
							preview.append(img);
						});

						reader.readAsDataURL(file); // ***** 

					}
				}
			});
		}

		window.onload = init;
	</script>
</body>
</html>