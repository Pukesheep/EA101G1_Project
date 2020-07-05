<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.feat.model.*"%>
<%
   FVO fVO = (FVO) request.getAttribute("fVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>功能新增 - addFeat.jsp</title>

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
		 <h3>功能新增 - addFeat.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/back-end/feat/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="feat.do" name="form1">
<table>

	<tr>
		<td>功能性質:</td>
		<td><input type="TEXT" name="f_type" size="45"
			 value="<%= (fVO==null)? "anthoney" : fVO.getF_type()%>" /></td>
	</tr>
	
</table>
<br>

<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>
</html>