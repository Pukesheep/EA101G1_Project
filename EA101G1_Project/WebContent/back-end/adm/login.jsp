<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>

<style>
.a{
	width:200px;
	margin:20px auto;
	font-size:30px;
}

#b{
   	margin-top:10px;
}
h1{
	width:200px;
	margin:0 auto;
}
body{
background-color: #5588DD;
}
</style>
</head>
<body>
<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/loginhandler" >
<h1>員工登入系統</h1>
<div class="a">
<div>
帳號: <input type="text" name="adm_acco" value="" placeholder="請輸入帳號">
</div> 
<div>
密碼: <input type="text" name="adm_pass" value="" placeholder="請輸入密碼">
</div>
<div id="b">
<input type="submit" value="登入">
</div>
</div>
</FORM>


</body>
</html>