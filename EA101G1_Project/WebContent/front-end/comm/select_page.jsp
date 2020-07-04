<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Comm: Home</title>

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
		<tr>
			<td>
				<h3>Comm: Home</h3><h4>( MVC )</h4>
			</td>
		</tr>
	</table>
	
	<p>This is the Home page for Comm: Home</p>
	
	<h3>資料查詢</h3>

<%-- 錯誤列表 --%>
<c:if test="${not empty errorMsgs}">
	<font>請修正以下錯誤：</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li id="errormsg">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
	<li>
		<a href="<%=request.getContextPath()%>/front-end/comm/listAllComm.jsp">List</a> all Comms
		<br>
		<br>
	</li>
	
<jsp:useBean id="commSvc" scope="page" class="com.comm.model.CommService" />

	<li>
		<form action="<%=request.getContextPath()%>/comm/comm.do" method="post">
			<b>選擇留言編號</b>
			<select size="1" name="comm_id">
				<c:forEach var="commVO" items="${commSvc.all}">
					<option value="${commVO.comm_id}">${commVO.comm_id}</option>
				</c:forEach>
			</select>
			<input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="送出">
		</form>
	</li>
	
</ul>

<h3>文章管理</h3>

<ul>
	<li>
		<a href="<%=request.getContextPath()%>/front-end/comm/addComm.jsp">add</a> a new Comm.
	</li>
</ul>

</body>
</html>