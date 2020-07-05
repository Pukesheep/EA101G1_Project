<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.CustomerMessage.model.*"%>
<%
	CustomerMessageVO cumVO = (CustomerMessageVO) request.getAttribute("cumVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table#table-1 {
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
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>員工資料修改 - update_emp_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/CustomerMessage/change_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>


	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/CustomerMessage/CustomerMessage.do"
		name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>編號:<font color=red><b>*</b></font></td>
				<td>${cumVO.cm_id}</td>
			</tr>
			<tr>
				<td>原發送時間:</td>
				<td>${cumVO.cm_time}</td>
			</tr>
			<tr>
				<td>內容:</td>
				<td><input type="TEXT" name="cm_word" size="45"
					value="${cumVO.cm_word}" /></td>
			</tr>
			<tr>
			<td>圖片</td>
<!-- 				<form method="get" -->
<%-- 					action="<%=request.getContextPath()%>/CustomerMessage/pic.do"> --%>
<!-- 					<td><img class="dbpic" -->
<%-- 						src="<%=request.getContextPath()%>/CustomerMessage/pic.do?cm_id=${cumVO.cm_id }"></td></form> --%>
				<td><input type="file" name="cm_pic" value="${cumVO.cm_pic }">
				<img class="dbpic"src="<%=request.getContextPath()%>/back-end/CustomerMessage/pic.do?cm_id=${cumVO.cm_id }"></td>
				${cumVO.cm_pic }
			</tr>
			<tr>
				<td>狀態:</td>
				<td><input type="TEXT" name="cm_status" size="45"
					value="${cumVO.cm_status}" /></td>
			</tr>
			<tr>
			<td>對象:</td>
			<td>${cumVO.cm_customerid }</td>
			</tr>




		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="cm_id" value="${cumVO.cm_id }"> <input
			type="hidden" name="cm_time" value="${cumVO.cm_time }">
			<input
			type="hidden" name="cm_customerid" value="${cumVO.cm_customerid }"><input
			type="submit" value="送出修改">
	</FORM>
	
	<script type="text/javascript">
	
	
	</script>
	
</body>
</html>


