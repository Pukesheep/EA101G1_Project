<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.post.model.*" %>

<%--
	以文章為主體, 文章下方是對應到此篇文章的留言
 --%>

<%
	PostService postSvc = new PostService();
	java.util.List<PostVO> list = postSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="commSvc" scope="page" class="com.comm.model.CommService" />
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
	tr.post {
		border: 1px solid red;
	}
	tr.comm {
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
	
	
	
<c:forEach var="postVO" items="${list}">
		
	<c:forEach var="memberVO" items="${memberSvc.all}">
	
		<c:if test="${postVO.mem_id == memberVO.mem_id}">
		
			<tr>
				<th>文章編號</th>
				<th>文章會員編號</th>
				<th>文章會員名稱</th>
				<th>文章標題</th>
				<th>文章內容</th>
				<th>文章附加圖片</th>
				<th>文章最後修改時間</th>
				<th>文章發文時間</th>
			</tr>
		
			<tr>
			
				<td>
					${postVO.post_id}
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
				
			</tr>
			
		</c:if>
	
	</c:forEach>
	
<%--	
	<tr>
		<th>留言編號</th>
		<th>留言會員編號</th>
		<th>留言會員名稱</th>
		<th>留言狀態</th>
		<th>留言內容</th>
		<th>留言最後修改時間</th>
		<th>留言時間</th>
	</tr>
 --%>	

		<c:forEach var="commVO" items="${commSvc.all}">
			
			<c:forEach var="memberVO1" items="${memberSvc.all}">
			
				<c:if test="${postVO.post_id == commVO.post_id}">
				
					<c:if test="${commVO.mem_id == memberVO1.mem_id}">
					
						<tr>
							<th>留言編號</th>
							<th>留言會員編號</th>
							<th>留言會員名稱</th>
							<th>留言狀態</th>
							<th>留言內容</th>
							<th>留言最後修改時間</th>
							<th>留言時間</th>
						</tr>
					
						<tr>
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
						</tr>
						
					</c:if>
					
				</c:if>
				
			</c:forEach>	
		
		</c:forEach>
	
</c:forEach>

</table>

</body>
</html>