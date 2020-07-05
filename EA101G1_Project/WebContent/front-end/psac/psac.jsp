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
   <tr><td><h2>���|���</h2><h4>( MVC )</h4></td></tr>
</table>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" style="margin-bottom: 0px;">
<table id="b" class="table table-striped">
	<tr> 
		<th>���|��]</th>
		<th>�ФĿ�(�i�ƿ�)</th>
	</tr>
	<tr><td>���ƥZ�n</td>
		<td><input type="checkbox" name="reason" value="���ƥZ�n"></td>
	</tr>
	<tr><td>�ӫ~�t�ⱡ�μɤO���e</td>
		<td><input type="checkbox" name="reason" value="�ӫ~�t�ⱡ�μɤO���e"></td>
	</tr>
	<tr><td>�H�k�ӫ~</td>
		<td><input type="checkbox" name="reason" value="�H�k�ӫ~"></td>
	</tr>
	<tr><td>��_�ӫ~</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>�ӫ~�w���Ӱ�</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>�ӫ~���O���~</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>�Z�n���ꤺ�e</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	</tr>
	<tr><td>�s�i�T��</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>�峹���e�R���ⱡ��r</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>�峹���e�a�F�v��m</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>���_�L�H</td>
		<td><input type="checkbox" name="reason"></td>
	</tr>
	<tr><td>���|���e</td>
		<td><textarea name="reason"></textarea></td>
	</tr>
	<tr><td>�e�X���</td>
		<td>
			<input type="hidden" name="mem_id" value="${psacVO.mem_id}">
			<input type="hidden" name="post_id" value="${psacVO.post_id}">
			<input type="hidden" name="action" value="report">
			<input type="submit" class="btn btn-primary" value="�T�{�e�X">
		</td>
	</tr>	
</table>

</FORM>

</body>
</html>