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
<h1>���u�n�J�t��</h1>
<div class="a">
<div>
�b��: <input type="text" name="adm_acco" value="" placeholder="�п�J�b��">
</div> 
<div>
�K�X: <input type="password" name="adm_pass" value="" placeholder="�п�J�K�X">
</div>
<div id="b">
<input type="submit" value="�n�J">
</div>
</div>
</FORM>


</body>
</html>