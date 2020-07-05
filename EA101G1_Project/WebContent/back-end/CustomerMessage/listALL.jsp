<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.CustomerMessage.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    CustomerMessageService cumSvc = new CustomerMessageService();
    List<CustomerMessageVO> list = cumSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllEmp.jsp</title>

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
  .dbpic{
  width:400px;
  height:200px;
  }
  table {
	width: 800px;
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
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有員工資料 - listAllEmp.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/CustomerMessage/change_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>訊息編號</th>
		<th>時間</th>
		<th>內容</th>
		<th>圖片</th>
		<th>是否為客服發話</th>
		<th>對象會員</th>

		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="../../files/page1.file" %> 
	<c:forEach var="cumVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${cumVO.cm_id}</td>
			<td>${cumVO.cm_time}</td>
			<td>${cumVO.cm_word}</td>
			
			<form method="get" action="<%=request.getContextPath()%>/back-end/CustomerMessage/pic.do">	
			<td><img class="dbpic"src="<%=request.getContextPath()%>/CustomerMessage/pic.do?cm_id=${cumVO.cm_id }"></td>
				
			</form>
			<td>${cumVO.cm_status}</td>
			<td>${cumVO.cm_customerid}</td> 

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/CustomerMessage/CustomerMessage.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="cm_id"  value="${cumVO.cm_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/CustomerMessage/CustomerMessage.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="cm_id"  value="${cumVO.cm_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="../../files/page2.file" %>

</body>
</html>