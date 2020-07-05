<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.auth.model.*"%>

<%
   AuthVO authVO = (AuthVO) request.getAttribute("authVO");
%>

<html>
<head>
<title>員工資料 - listOneAuth.jsp</title>

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
		 <h3>員工資料 - ListOneAuth.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/auth/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>員工編號</th>
		<th>功能編號</th>
		
	</tr>
	<tr>
		<td><%=authVO.getAdm_no()%></td>
		<td><%=authVO.getF_no()%></td>
		
	</tr>
</table>

</body>
</html>