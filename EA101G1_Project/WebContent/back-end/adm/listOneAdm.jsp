<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.adm.model.*"%>

<%
   AdmVO admVO = (AdmVO) request.getAttribute("admVO");
%>

<html>
<head>
<title>���u��� - listOneAdm.jsp</title>

<style>
  table#a {
	width: 100%;
	background-color: #5588DD;
	margin-top: 20px;
	margin-bottom: 20px;
    border: 5px solid Gray;
    height: 50px;
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

<table id="a">
	<tr><td>
		 <h3>���u��� - ListOneAdm.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/adm/select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>���|�׽s��</th>
		<th>���|�̽s��</th>
		<th>���|�峹�s��</th>
		<th>�޲z���s��</th>
		<th>���|�פ��e</th>
		<th>���|�ת��A</th>
	</tr>
	<tr>
		<td><%=admVO.getAdm_no()%></td>
		<td><%=admVO.getAdm_acco()%></td>
		<td><%=admVO.getAdm_pass()%></td>
		<td><%=admVO.getAdm_name()%></td>
		<td><%=admVO.getAdm_state()%></td>
	</tr>
</table>

</body>
</html>