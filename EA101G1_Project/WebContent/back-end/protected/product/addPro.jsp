<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>

<%
	ProVO proVO = (ProVO) request.getAttribute("proVO");
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�ӫ~��Ʒs�W</title>
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

div #preview {
	width: 500px;
}

#preview img {
	width: 200px;
}
</style>

</head>
<body bgcolor='white'>
<!-- header -->


	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	


	<div class="content d-md-flex">


		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->
	<div style="width:100%; height:100%">
<!-- 		<table id="table-1"> -->
<!-- 			<tr> -->
<!-- 				<td> -->
<!-- 					<h3>�ӫ~��Ʒs�W</h3> -->
<!-- 				</td> -->
<!-- 				<td> -->
<!-- 					<h4> -->
<!-- 						<a -->
<%-- 							href="<%=request.getContextPath()%>/back-end/product/select_page.jsp"><img --%>
<!-- 							src="images/tomcat.png" width="100" height="100" border="0">�^����</a> -->
<!-- 					</h4> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
	<%-- ���~���C --%>
<%-- 	<c:if test="${not empty errorMsgs}"> --%>
<!-- 		<font style="color: red">�Эץ��H�U���~:</font> -->
<!-- 		<ul> -->
<%-- 			<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 				<li style="color: red">${message}</li> --%>
<%-- 			</c:forEach> --%>
<!-- 		</ul> -->
<%-- 	</c:if> --%>
		<h3>��Ʒs�W:</h3>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/pro.do" enctype="multipart/form-data">
		<table>
			<tr>
				<td>�ӫ~�W��:</td>
				<td><input type="TEXT" name="p_name" size="45" <c:if test="${not empty proVO.getP_name()}">value="<%=proVO.getP_name()%>"</c:if>
					placeholder="�п�J�ӫ~�W��" /><front style="color:red">${errorMsgs.p_name}</front></td>
			</tr>
			<tr>
				<td>�ӫ~����:</td>
				<td><input type="TEXT" name="p_price" size="45" <c:if test="${not empty proVO.getP_price()}">value="<%=proVO.getP_price()%>"</c:if>
					placeholder="�п�J�ӫ~����" /><front style="color:red">${errorMsgs.p_price}</front></td>
			</tr>
			<tr>
				<td>�ӫ~�Ϥ�:</td>
				<td>
					<img alt="" src="<%=request.getContextPath()%>/product/proPic.do?p_image=${proVO.p_image}">
					<input type="file" name="p_image" id="myFile" <c:if test="${not empty proVO.getP_image()}">value="<%=proVO.getP_image()%>"</c:if>
					accept="image/gif, image/jpeg, image/png"/><br>

						<div class="row">
							<div id="preview"></div>
						</div><front style="color:red">${errorMsgs.p_image}</front></td>
				
			<tr>
				<td>�ӫ~�y�z:</td>
				<td><pre><textarea name="p_info" rows="6" cols="40"><c:if test="${not empty proVO.getP_info()}"><%=proVO.getP_info()%></c:if></textarea></pre><front style="color:red">${errorMsgs.p_info}</front></td>
			</tr>
			<tr>
				<td>�w�s�q:</td>
				<td><input type="TEXT" name="p_stock" size="45" <c:if test="${not empty proVO.getP_stock()}">value="<%=proVO.getP_stock()%>"</c:if>
					placeholder="�п�J�ӫ~�w�s�q" /><front style="color:red">${errorMsgs.p_stock}</front></td>
			</tr>
			<tr>
				<td>�ӫ~���A:</td>
				<td><select size="1" name="p_stat">
						<option value=0>�U�[
						<option value=1 selected>�W�[
				</select></td>
			</tr>

				<jsp:useBean id="ptSvc" scope="page"
					class="com.productType.model.PtService" />
				<tr>
					<td>�ӫ~����:</td>
					<td><select size="1" name="pt_id">
							<c:forEach var="ptVO" items="${ptSvc.all}">
								<option value="${ptVO.pt_id}"
									${(proVO.pt_id==ptVO.pt_id)? 'selected':'' }>${ptVO.typename}
							</c:forEach>
					</select></td>
				</tr>

			</table>
			<br> <input type="hidden" name="action" value="insert">
			<input type="submit" value="�e�X�s�W">
		</FORM>
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