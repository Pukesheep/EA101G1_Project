<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.comm.model.*" %>

<%--
	以留言為主體, 有幾篇留言就會有幾篇對應的文章
 --%>

<%
	CommService commSvc = new CommService();
	java.util.List<CommVO> list = commSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

<html>
<head>
<title>所有留言資料 - listAllComm.jsp</title>

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

<h4>此頁練習採用 EL 的寫法取值</h4>
<table id="table-1">
	<tr>
		<td>
			<h3>所有留言資料 - listAllComm.jsp</h3>
			<h4>
				<a href="<%=request.getContextPath()%>/front-end/comm/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">回首頁</a>
			</h4>
		</td>
	</tr>
</table>

<%-- 錯誤列表 --%>
<c:if test="${not empty errorMsgs}">
	<font>請修正以下錯誤</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li id="errormsg">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>留言編號</th>
		<th>文章編號</th>
		<th>留言會員編號</th>
		<th>留言會員名稱</th>
		<th>留言狀態</th>
		<th>留言內容</th>
		<th>留言最後修改時間</th>
		<th>留言時間</th>
	</tr>
<%@ include file="../../files/page1.file" %>
	<c:forEach var="commVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
		<tr>
		
			<td>
				${commVO.comm_id}
			</td>
			<td>
				${commVO.post_id}
			</td>
			<td>
				${commVO.mem_id}
			</td>
			<td>
				<c:forEach var="memberVO" items="${memberSvc.all}">
					<c:if test="${commVO.mem_id == memberVO.mem_id}">
						${memberVO.mem_name}
					</c:if>
				</c:forEach>
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
			<td>
				<form action="<%=request.getContextPath()%>/comm/comm.do" method="post">
					<input type="submit" value="修改">
					<input type="hidden" name="comm_id" value="${commVO.comm_id}">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
			<td>
				<form action="<%=request.getContextPath()%>/comm/comm.do" method="post">
					<input type="submit" value="刪除">
					<input type="hidden" name="comm_id" value="${commVO.comm_id}">
					<input type="hidden" name="action" value="delete">
				</form>
			</td>
			
		</tr>
	
	</c:forEach>

</table>

<%@ include file="../../files/page2.file" %>

</body>
</html>