<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.BounsOrder.model.*" %>

<%
	List<BOVO> list = (List<BOVO>) request.getAttribute("list");
%>

<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService" />
<jsp:useBean id="bsSvc" scope="page" class="com.BounsState.model.BSService"/>

<!DOCTYPE html>
<html>
<head>
	<title>會員紅利訂單查詢</title>
	<style>
		table#table-1 {
			width: 450px;
			background-color: #CCCCFF;
			margin-top: 5px;
			margin-bottom: 10px;
			border: 3px ridge Gray;
			height: 80px;
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
<body bgcolor='white'>
	<table id="table-1">
		<tr>
			<td>
				<h3>會員紅利訂單查詢 - /back-end/ListAll.jsp</h3>
<!-- 				<h4> -->
<%-- 					<a href="<%=request.getContextPath()%>/back-end/BounsOrder/select_page.jsp"> --%>
<!-- 						<img src="images/back1.gif" width="100" height="32" border="0">回首頁</a> -->
<!-- 				</h4> -->
			</td>
		</tr>
	</table>
	
<!-- 	錯誤列表 -->
	<c:if test="">
		<font style="color:red">請修正以下錯誤：</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<table>
		<tr>
			<th>訂單編號</th>
			<th>會員編號</th>
			<th>紅利商品名稱</th>
			<th>下訂日期</th>
			<th>訂單狀態</th>
			<th>執行動作</th>
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
						<input type="hidden" name="mem_id" value="${boVO.mem_id}">
						<input type="hidden" name="action" value="cancel">
						<input type="submit" value="取消訂單" >
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="../../files/page2.file" %>
	
</body>
</html>