<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.gro_mem.model.*"%>

<%
	Gro_memVO gro_memVO = (Gro_memVO) request.getAttribute("gro_memVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>團購成員新增 - addGro_memupBuy.jsp</title>

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
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>團購成員新增 - addGromem.jsp</h3>
			</td>
			<td></td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/gromem/select_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>團購新增:</h3>
    
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/gro_mem/gro_mem.do" name="form1">
		<table>
			
			
				<jsp:useBean id="gromemSvc" scope="page"
				class="com.gro_mem.model.Gro_memService" />
				
				<tr>
				<td>團購案:</td>
				<td><input type="TEXT" name="gro_Id" size="20"
					value="<%=(gro_memVO == null) ? "" : gro_memVO.getGro_Id()%>" /></td>
			</tr>
			<tr>
				<td>會員編號:</td>
				<td><input type="TEXT" name="mem_Id" size="20"
					value="<%=(gro_memVO == null) ? "" : gro_memVO.getMem_Id()%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> 
				<input type="submit" value="送出新增">
	</FORM>
	
</body>

