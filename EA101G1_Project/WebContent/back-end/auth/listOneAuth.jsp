<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.auth.model.*"%>

<%
   AuthVO authVO = (AuthVO) request.getAttribute("authVO");
%>

<html>
<head>
<title>���u��� - listOneAuth.jsp</title>

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
	width: 600px;
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
		 <h3>���u��� - ListOneAuth.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/auth/select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>���u�s��</th>
		<th>�\��s��</th>
		
	</tr>
	<tr>
		<td><%=authVO.getAdm_no()%></td>
		<td><%=authVO.getF_no()%></td>
		
	</tr>
</table>

</body>
</html>