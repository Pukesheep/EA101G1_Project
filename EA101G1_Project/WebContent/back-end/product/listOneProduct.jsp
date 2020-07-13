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
<title>商品資料</title>
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
<body bgcolor='white'>
	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->
		<div>
			<h4>此頁暫練習採用 Script 的寫法取值:</h4>
			<table id="table-1">
				<tr>
					<td>
						<h3>商品資料 - ListOneProduct.jsp</h3>
						<h4>
							<a
								href="<%=request.getContextPath()%>/back-end/product/select_page.jsp"><img
								src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
						</h4>
					</td>
				</tr>
			</table>

			<table>
				<tr>
					<th>商品編號</th>
					<th>分類</th>
					<th>商品名稱</th>
					<th>商品價格</th>
					<th>商品圖片</th>
					<th>商品描述</th>
					<th>銷售量</th>
					<th>庫存量</th>
					<th>上架日期</th>
					<th>商品狀態</th>
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
					<td>${(proVO.p_stat==0)? "下架中":"上架中"}</td>
				</tr>
			</table>

		</div>
</body>
</html>