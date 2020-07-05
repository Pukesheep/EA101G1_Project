<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.psac.model.*"%>
<%
  PsacVO psacVO = (PsacVO) request.getAttribute("psacVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>psac</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>


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
table#b {
	width: 50%;
	background-color: #AABB44;
	margin: 20px auto;
	
    height: 50px;
    text-align: center;
  }
table, th, td {
    border: 1px solid #111111;
  } 
body{
background-color:#455555;
}
textarea{
width:90%;
height:200px;}
</style>
</head>
<body>
<table id="a">
   <tr><td><h2>檢舉表單</h2><h4>( MVC )</h4></td></tr>
</table>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" style="margin-bottom: 0px;">
<table id="b" class="table table-striped">
	<tr> 
		<th>檢舉原因</th>
		<th>請勾選(可複選)</th>
	</tr>
	<tr><td>重複刊登</td>
		<td><input type="checkbox" name="reason" value="重複刊登"></td>
	</tr>
	<tr><td>商品含色情或暴力內容</td>
		<td><input type="checkbox" name="reason" value="商品含色情或暴力內容"></td>
	</tr>
	<tr><td>違法商品</td>
		<td><input type="checkbox" name="reason" value="違法商品"></td>
	</tr>
	<tr><td>仿冒商品</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>商品定價太高</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>商品類別有誤</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>刊登不實內容</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	</tr>
	<tr><td>廣告訊息</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>文章內容充滿色情文字</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>文章內容帶政治色彩</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>假冒他人</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>檢舉內容</td>
		<td><textarea name="reason"></textarea></td>
	</tr>
	<tr><td>送出表單</td>
		<td>
			<input type="hidden" name="mem_id" value="${psacVO.mem_id}">
			<input type="hidden" name="post_id" value="${psacVO.post_id}">
			<input type="hidden" name="action" value="report">
			<input type="submit" class="btn btn-primary" value="確認送出">
		</td>
	</tr>	
</table>

</FORM>

</body>
</html>