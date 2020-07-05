<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.gro_order.model.*"%>
<%@page import="java.util.*"%>
<%
	Gro_orderService g_orderSvc = new Gro_orderService();
	List<Gro_orderVO> list = g_orderSvc.getAll();
	pageContext.setAttribute("list", list);
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
<body>
<table id="table-1">
	<tr><td>
		 <h3>所有團購訂單資料 - listAllGro_order.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/gro_order/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>
	<table>
		<tr>
			<th>訂單編號</th>
			<th>會員編號</th>
			<th>訂單狀態編號</th>
			<th>團購案ID</th>
			<th>訂單日期</th>
			
		</tr>
			<%@ include file="../../files/page1.file" %> 
		<c:forEach var="g_orderVO" items="${list}">

			<tr>
				<td>${g_orderVO.ord_Id}</td>
				<td>${g_orderVO.mem_Id}</td>
				<td>${g_orderVO.ordstat_Id}</td>
				<td>${g_orderVO.gro_Id}</td>
				<td>${g_orderVO.add_Date}</td>
				
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/back-end/gro_order/Gro_order.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="ord_Id" value="${g_orderVO.ord_Id}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/back-end/gro_order/Gro_order.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="ord_Id" value="${g_orderVO.ord_Id}"> <input type="hidden"
							name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="../../files/page2.file" %>
</body>
</html>