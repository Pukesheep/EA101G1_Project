<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>EA101G1 Immed: HOME</title>
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
</style>
</head>
<body>

	<table id="table-1">
		<tr>
			<td><h3>EA101G1 Immed: HOME</h3>
				<h4>( MVC )</h4></td>
		</tr>
	</table>

	<p>This is the Home page for EA101G1 Immed: Home</p>

	<h3>直購商品資料查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href="listAllImmed.jsp">List</a> all Immed.</li>



		<li>
			<form method="post" action="immed.do">
				<b>輸入直購商品編號 (如IMMED000001):</b> <input type="text" name="immed_id">
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</form>
		</li>
	</ul>
	
	<h3>新增直購商品</h3>

	<ul>
		<li><a href="addImmed.jsp">Add</a> a new Immed.</li>
	</ul>
</body>
</html>