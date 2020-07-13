<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.psac.model.*"%>
<%
	PsacVO psacVO = (PsacVO) request.getAttribute("psacVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�峹���|�׷s�W - addPsac.jsp</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>
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
	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->
		<div class="container">
			<table id="a">
				<tr>
					<td>
						<h3>�峹���|�׷s�W - addPsac.jsp</h3>
					</td>
					<td>
						<h4>
							<a
								href="<%=request.getContextPath()%>/back-end/psac/select_page.jsp">�^����</a>
						</h4>
					</td>
				</tr>
			</table>

			<h3>��Ʒs�W:</h3>

			<%-- ���~��C --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">�Эץ��H�U���~:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>

			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/psac/psac.do" name="form1">
				<table>
					<%--
	<tr>
		<td>���|�׽s��:</td>
		<td><input type="TEXT" name="psac_no" size="45" 
			 value="<%= (psacVO==null)? "p000001" : psacVO.getPsac_no()%>" /></td>
	</tr>
 --%>
					<tr>
						<td>���|�̽s��:</td>
						<td><input type="TEXT" name="mem_id" size="45"
							value="<%=(psacVO == null) ? "M000001" : psacVO.getMem_id()%>" /></td>
					</tr>
					<tr>
						<td>���|�峹�s��:</td>
						<td><input type="TEXT" name="post_id" size="45"
							value="<%=(psacVO == null) ? "POST000001" : psacVO.getPost_id()%>" /></td>
					</tr>
					<tr>
						<td>�޲z���s��:</td>
						<td><input type="TEXT" name="adm_no" size="45"
							value="<%=(psacVO == null) ? "ad000001" : psacVO.getAdm_no()%>" /></td>
					</tr>
					<tr>
						<td>���|�פ��e:</td>
						<td><input type="TEXT" name="psac_content" size="45"
							value="<%=(psacVO == null) ? "" : psacVO.getPsac_content()%>" /></td>
					</tr>
					<tr>
						<td>���|�ת��A:</td>
						<td><input type="TEXT" name="psac_state" size="45"
							value="<%=(psacVO == null) ? "" : psacVO.getPsac_state()%>" /></td>
					</tr>
				</table>
				<br> <input type="hidden" name="action" value="insert">
				<input type="submit" value="�e�X�s�W">
			</FORM>
		</div>
</body>
</html>