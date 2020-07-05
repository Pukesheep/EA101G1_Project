<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.BounsOrder.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    BOService bmSvc = new BOService();
    List<BOVO> list = bmSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="deptSvc" scope="page" class="com.BounsMall.model.BMService" />

<html>
<head>
<title>�Ҧ��q����</title>

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
<body bgcolor='white'>

	<table id="table-1">
		<tr><td>
			<h3>�Ҧ��q����</h3>
<!-- 			<h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4> -->
		</td></tr>
	</table>
	
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~�G</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<table>
		<tr>
			<td>�q��s��</td>
			<td>�|���s��</td>
			<td>���Q�ӫ~�s��</td>
			<td>�U�w���</td>
			<td>�q�檬�A�s��</td>
			<th colspan="2">�����椧�ʧ@</th>
		</tr>
		<%@ include file="../../files/page1.file" %>
		<c:forEach var="bmVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${bmVO.ord_id}</td>
				<td>${bmVO.mem_id}</td>
				<td>${bmVO.bon_id}</td>
				<td>${bmVO.ord_Date}</td>
				<td>${bmVO.bs_id}</td>
				<td>
					<form method="post" action="<%=request.getContextPath()%>/">
					</form>
				</td>
				<td>
					
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>