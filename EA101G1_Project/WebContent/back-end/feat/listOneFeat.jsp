<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.feat.model.*"%>

<%
   FVO fVO = (FVO) request.getAttribute("fVO");
%>

<html>
<head>
<title>功能性質 - listOneFeat.jsp</title>

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
		 <h3>功能性質 - ListOneFeat.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/feat/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>功能編號</th>
		<th>功能性質</th>
		
	</tr>
	<tr>
		<td><%=fVO.getF_no()%></td>
		<td><%=fVO.getF_type()%></td>
		
	</tr>
</table>

</body>
</html>