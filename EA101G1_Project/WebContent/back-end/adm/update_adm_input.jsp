<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adm.model.*"%>

<%
  AdmVO admVO = (AdmVO) request.getAttribute("admVO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工修改 - update_adm_input.jsp</title>

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

<table id="a">
	<tr><td>
		 <h3>員工修改 - update_adm_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/adm/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="adm.do" name="form1">
<table>
	<tr>
		<td>員工編號:<font color=red><b>*</b></font></td>
		<td><%=admVO.getAdm_no()%></td>
	</tr>
	<tr>
		<td>員工帳號:</td>
		<td><input type="TEXT" name="adm_acco" size="45" value="<%=admVO.getAdm_acco()%>" /></td>
	</tr>
	<tr>
		<td>員工密碼:</td>
		<td><input type="TEXT" name="adm_pass" size="45"	value="<%=admVO.getAdm_pass()%>" /></td>
	</tr>
	<tr>
		<td>員工姓名:</td>
		<td><input type="TEXT" name="adm_name" size="45"	value="<%=admVO.getAdm_name()%>" /></td>
	</tr>
	<tr>
		<td>員工狀態:</td>
		<td><input type="TEXT" name="adm_state" size="45" value="<%=admVO.getAdm_state()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="psac_no" value="<%=admVO.getAdm_no()%>">
<input type="submit" value="送出修改"></FORM>
</body>
</html>