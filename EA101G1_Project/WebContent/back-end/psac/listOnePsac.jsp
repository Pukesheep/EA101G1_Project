<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.psac.model.*"%>

<%
  PsacVO psacVO = (PsacVO) request.getAttribute("psacVO");
%>

<html>
<head>
<title>�峹���|�׸�� - listOnePsac.jsp</title>

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
		 <h3>�峹���|�׸�� - ListOnePsac.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/psac/select_page.jsp">�^����</a></h4>
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
		<td><%=psacVO.getPsac_no()%></td>
		<td><%=psacVO.getMem_id()%></td>
		<td><%=psacVO.getPost_id()%></td>
		<td><%=psacVO.getAdm_no()%></td>
		<td><%=psacVO.getPsac_content()%></td>
		<td><%=psacVO.getPsac_state()%></td>
	</tr>
</table>

</body>
</html>