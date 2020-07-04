<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.post.model.*" %>
<%@ page import="com.member.model.*" %>
<%@ page import="com.favpost.model.*" %>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	PostVO postVO = (PostVO) request.getAttribute("postVO");
%>
<jsp:useBean id="favpostSvc" scope="page" class="com.favpost.model.FavpostService" />
<html>
<head>
<title>文章資料 - listOnePost.jsp</title>

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

<h4>此頁暫練習採用 Script 的寫法取值：</h4>
<table id="table-1">
	<tr>
		<td>
			<h3>文章資料 - listOnePost.jsp</h3>
			<h4><a href="<%=request.getContextPath()%>/front-end/post/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">回首頁</a></h4>
		</td>
	</tr>
</table>

<table>
	<tr>
		<th>文章編號</th>
		<th>會員編號</th>
		<th>文章類型編號</th>
		<th>文章狀態</th>
		<th>文章標題</th>
		<th>文章內容</th>
		<th>附加圖片</th>
		<th>最後修改時間</th>
		<th>發文時間</th>
	</tr>
	<tr>
		<td><%=postVO.getPost_id()%></td>
		<td><%=postVO.getMem_id()%></td>
		<td><%=postVO.getPtype_id()%></td>
		<td><%=postVO.getP_status()%></td>
		<td><%=postVO.getP_title()%></td>	
		<td><%=postVO.getText()%></td>
		<td><img alt="" src="<%=request.getContextPath()%>/post/ShowPostPic.do?post_id=<%=postVO.getPost_id()%>" id="display"></td>
		<td>
			<fmt:formatDate value="<%=postVO.getLast_edit()%>" pattern="yyyy-MM-dd HH:mm:ss" />
			
		</td>
		<td>
			<fmt:formatDate value="<%=postVO.getPost_time()%>" pattern="yyyy-MM-dd HH:mm:ss" />
		</td>
		<c:if test="${sessionScope.memberVO ne null}">
			<td>
				<c:if test="${favpostSvc.getOneFavpost(memberVO.mem_id, postVO.post_id).mem_id eq null}">
				
					<form action="<%=request.getContextPath()%>/favpost/favpost.do" method="post">
						<input type="hidden" name="mem_id" value="<%=memberVO.getMem_id()%>">
						<input type="hidden" name="post_id" value="<%=postVO.getPost_id()%>">
						<input type="hidden" name="action" value="insert">
						<input type="submit" value="收藏">
					</form>
					
				</c:if>	
			</td>
			
			<td>
			
				<c:forEach var="favpostVOdelete" items="${favpostSvc.all}">
			
					<c:if test="${favpostVOdelete.mem_id == memberVO.mem_id and favpostVOdelete.post_id == postVO.post_id}">
						<form action="<%=request.getContextPath()%>/favpost/favpost.do" method="post">
							<input type="hidden" name="mem_id" value="<%=memberVO.getMem_id()%>">
							<input type="hidden" name="post_id" value="<%=postVO.getPost_id()%>">
							<input type="hidden" name="action" value="delete">
							<input type="submit" value="取消收藏">
						</form>
					</c:if>
				
				</c:forEach>
				
			</td>
			
				<c:if test="${postVO.mem_id == memberVO.mem_id}">
					<td>
						<form action="<%=request.getContextPath()%>/post/post.do" method="post">
							<input type="submit" value="修改">
							<input type="hidden" name="post_id" value="<%=postVO.getPost_id()%>">
							<input type="hidden" name="action" value="getOne_For_Update">
						</form>
					</td>
					<td>
						<form action="<%=request.getContextPath()%>/post/post.do" method="post">
							<input type="hidden" name="post_id" value="<%=postVO.getPost_id()%>">
							<input type="hidden" name="action" value="delete">
							<input type="submit" value="刪除">
						</form>
					</td>
				</c:if>
		</c:if>
	</tr>
</table>



</body>
</html>