<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.immed.model.*"%>

<%
	ImmedVO immedVO = (ImmedVO) request.getAttribute("immedVO");
%>
<%-- <%=immedVO == null%> --%>

<html>
<head>
<title>直購商品新增 - addImmed.jsp</title>

<style>
table#table-1 {
	width: 500px;
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

td.previewTd {
	display: flex;
	flex-direction: column-reverse;
}
</style>

</head>
<body>
	<table id="table-1">
		<tr>
			<td>
				<h3>直購商品資料新增 - addImmed.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/immed/images/tomcat.png"
						width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form METHOD="post" ACTION="immed.do" name="form1"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><label for="fsale_id">賣家編號:</label></td>
				<td><input type="text" name="sale_id" id="fsale_id"
					value="<%=(immedVO == null) ? "M000001" : immedVO.getSale_id()%>" /></td>
			</tr>

			<jsp:useBean id="immedSvc" scope="page"
				class="com.immed.model.ImmedService" />
			<tr>
				<td><label for="fpt_id">商品種類編號:</label></td>
				<td><select name="pt_id">
						<c:forEach var="immedVO" items="${immedSvc.all}">
							<option value="${immedVO.pt_id}">${immedVO.pt_id}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td><label for="fimmed_name">直購商品名稱:</label></td>
				<td><input type="text" name="immed_name" id="fimmed_name"
					value="${immedVO.immed_name}"></td>
			</tr>
			<tr>
				<td><label for="fimmed_prc">商品直購價:</label></td>
				<td><input type="text" name="immed_prc"
					value="<%=(immedVO == null) ? "10000" : immedVO.getImmed_prc()%>" /></td>
			</tr>
			<tr>
				<td>商品圖片:</td>
				<td class="previewTd"><input type="file"
					onchange="readURL(this)" name="immed_pic" targetID="preview_img"
					accept="image/gif, image/jpeg, image/png"> <img
					style="display: none;" id="preview_img">
				<td>
			</tr>
			<tr>
				<td><label for="fimmed_desc">商品描述:</label></td>
				<td><textarea style="width: 350px; height: 250px;"
						name="immed_desc" id="fimmed_desc"
						value="<%=(immedVO == null) ? "10000" : immedVO.getImmed_desc()%>"> </textarea></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</form>

	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var img_box = document.getElementById('preview_img');
				img_box.setAttribute('style',
						'display:inline-block; width:200px;');
				var imageTagID = input.getAttribute("targetID");
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = document.getElementById(imageTagID);
					img.setAttribute("src", e.target.result)
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>

</body>
</html>