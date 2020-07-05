<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.CustomerMessage.model.*"%>

<%
	CustomerMessageVO cumVO = (CustomerMessageVO) request.getAttribute("cumVO");
%>
<%=cumVO == null%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}

#preview img{
width:500px;
heigh:300px;
	
}
</style>
</head>
<body>

	<table id="table-1">
		<tr>
			<td>
				<h3>addCMessage.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/CustomerMessage/change_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<!-- 	錯誤表列 -->
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form method="post"
		action="<%=request.getContextPath()%>/CustomerMessage/CustomerMessage.do"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>內容:</td>
				<td>
					<!-- 				<input type="text" name="cm_word" size="50" --> <%-- 					value="<%=(cumVO == null) ? "QAQ" : cumVO.getCm_word()%>" /> --%>
					<textarea cols="50" rows="5" name="cm_word">輸入你想要寫的內容...</textarea>
				</td>
			</tr>
			<tr>
				<label><td>圖片:</td>
					<td><input type="file" name="cm_pic" id="myFile"></td></label>
			</tr>
			<tr>
				<td>是否為客服發話</td>
				<td><input type="radio" name="cm_status" size="45" value="1"
					checked />是 <input type="radio" name="cm_status" size="45"
					value="0" />否</td>
			</tr>
			<tr>
				<jsp:useBean id="cumSvc" scope="page"
					class="com.CustomerMessage.model.CustomerMessageService" />
				<td>選擇發話對象: <select size="1" name="cm_customerid">
						<c:forEach var="cumVO" items="${cumSvc.all}">
							<option value="${cumVO.cm_customerid}">${cumVO.cm_customerid}
						</c:forEach></td>


			</tr>
		</table>
		<input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</form>
	<div class="row">
		<label>檔案內容: </label>
		<div id="preview"></div>
	</div>

	<script type="text/javascript">
		function init() {
			var myFile = document.getElementById("myFile");
			var preview = document.getElementById("preview");
			myFile.addEventListener('change', function(e) {
				var files = myFile.files;
				if (files !== null && files.length > 0) {
					var file = files[0];
					console.log(file.type);
					if (file.type.indexOf('image') > -1) {
						var reader = new FileReader();
						reader.addEventListener('load', function(e) {
							var result = e.target.result;
							var img = document.createElement('img');
							img.src = result;
							preview.innerHTML="";
							preview.append(img);
						});
						reader.readAsDataURL(file);
					}
				}
			});
		}
		window.onload = init;
	</script>


</body>
</html>