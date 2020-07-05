<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.psac.model.*"%>

<%
  PsacVO psacVO = (PsacVO) request.getAttribute("psacVO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�峹���|�׭ק� - update_psac_input.jsp</title>

<style>
  table#table-1 {
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
	width: 100%;
	background-color: #5588DD;
	margin-top: 20px;
	margin-bottom: 20px;
    border: 5px solid Gray;
    height: 50px;
    text-align: center;
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
	<tr><td>
		 <h3>�峹���|�׭ק� - update_psac_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/psac/select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="psac.do" name="form1">
<table>
	<tr>
		<td>���|�׽s��:<font color=red><b>*</b></font></td>
		<td><%=psacVO.getPsac_no()%></td>
	</tr>
	<tr>
		<td>���|�̽s��:</td>
		<td><input type="TEXT" name="mem_id" size="45" value="<%=psacVO.getMem_id()%>" /></td>
	</tr>
	<tr>
		<td>���|�峹�s��:</td>
		<td><input type="TEXT" name="post_id" size="45"	value="<%=psacVO.getPost_id()%>" /></td>
	</tr>
	<tr>
		<td>�޲z���s��:</td>
		<td><input type="TEXT" name="adm_no" size="45"	value="<%=psacVO.getAdm_no()%>" /></td>
	</tr>
	<tr>
		<td>���|�פ��e:</td>
		<td><input type="TEXT" name="psac_content" size="45"	value="<%=psacVO.getPsac_content()%>" /></td>
	</tr>
	<tr>
		<td>���|�ת��A:</td>
		<td><input type="TEXT" name="psac_state" size="45" value="<%=psacVO.getPsac_state()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="psac_no" value="<%=psacVO.getPsac_no()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>
</html>