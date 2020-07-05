<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adm.model.*"%>
<%
AdmVO admVO = (AdmVO) request.getAttribute("admVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u�s�W - addAdm.jsp</title>

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
		 <h3>���u�s�W - addAdm.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/back-end/adm/select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adm/adm.do" name="form1">
<table>

	<tr>
		<td>���u�b��:</td>
		<td><input type="TEXT" name="adm_acco" size="45"
			 value="<%= (admVO==null)? "anthoney" : admVO.getAdm_acco()%>" /></td>
	</tr>
	<tr>
		<td>���u�K�X:</td>
		<td><input type="TEXT" name="adm_pass" size="45"
			 value="<%= (admVO==null)? "123456" : admVO.getAdm_pass()%>" /></td>
	</tr>
	<tr>
		<td>���u�m�W:</td>
		<td><input type="TEXT" name="adm_name" size="45"
			 value="<%= (admVO==null)? "anthoney" : admVO.getAdm_name()%>" /></td>
	</tr>
	<tr>
		<td>���u���A:</td>
		<td><input type="TEXT" name="adm_state" size="45"
			 value="<%= (admVO==null)? "" : admVO.getAdm_state()%>" /></td>
	</tr>
</table>
<br>

<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>
</html>