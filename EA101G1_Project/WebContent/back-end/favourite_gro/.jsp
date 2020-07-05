<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.gro_order.model.*"%>
<%
Gro_orderVO g_orderVO = (Gro_orderVO) request.getAttribute("g_orderVO");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UtF-8">
<title>Insert title here</title>

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
	width: 600px;
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
</style>
</head>
<body>
	<table>
		<tr>
		
			<th>團購訂單ID</th>
			<th>會員ID</th>
			<th>訂單狀態ID</th>
			<th>團購案_ID</th>
			<th>訂單日期</th>
			
			
		</tr>
		<tr>
			<td>${g_orderVO.ord_Id}</td>
			<td>${g_orderVO.mem_Id}</td>
			<td>${g_orderVO.ordstat_Id}</td>
			<td>${g_orderVO.gro_Id}</td>
			<td>${g_orderVO.add_Date}</td>
		</tr>
	</table>
</body>
</html>