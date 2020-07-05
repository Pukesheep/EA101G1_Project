<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" style="margin-bottom: 0px;">
			<input type="hidden" name="mem_id" value="M000001">
			<input type="hidden" name="post_id" value="POST000001">
			<input type="hidden" name="action" value="button">
			<input type="submit" class="btn btn-primary" value="確認送出">
			</FORM>
</body>
</html>