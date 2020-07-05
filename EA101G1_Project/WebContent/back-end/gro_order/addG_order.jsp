<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.gro_order.model.*"%>

<%
	Gro_orderVO g_orderVO = (Gro_orderVO) request.getAttribute("g_orderVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
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
<body>
<table id="table-1">
		<tr>
			<td>
				<h3>addCMessage.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/gro_order/select_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/back-end/gro_order/Gro_order.do"
		name="form1">
		<table>

			<tr>
				<td>參加成員ID:</td>
				<td><input type="TEXT" name="mem_Id" size="45"
					value="<%=(g_orderVO == null) ? "M000003" : g_orderVO.getMem_Id()%>" /></td>
			</tr>

			<tr>
				<td>團購案ID:</td>
				<td><input type="TEXT" name="gro_Id" size="45"
					value="<%=(g_orderVO == null) ? "G000000001" : g_orderVO.getGro_Id()%>" /></td>
			</tr>
			<tr>
				<td>訂單狀態編號:</td>
				<td><input type="TEXT" name="ordstat_Id" size="45"
					value="<%=(g_orderVO == null) ? "003" : g_orderVO.getOrdstat_Id()%>" /></td>
			</tr>

			<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
			<!-- 	<tr> -->
			<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
			<!-- 		<td><select size="1" name="deptno"> -->
			<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
			<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname} --%>
			<%-- 			</c:forEach> --%>
			<!-- 		</select></td> -->
			<!-- 	</tr> -->

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>

</html>