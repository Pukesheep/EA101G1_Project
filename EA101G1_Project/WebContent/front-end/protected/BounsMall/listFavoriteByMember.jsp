<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.FavoriteBouns.model.*" %>

<%
	List<FBVO> list = (List<FBVO>) request.getAttribute("list");
%>

<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService"/>

<html>
<head>
	<title>穦程稲琩高</title>
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
				<h3>穦程稲琩高 - /front-end/listFavoriteByMember.jsp</h3>
<!-- 				<h4> -->
<%-- 					<a href="<%=request.getContextPath()%>/back-end/FavoriteBouns/select_page.jsp"> --%>
<!-- 						<img src="images/back1.gif" width="100" height="32" border="0"></a> -->
<!-- 				</h4> -->
			</td>
		</tr>
	</table>
	
<!-- 	岿粇 -->
	<c:if test="">
		<font style="color:red">叫タ岿粇</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<table>
		<tr>
			<th>坝珇</th>
			<th>坝珇篈</th>
			<th>程稲</th>
		</tr>
		
		<%@ include file="../../../files/page1.file" %>
		<c:forEach var="fbVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${bmSvc.getByPK(fbVO.bon_id).bon_name}</td>
				<td>${bmSvc.getByPK(fbVO.bon_id).bon_status==0? "琜":"琜"}</td>
				<td>
					<form method="post" action="<%=request.getContextPath()%>/FavoriteBouns/FBServlet.do" style="margin-bottom: 0px;">
						<input type="hidden" name="mem_id" value="${fbVO.mem_id}">
						<input type="hidden" name="bon_id" value="${fbVO.bon_id}">
						<input type="hidden" name="action" value="cancel">
						<input type="submit" value="" >
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="../../../files/page2.file" %>
	
</body>
</html>