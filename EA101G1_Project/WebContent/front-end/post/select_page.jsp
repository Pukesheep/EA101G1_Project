<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Post: Home</title>

<style>
	table#table-1 {
        width: 450px;
        background-color: #CCCCFF;
        margin-top: 5px;
        margin-bottom: 10px;
        border: 3px ridge Gray;
        height: 80px;
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
    body {
        background: white;
    }
    font {
        color: red;
    }
    #errormsg {
        color: red;
    }
</style>

</head>
<body>

	<table id="table-1">
		<tr><td><h3>Post: Home</h3><h4>( MVC )</h4></td></tr>
	</table>

	<p>This is the Home page for Post: Home</p>
	
	<h3>資料查詢</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs }">
	<font>請修正以下錯誤： </font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li id="errormsg">${message}</li>
		</c:forEach>
	</ul>
</c:if>

${requestScope.postVO == null}
${requestScope.favpostVO == null}

<ul>
	<li>
		<a href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">List</a> all Posts. <br><br>
	</li>
	<li>
		<a href="<%=request.getContextPath()%>/front-end/comm/listAllComm.jsp">List</a> all Comms. <br><br>
	</li>
	<li>
		<a href="<%=request.getContextPath()%>/front-end/post/listAllFavpost.jsp">List</a> all Favposts. <br><br>
	</li>
	
	<li>
		<form action="<%=request.getContextPath()%>/post/post.do" method="post">
			<b>請輸入文章編號(如POST000005)</b>
			<input type="text" name="post_id">
			<input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="送出">
		</form>
	</li>
	
<jsp:useBean id="postSvc" scope="page" class="com.post.model.PostService"/>
	
	<li>
		<form action="<%=request.getContextPath()%>/post/post.do" method="post">
			<b>選擇文章編號</b>
			<select size="1" name="post_id">
				<c:forEach var="postVO" items="${postSvc.all}">
					<option value="${postVO.post_id}">${postVO.post_id}</option>
				</c:forEach>
			</select>
			<input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="送出">
		</form>
	</li>
	
	<li>
		<form action="<%=request.getContextPath()%>/post/post.do" method="post">
			<b>請選擇文章標題</b>
			<select size="1" name="post_id">
				<c:forEach var="postVO" items="${postSvc.all}">
					<option value="${postVO.post_id}">${postVO.p_title}</option>
				</c:forEach>
			</select>
			<input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="送出">
		</form>
	</li>
</ul>

<h3>文章管理</h3>

<ul>
	<li><a href="<%=request.getContextPath()%>/front-end/post/addPost.jsp">add</a> a new Post.</li>
</ul>

<form action="http://www.post.gov.tw/post/internet/f_searchzone/streetNameData.jsp" method="post">
	<input type="text" name="city" value="">
	<input type="text" name="cityarea" value="">
	<input type="submit" value="送出">
</form>

</body>
</html>