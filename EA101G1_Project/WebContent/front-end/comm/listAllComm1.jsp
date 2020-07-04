<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.comm.model.*" %>

<%--
	�H�d�����D��, ���X�g�d���N�|���X�g�������峹
 --%>

<%
	CommService commSvc = new CommService();
	java.util.List<CommVO> list = commSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="postSvc" scope="page" class="com.post.model.PostService" />
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

<html>
<head>
<title>�Ҧ��d����� - listAllComm.jsp</title>

<style>
	table#table-1 {
		width: 100%;
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
	
	table {
		width: 100%;
		background-color: white;
		margin-top: 5px;
		margin-bottom: 5px;
		text-align: center;
	}
	
	td#text {
		text-align: left;
	}
	
	table, th, td {
		padding: 5px;
	}
	/*
	th, td {
		width: 100%;
		height: 100%;
	}
	*/
	body {
		background-color: white;
	}
	img {
		width: 100px;
		height: 32px;
	}
	font {
		color: red;
	}
	#errormsg {
		color: red;
	}
	img#display {
		width: 200px;
		height: 200px;
	}
	tr.tr1 {
		border: 1px solid red;
	}
	tr.tr2 {
		border: 1px solid blue;
	}
</style>

</head>
<body>

<h4>�����m�߱ĥ� EL ���g�k����</h4>
<table id="table-1">
	<tr>
		<td>
			<h3>�Ҧ��d����� - listAllComm.jsp</h3>
			<h4>
				<a href="<%=request.getContextPath()%>/front-end/comm/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">�^����</a>
			</h4>
		</td>
	</tr>
</table>

<%-- ���~�C�� --%>
<c:if test="${not empty errorMsgs}">
	<font>�Эץ��H�U���~</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li id="errormsg">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�峹�s��</th>
		<th>�峹�|���s��</th>
		<th>�峹�|���W��</th>
		<th>�峹���D</th>
		<th>�峹���e</th>
		<th>�峹���[�Ϥ�</th>
		<th>�峹�̫�ק�ɶ�</th>
		<th>�峹�o��ɶ�</th>
	
	
		<th>�d���s��</th>
		<th>�d���|���s��</th>
		<th>�d���|���W��</th>
		<th>�d�����A</th>
		<th>�d�����e</th>
		<th>�d���̫�ק�ɶ�</th>
		<th>�d���ɶ�</th>
	</tr>
<%@ include file="../../files/page1.file" %>
	<c:forEach var="commVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"   >
		<c:forEach var="postVO" items="${postSvc.all}">
			<c:if test="${commVO.post_id == postVO.post_id}">
				<tr>
					<c:forEach var="memberVO" items="${memberSvc.all}">
						
							<c:if test="${commVO.post_id == postVO.post_id}">
							
								<c:if test="${postVO.mem_id == memberVO.mem_id}">
									
									<td>
										${commVO.post_id}
									</td>
									<td>
										${postVO.mem_id}
									</td>
									<td>
										${memberVO.mem_name}
									</td>
									<td>
										${postVO.p_title}
									</td>
									<td>
										${postVO.text}
									</td>
									<td>
										<img alt="" src="<%=request.getContextPath()%>/post/ShowPostPic.do?post_id=${postVO.post_id}" id="display">
									</td>
									<td>
										${postVO.last_edit}
									</td>
									<td>
										${postVO.post_time}
									</td>
										
								</c:if>
								
							</c:if>
						
						
					</c:forEach>
				
				
				
					<c:forEach var="memberVO1" items="${memberSvc.all}">
					
						<c:if test="${commVO.mem_id == memberVO1.mem_id}">
							
							<td>
								${commVO.comm_id}
							</td>
							<td>
								${commVO.mem_id}
							</td>
							<td>
								${memberVO1.mem_name}
							</td>
							<td>
								${commVO.c_status}
							</td>
							<td>
								${commVO.c_text}
							</td>
							<td>
								${commVO.last_edit}
							</td>
							<td>
								${commVO.post_time}
							</td>
							
						</c:if>
								
					</c:forEach>
						
				</tr>
							
				
			</c:if>
		</c:forEach>
	</c:forEach>

</table>

<%@ include file="../../files/page2.file" %>

</body>
</html>