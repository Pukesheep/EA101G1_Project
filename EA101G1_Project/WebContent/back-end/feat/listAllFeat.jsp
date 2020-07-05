<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.feat.model.*"%>
<%
    FService fSvc = new FService();
    List<FVO> list = fSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>Insert title here</title>
<style>
  table#a {
	width: 100%;
	background-color: #5588DD;
	margin-top: 20px;
	margin-bottom: 20px;
    border: 5px solid Gray;
    height: 50px;
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
    padding: 5px;
    text-align: center;
  }
</style>
</head>
<body bgcolor='white'>

<table id="a">
	<tr><td>
		 <h3>所有功能性質 - listAllFeat.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/feat/select_page.jsp">回首頁</a></h4>
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
		<th>功能編號</th>
		<th>功能性質</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	
	<c:forEach var="fVO" items="${list}" begin="" end="">
		
		<tr>
			<td>${fVO.f_no}</td>
			<td>${fVO.f_type}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/feat/feat.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="f_no"  value="${fVO.f_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/feat/feat.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="f_no"  value="${fVO.f_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>


</body>
</html>