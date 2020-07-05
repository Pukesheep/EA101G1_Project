<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.rebate.model.*"%>

<%
	RebateVO rebateVO = (RebateVO) request.getAttribute("rebVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>折扣新增 - addRebate.jsp</title>

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
				<h3>折扣級距新增 - addRebate.jsp</h3>
			</td>
			<td></td>
			<td>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back-end/rebate/select_page.jsp"><img
						src="images/tomcat.png" width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>團購級距新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/rebate/rebate.do" name="form1">
		<table>
			<jsp:useBean id="rebSvc" scope="page"
			class="com.rebate.model.RebateService" />
			    <li>
					<b>級距編號:</b> <select size="1" name="reb_No">
						<c:forEach var="rebate" items="${rebSvc.all}">
							<option value="${rebate.reb_No}">${rebate.reb_No}
						</c:forEach>
					</select> 
				</li>
			 <li>
					<b>折扣方案:</b> <select size="1" name="discount">
						<c:forEach var="rebate" items="${rebSvc.all}">
							<option value="${rebate.discount}">${rebate.discount}
						</c:forEach>
					</select> 
				</li>
			</li>
			<tr>
				<td>人數:</td>
				<td><input type="TEXT" name="people" size="20"
					value="<%=(rebateVO == null) ? "" : rebateVO.getPeople()%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>
</ul>

</script>
</html>
