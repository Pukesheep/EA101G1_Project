<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.BounsOrder.model.*" %>

<%
	BOVO boVO = (BOVO) request.getAttribute("boVO");
%>

<jsp:useBean id="bsSvc" scope="page" class="com.BounsState.model.BSService"/>
<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService"/>

<html>
<head>
<title>��@���Q�q��d��</title>
	<style>
		table#table-1 {
			background-color: #CCCCFF;
			border: 2px solid black;
			text-align: center;
		}
		table#table-1 h4 {
			color:red;
			display: block;
			margin-bottom: 1px;
		}
		h4 {
			color: red;
			display: block;
			margin-bottom: 1px;
		}
	</style>
	<style>
		table {
			width: 800px;
			background-color: white;
			margin-top: 5px;
			margin-bottom: 5px;
		}
		table, th, td{
			border: 1px solid #CCCCFF;
		}
		th, td {
			padding: 5px;
			text-align: center;
		}
		img#display {
			width: 200px;
		}
	</style>
</head>
<body bgcolor="white">
	<table id="table-1">
		<tr>
			<td>
				<h3>���Q�ӫ~��� - /back-end/ListOne.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/BounsOrder/select_page.jsp">
					<img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<th>�q��s��</th>
			<th>�|���s��</th>
			<th>���Q�ӫ~�W��</th>
			<th>�U�q���</th>
			<th>�q�檬�A</th>
			<th colspan="2">����ʧ@</th>
		</tr>
		
		<tr>
			<td>${boVO.ord_id}</td>
			<td>${boVO.mem_id}</td>
			<td>${bmSvc.getByPK(boVO.bon_id).bon_name}</td>
			<td>${boVO.ord_Date}</td>
			<td>${bsSvc.getOneBS(boVO.bs_id).bs_stat}</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" style="margin-bottom: 0px;">
					<input type="hidden" name="ord_id" value="${boVO.ord_id}">
					<input type="hidden" name="action" value="getOne_For_Update">
					<input type="submit" value="�ק�" >
				</form>
			</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" style="margin-bottom: 0px;">
					<input type="hidden" name="ord_id" value="${boVO.ord_id}">
					<input type="hidden" name="action" value="delete">
					<input type="submit" value="�R��" >
				</form>
			</td>
		</tr>
	</table>
</body>
</html>