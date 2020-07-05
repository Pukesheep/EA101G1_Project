<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Gro: Home</title>

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
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>IBM Gro: Home</h3>
				<h4>( MVC )</h4></td>
		</tr>
	</table>

	<p>This is the Home page for IBM Gro: Home</p>

	<h3>資料查詢:</h3>

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
		<li><a href='listAllGro.jsp'>List</a> all Groupbuy. <br>
		<br></li>


		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/groupBuy/groupbuy.do">
				<b>輸入團購案 (如G000000001):</b>
				 <input type="text" name="gro_Id">
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="groSvc" scope="page"
			class="com.groupBuy.model.GroupBuyService" />
		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/groupBuy/groupbuy.do">
				<b>選擇會員:</b>
				 <select size="1" name=gro_Id>
					<c:forEach var="groupBuy" items="${groSvc.all}">
					<option value="${groupBuy.gro_Id}">${groupBuy.gro_Id}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>

	
		</FORM>
	</li>
</ul>
	<h3>員工管理</h3>

	<ul>
		<li><a href='addGro.jsp'>Add</a> a new Gro.</li>
	</ul>

</body>
</html>