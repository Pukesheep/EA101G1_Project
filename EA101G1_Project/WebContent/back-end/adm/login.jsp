<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%@ include file="/back-end/css/BackHeaderCssLink" %>
    <title>S.F.G 後台管理</title>
    
    <style>
    
    	h1{
    		padding: 10px;
    		text-align: center;
    		background-color:#BB6655;
    		
    	}
    	
    	div.container{
    		margin-top:20px;
    	}
    	
    	div.input{
    		padding:5px;
    	}
    	
    	body{
    		background-color:#448888;	
    	}
    	
    	div#button{
    		margin-top:10px;
    		text-align: center;
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

   <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/loginhandler">
<h1>員工登入系統</h1>

<div class="container">
	<div class="row justify-content-center">
			<div class="col-3">

<div class="input">
帳號: <input type="text"  name="adm_acco" value="" placeholder="請輸入帳號">
</div>

<div class="input">
密碼: <input type="text"  name="adm_pass" value="" placeholder="請輸入密碼">
</div>
<div id="button">
<input type="submit" class="btn btn-warning" value="登入">
</div>
</div>
</div>
</div>
        </main>
    </div>

</body>

</html>