<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.immed.model.*"%>

<%
	ImmedVO immedVO = (ImmedVO) request.getAttribute("immedVO"); //ImmedServlet.java (Concroller) �s�Jreq��immedVO���� (�]�A�������X��immedVO, �]�]�A��J��ƿ��~�ɪ�immedVO����)
%>

<html>
<head>
<title>���ʰӫ~�ק� - update_immed_jsp</title>
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

table td img.immed_pic {
	width: 150px;
}

h4 {
	color: blue;
	display: inline;
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
				<h3>���ʰӫ~��ƭק� - update_immed_input.jsp</h3>
				<h4>
					<a href="select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>���ʰӫ~��ƭק�:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form METHOD="post" ACTION="immed.do" name="form1">
		<table>
			<tr>
				<td>���ʰӫ~�s��:<font color=red><b>*</b></font></td>
				<td><%=immedVO.getImmed_id()%></td>
			</tr>
			<tr>
				<td>��a�s��:</td>
				<td><%=immedVO.getSale_id()%></td>
			</tr>
			<tr>
				<td>�R�a�s��:</td>
				<td><input type="TEXT" name="buy_id" size="45"
					value="<%=immedVO.getBuy_id()%>" /></td>
			</tr>
			<tr>
				<td>���ʰӫ~�����s��:</td>
				<td><input type="TEXT" name="pt_id" size="45"
					value="<%=immedVO.getPt_id()%>" /></td>
			</tr>
			<tr>
				<td>���ʰӫ~�W��:</td>
				<td><input type="TEXT" name="immeed_name" size="45"
					value="<%=immedVO.getImmed_name()%>" /></td>
			</tr>
			<tr>
				<td>�ӫ~���ʻ�:</td>
				<td><input type="TEXT" name="immeed_prc" size="45"
					value="<%=immedVO.getImmed_name()%>" /></td>
			</tr>
			<tr>
				<td>���ʰӫ~�Ϥ�:</td>
				<td class="previewTd"><input type="file"
					onchange="readURL(this)" name="immed_pic" targetID="preview_img"
					accept="image/gif, image/jpeg, image/png"> <img
					style="width:200px;" id="preview_img"
					src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}">
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="immed_id" value="<%=immedVO.getImmed_id()%>">
		<input type="submit" value="�e�X�ק�">
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