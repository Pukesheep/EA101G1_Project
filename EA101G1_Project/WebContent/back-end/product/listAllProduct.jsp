<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    ProService proSvc = new ProService();
    List<ProVO> list = proSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />

<html>
<head>
<%@ include file="/back-end/css/BackHeaderCssLink" %>
<title>所有商品資料 - listAllPro.jsp</title>

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
    padding: 5px;
    text-align: center;
  }
  td>img{
  width:200px;
  }
</style>

</head>
<<<<<<< HEAD
<body style="background-color:#17a2b8">

=======
<body bgcolor='white'>
>>>>>>> branch 'master' of https://github.com/Pukesheep/EA101G1_Project.git
<!-- header -->
	
	<%@ include file="/back-end/css/header.jsp" %>
<!-- header -->

    <div class="content d-md-flex">

<!-- aside -->
	<%@ include file="/back-end/css/aside.jsp" %>
<!-- aside -->
<div class="col" >
<!-- <h4>此頁練習採用 EL 的寫法取值:</h4> -->
<!-- <table id="table-1"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3>所有商品資料 - listAllProduct.jsp</h3> -->
<!-- 		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4> -->
<!-- 	</td></tr> -->
<!-- </table> -->

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table >
	<tr>
		<th>商品編號</th>
		<th>分類</th>
		<th>商品名稱</th>
		<th>商品價格</th>
		<th>商品圖片</th>
		<th>商品描述</th>
		<th>銷售量</th>
		<th>庫存量</th>
		<th>上架日期</th>
		<th>商品狀態</th>
		<th>修改</th>
	</tr>
	<%@ include file="/files/page1.file" %> 
	<c:forEach var="proVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${proVO.p_id}</td>
			<td>${ ptSvc.getOneProductType(proVO.pt_id).typename }</td>
			<td>${proVO.p_name}</td>
			<td>${proVO.p_price}</td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/proPic.do">
			<td><img src="<%=request.getContextPath()%>/product/proPic.do?p_id=${proVO.p_id}"></td>
			</FORM>
			<td>${proVO.p_info}</td>
			<td>${proVO.p_sales}</td>
			<td>${proVO.p_stock}</td>
			<td><fmt:formatDate value="${proVO.p_add_date}" pattern="yyyy-MM-dd"/></td>
			<td>${(proVO.p_stat==0)? "下架中":"上架中"}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/pro.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="p_id"  value="${proVO.p_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="/files/page2.file" %>

</body>
</html>
