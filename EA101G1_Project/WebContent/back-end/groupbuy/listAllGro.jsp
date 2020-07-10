<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.groupBuy.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    GroupBuyService groSvc = new GroupBuyService();
    List<GroupBuyVO> list = groSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有團購資料 - listAllGro.jsp</title>

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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 15px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有團購資料 - listAllGro.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/groupbuy/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
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
		<th>團購案ID</th>
		<th>商品編號</th>
		<th>開始時間</th>
		<th>結束時間</th>
		<th>團購期間</th>
		<th>折扣一</th>
		<th>折扣二</th>
		<th>折扣三</th>
		<th>團購案狀態</th>
		<th>人數</th>
		<th>金額</th>

	</tr>
	<%@ include file="../../files/page1.file" %> 
	<c:forEach var="GroupBuyVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${GroupBuyVO.gro_Id}</td>
            <td>${GroupBuyVO.p_Id}</td>
            <td>${GroupBuyVO.start_Date}</td>
            <td>${GroupBuyVO.end_Date}</td>
            <td>${GroupBuyVO.grotime_Date}</td>
            <td>${GroupBuyVO.reb1_No}</td>
            <td>${GroupBuyVO.reb2_No}</td>
            <td>${GroupBuyVO.reb3_No}</td>
            <td>${GroupBuyVO.status}</td>
            <td>${GroupBuyVO.people}</td>
            <td>${GroupBuyVO.money}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/groupBuy/groupbuy.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="gro_Id" value="${GroupBuyVO.gro_Id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/groupBuy/groupbuy.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="gro_Id" value="${GroupBuyVO.gro_Id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="../../files/page2.file" %>

</body>
</html>