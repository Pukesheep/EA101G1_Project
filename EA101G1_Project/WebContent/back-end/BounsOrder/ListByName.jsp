<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.BounsOrder.model.*" %>

<%
	List<BOVO> list = (java.util.List<BOVO>) request.getAttribute("list");
%>

<jsp:useBean id="bsSvc" scope="page" class="com.BounsState.model.BSService"/>
<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService"/>

<html>
<head>
<title>���Q�q��_�ӫ~�W�٬d��</title>
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
	</style>
</head>

<body bgcolor="white">
	
	<table id="table-1">
		<tr>
			<td>
				<h3>���Q�q��_�ӫ~�W�٬d�� - /back-end/ListByName.jsp</h3>
			 	<h4>
			 		<a href="<%=request.getContextPath()%>/back-end/BounsOrder/select_page.jsp">
				 	<img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
				 </h4>
			</td>
		</tr>
	</table>

	<%-- ���~���C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<table>
		<tr>
			<th>�q��s��</th>
			<th>�|���s��</th>
			<th>���Q�ӫ~�W��</th>
			<th>�U�q���</th>
			<th>�q�檬�A</th>
			<th colspan="2">����ʧ@</th>
		</tr>
		<%@ include file="../../files/page1.file" %>
		<c:forEach var="boVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
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
		</c:forEach>
	</table>
	<%@ include file="../../files/page2.file" %>
	
</body>
</html>