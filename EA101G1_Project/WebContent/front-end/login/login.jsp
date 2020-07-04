<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Login</title>
<style>
	#container {
		border: 1px solid black;
		margin: 0 auto;
		width: 25%;
		text-align: center;
	}
	#username {
		margin: 5px;
	}
	#username > div {
		display: inline;
	}
	#password > div {
		display: inline;
	}
	#title > div {
		font-size: 8px;
	}
	#btn {
		margin: 10px 0;
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

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs }">
	<font>�Эץ��H�U���~�G</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li id="errormsg">${message}</li>
		</c:forEach>
	</ul>
</c:if>
	<form action="<%=request.getContextPath()%>/login/login.do" method="post">
		<div id="container">
			<div id="title">
				<h2>�n�J</h2>
			</div>
			<div id="username">
				<div class="left">�b���G</div>
				<div class="right"><input type="text" name="mem_email" value="" size="15"></div>
			</div>
			<div id="password">
				<div class="left">�K�X�G</div>
				<div class="right"><input type="password" name="mem_pass" value="" size="15"></div>
			</div>
			<div id="btn">
				<input type="submit" value="�n�J">
			</div>
		</div>
	</form>
	
</body>
</html>