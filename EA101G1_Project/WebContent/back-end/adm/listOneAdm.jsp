<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adm.model.*"%>
<%
	AdmVO admVO = (AdmVO) request.getAttribute("admVO");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <title>S.F.G 後台管理</title>
    <%@ include file="/back-end/css/BackHeaderCssLink" %> 
    <style>
    
    	h1,h3{
    		padding: 10px;
    		text-align: center;
    		background-color:#22AA99;
    		
    	}
    	
    	div.container{
    		margin-top:20px;
    	}
    	
    	div.input{
    		padding:5px;
    	}
    	
    	body{
    		background-color:#446688;	
    	}
    	
    	div#button{
    		margin-top:10px;
    		text-align: center;
    	}
    	
    	a.btn btn-primary{
    		padding:50px;
    		margin-left:90%;
    	}
    </style>
    
    
</head>

<body>
<!-- header -->
	
	<%@ include file="/back-end/css/header.jsp" %>
<!-- header -->

    <div class="content d-md-flex">

<!-- aside -->
	<%@ include file="/back-end/css/aside.jsp" %>
<!-- aside -->

 		<main>
			<h3>員工資料查詢</h3>
	
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-8">

<table class="table table-striped">
	<tr>
		<th>員工編號</th>
		<th>員工帳號</th>
		<th>員工密碼</th>
		<th>員工姓名</th>
		<th>員工狀態</th>
	</tr>
	<tr>
		<td><%=admVO.getAdm_no()%></td>
		<td><%=admVO.getAdm_acco()%></td>
		<td><%=admVO.getAdm_pass()%></td>
		<td><%=admVO.getAdm_name()%></td>
		<td><%=admVO.getAdm_state()%></td>
	</tr>
</table>
  </div>      
   </div>       
    </div>      
  <a href="<%=request.getContextPath()%>/back-end/adm/select_page.jsp" class="btn btn-primary" style="margin-left:72%">回首頁</a>   
        </main>
    
</body>

</html>