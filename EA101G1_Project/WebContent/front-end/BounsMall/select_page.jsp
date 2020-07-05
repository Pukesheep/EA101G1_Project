<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Select Bouns Mall</title>

<style>
	table#table-1 {
		width: 450px;
		background-color: #CCCCFF;
		margin-top: 5px;
		margin-bottom: 10px;
		border:3px ridge Gray;
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
	<tr><td><h3>Select Bouns Mall</h3></td></tr>
</table>

${errorMsgs}<br>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~�G</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${errorMsgs}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
	<li><a href='<%=request.getContextPath()%>/front-end/BounsMall/ListAll.jsp'>List</a> all Bouns.</li>

	<li>
		<form method="post" action="<%=request.getContextPath()%>/BounsMall/BounsMall.do">
			<b>��J���Q�ӫ~�s���]�p�GB000001�^�G</b>
			<input type="text" name="BON_ID">
			<input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="�e�X">
		</form>
	</li>
	
	<jsp:useBean id="dao" scope="page" class="com.BounsMall.model.BMDAO"/>
	
<!-- 	<li> -->
<!-- 		<form method="post" action="BounsMall.do"> -->
<!-- 			<b>��ܬ��Q�ӫ~�W�١G</b> -->
<!-- 			<select size="1" name="BON_ID"> -->
<%-- 				<c:forEach var="bmVO" items="${dao.all}"> --%>
<%-- 					<option value="${bmVO.bon_id}">${bmVO.bon_id} --%>
<%-- 				</c:forEach> --%>
<!-- 			</select> -->
<!-- 			<input type="hidden" name="action" value="getOne_For_Display"> -->
<!-- 			<input type="submit" value="�e�X"> -->
<!-- 		</form> -->
<!-- 	</li> -->
	
	<li>
		<form method="post" action="<%=request.getContextPath()%>/BounsMall/BounsMall.do">
			<b>��J���Q�ӫ~�W�١G</b>
			<input type="text" name="bon_name">
			<input type="hidden" name="action" value="getByName">
			<input type="submit" value="�e�X">
		</form>
	</li>
	
<!-- 	<li> -->
<!-- 		<form method="post" action="BounsMall.do"> -->
<!-- 			<b>��ܬ��Q�ӫ~�����G</b> -->
<!-- 			<select></select> -->
<!-- 		</form> -->
<!-- 	</li> -->
	
</ul>

</body>
</html>