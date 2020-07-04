<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.favpost.model.*" %>

<%--
	�H���ä峹���D��, ���h�ֵ����ä峹����ƴN�|���X�g�������峹
	�m�ߦb view �̭��Q�� Service.java �H�� VO �� join 
 --%>

<%
	FavpostService favpostSvc = new FavpostService();
	java.util.List<FavpostVO> list = favpostSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="postSvc" scope="page" class="com.post.model.PostService" />
<jsp:useBean id="ptypeSvc" scope="page" class="com.ptype.model.PtypeService" />

<html>
<head>
<title>�Ҧ����ä峹��� - listAllFavpost.jsp</title>

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
</style>

</head>
<body>

<h4>�����m�߱ĥ� EL ���g�k����</h4>
<table id="table-1">
	<tr>
		<td>
			<h3>�Ҧ����ä峹��� - listAllFavpost.jsp</h3>
			<h4><a href="<%=request.getContextPath()%>/front-end/post/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">�^����</a></h4>
		</td>
	</tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li id="errormsg">
				${message}
			</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�峹�s��</th>
		<th>�o��|���s��</th>
		<th>�o��|���W��</th>
		<th>�峹����</th>
		<th>�峹���A</th>
		<th>�峹���D</th>
		<th>�峹���e</th>
		<th>���[�Ϥ�</th>
		<th>�̫�ק�ɶ�</th>
		<th>�o��ɶ�</th>
		<th>���÷|���s��</th>
		<th>���÷|���W��</th>
	</tr>
	
<%@ include file="../../files/page1.file" %>
	<c:forEach var="favpostVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<c:forEach var="postVO" items="${postSvc.all}">
		
			<c:if test="${favpostVO.post_id == postVO.post_id}">
			
				<tr>
				
					<c:forEach var="memberVOpost" items="${memberSvc.all}">
						
						<c:if test="${postVO.mem_id == memberVOpost.mem_id}">
							
							<td>
								${favpostVO.post_id}
							</td>
							<td>
								${postVO.mem_id}
							</td>
							<td>
								${memberVOpost.mem_name}
							</td>
							<td>
								<c:forEach var="ptypeVO" items="${ptypeSvc.all}">
									
									<c:if test="${postVO.ptype_id == ptypeVO.ptype_id}">
									
										${ptypeVO.type}
									
									</c:if>
									
								</c:forEach>
							</td>
							<td>
								${(postVO.p_status eq 0) ? "����" : "���" }
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
						
					</c:forEach>
					
					<c:forEach var="memberVOfav" items="${memberSvc.all}">
					
						<c:if test="${favpostVO.mem_id == memberVOfav.mem_id}">
							
							<td>
								${favpostVO.mem_id}
							</td>
							<td>
								${memberVOfav.mem_name}
							</td>
							
						</c:if>
					
					</c:forEach>
			
			</c:if>
		
		</c:forEach>
	
	</c:forEach>
	





</table>
<%@ include file="../../files/page2.file" %>




</body>
</html>