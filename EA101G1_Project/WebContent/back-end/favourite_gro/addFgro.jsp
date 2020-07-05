<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.favourite_gro.model.*"%>

<%
	Favourite_groVO favourite_groVO = (Favourite_groVO) request.getAttribute("fgroVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>我的最愛團購新增 - addFgro.jsp</title>

<style>
table {
	
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

#preview img{
width:500px;
heigh:300px;
	
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>我的最愛團購成員新增 - addFgro.jsp</h3>
			</td>
			<td></td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/favourite_gro/select_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>我的最愛新增:</h3>
    
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/favourite_gro/favourite_gro.do" name="form1">
		<table>
			
			
				<jsp:useBean id="fgroSvc" scope="page"
				class="com.favourite_gro.model.Favourite_groService" />
				
				<tr>
				<td>會員編號:</td>
				<td><input type="TEXT" name="mem_Id" size="20"
					value="<%=(favourite_groVO == null) ? "" : favourite_groVO.getMem_Id()%>" /></td>
			</tr>
				
				<tr>
				<td>收藏追蹤對象:</td>
				<td><input type="TEXT" name="gro_Id" size="20"
					value="<%=(favourite_groVO == null) ? "" : favourite_groVO.getGro_Id()%>" /></td>
			</tr>
			

		</table>
		<br> <input type="hidden" name="action" value="insert"> 
				<input type="submit" value="送出新增">
	</FORM>
	
</body>

