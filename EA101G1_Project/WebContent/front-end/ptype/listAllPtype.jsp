<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ptype.model.*" %>

<%
	PtypeService ptypeSvc = new PtypeService();
	java.util.List<PtypeVO> list = ptypeSvc.getAll();
	pageContext.setAttribute("list", list);
	PtypeVO ptypeVO = (PtypeVO) request.getAttribute("ptypeVO");
%>

<html>
<head>
<title>所有文章類型資料 - listAllPtype.jsp</title>

<style>
	table#table-1 {
		width: 100%;
		background-color: #CCCCFF;
		border: 2px solid black;
		text-align: center;
	}
	table#table-2, table#table-3 {
		width: 50%;
		text-align: center;
		border: 2px solid black;
		margin: 50px auto;
		border-collapse: collapse;
	}
	table#table-2 th {
		border: 1px solid black;
	}
	table#table-2 td {
		border: 1px solid black;
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
		width: 100%;
		background-color: white;
		margin-top: 5px;
		margin-bottom: 5px;
		text-align: center;
	}
	
	td#text {
		text-align: left;
	}
	
	table, th, td {
		padding: 5px;
	}
	/*
	th, td {
		width: 100%;
		height: 100%;
	}
	*/
	body {
		background-color: white;
	}
	img {
		width: 100px;
		height: 32px;
	}
	font {
		color: red;
	}
	#errormsg {
		color: red;
	}
	img#display {
		width: 200px;
		height: 200px;
	}
</style>

</head>
<body>

<table id="table-1">
	<tr>
		<td>
			<h3>所有文章類型 - listAllPtype.jsp</h3>
			<h4><a href="<%=request.getContextPath()%>/front-end/post/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">回首頁</a></h4>
		</td>
	</tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<ul>
		<c:forEach var="message" items="errorMsgs">
			<li id="errormsg">
				${message}
			</li>
		</c:forEach>
	</ul>
</c:if>

<table id="table-2">
	<tr>
		<th colspan="2">現有文章類型</th>
	</tr>
	<tr>
		<th>文章類型編號</th>
		<th>文章類型</th>
	</tr>
	<c:forEach var="ptypeVO" items="${list}">
		<tr>
			<td>
				${ptypeVO.ptype_id}
			</td>
			<td>
				${ptypeVO.type}
			</td>
		</tr>
	</c:forEach>
</table>

<form action="<%=request.getContextPath()%>/ptype/ptype.do" method="post">

	<table id="table-3">
		<tr>
			<th colspan="2">
				新增文章類型
			</th>
		</tr>
		<tr>
			<td>
				文章類型：
			</td>
			<td>
				<input type="text" name="type" value="<%= (ptypeVO == null) ? "請輸入新增的類型" : ptypeVO.getType() %>">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="hidden" name="action" value="insert">
				<input type="submit" value="送出新增">
			</td>
		</tr>
	</table>
	<br>
</form>

</body>
</html>