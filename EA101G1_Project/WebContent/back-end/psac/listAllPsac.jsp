<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.psac.model.*"%>
<%@ page import="com.adm.model.*"%>
<%
    PsacService psacSvc = new PsacService();
    List<PsacVO> list = psacSvc.getStateEq0();
    pageContext.setAttribute("list",list);
    AdmVO admVO  = (AdmVO) session.getAttribute("admVO");
%>

<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
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

<table id="a">
	<tr><td>
		 <h3>�Ҧ��峹���|�׸�� - listAllPsac.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/psac/select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>���|�׽s��</th>
		<th>���|�̽s��</th>
		<th>���|�峹�s��</th>
		<th>�޲z���s��</th>
		<th>���|�פ��e</th>
		<th>���|�ת��A</th>
		<th>���|����</th>
		<th>���|������</th>
	</tr>
	<%@ include file="../../files/page1.file" %> 
	<c:forEach var="psacVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${psacVO.psac_no}</td>
			<td>${psacVO.mem_id}</td>
			<td>${psacVO.post_id}</td>
			<td>${psacVO.adm_no}</td>
			<td>${psacVO.psac_content}</td>
			<td>${psacVO.psac_state}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�T�{">
			     <input type="hidden" name="psac_no"  value="${psacVO.psac_no}">
			     <input type="hidden" name="mem_id"  value="${psacVO.mem_id}">
			     <input type="hidden" name="post_id"  value="${psacVO.post_id}">
			     <input type="hidden" name="adm_no"  value="${admVO.adm_no}">
			     <input type="hidden" name="psac_content"  value="${psacVO.psac_content}">
			     <input type="hidden" name="psac_state"  value="${psacVO.psac_state}">
			     <input type="hidden" name="action"	value="psacConfirm">
		    </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�T�{">
			     <input type="hidden" name="psac_no"  value="${psacVO.psac_no}">
			     <input type="hidden" name="action" value="psacDenied">
			  </FORM>
			</td>
		</tr>
		
	</c:forEach>
</table>
<%@ include file="../../files/page2.file" %>

</body>
</html>