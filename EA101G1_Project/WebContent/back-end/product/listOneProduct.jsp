<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.productType.model.*"%>

<%
	ProVO proVO = (ProVO) request.getAttribute("proVO");
%>

<%
	PtService ptSvc = new PtService();
	PtVO ptVO = ptSvc.getOneProductType(proVO.getPt_id());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�ӫ~���</title>
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

table td {
	word-wrap: break-word;
}
</style>

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}

td>img {
	width: 200px;
}
</style>

</head>
<body style="background-color:#17a2b8">
	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->


	<div class="content d-md-flex">


		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->
		<div class="container">
			<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
			<table id="table-1">
				<tr>
					<td>
						<h3>�ӫ~��� - ListOneProduct.jsp</h3>
						<h4>
							<a
								href="<%=request.getContextPath()%>/back-end/product/listAllProduct.jsp"><img
								src="images/back1.gif" width="100" height="32" border="0">�^����</a>
						</h4>
					</td>
				</tr>
			</table>

			<table>
				<tr>
					<th>�ӫ~�s��</th>
					<th>����</th>
					<th>�ӫ~�W��</th>
					<th>�ӫ~����</th>
					<th>�ӫ~�Ϥ�</th>
					<th>�ӫ~�y�z</th>
					<th>�P��q</th>
					<th>�w�s�q</th>
					<th>�W�[���</th>
					<th>�ӫ~���A</th>
				</tr>
				<tr>
					<td><%=proVO.getP_id()%></td>
					<td><%=ptVO.getTypename()%></td>
					<td><%=proVO.getP_name()%></td>
					<td><%=proVO.getP_price()%></td>
					<td><img
						src="<%=request.getContextPath()%>/product/proPic.do?p_id=${proVO.p_id}"></td>
					<td><%=proVO.getP_info()%></td>
					<td><%=proVO.getP_sales()%></td>
					<td><%=proVO.getP_stock()%></td>
					<td><%=proVO.getP_add_date()%></td>
					<td>${(proVO.p_stat==0)? "�U�[��":"�W�[��"}</td>
				</tr>
			</table>

		</div>
</body>
</html>