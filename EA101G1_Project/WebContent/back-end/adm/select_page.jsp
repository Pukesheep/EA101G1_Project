<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Adm Homepage</title>

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
  
  h3{
  	text-align:center;
  }
  
  div{
  width:400px;
  margin:0 auto;
  }
  
</style>

</head>
<body bgcolor='white'>

<table id="a">
   <tr><td><h2>員工管理</h2><h4>( MVC )</h4></td></tr>
</table>

<h3>員工查詢:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="a">
<ul>

 <li><a href='listAllAdm.jsp'>查詢全部員工</a>  <br><br></li>
 <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adm/adm.do" >
        <b>輸入員工編號: (ex:ad000001):</b>
        <input type="text" name="adm_no">
        <input type="hidden" name="action" value="select_One_Adm">
        <input type="submit" value="送出">
    </FORM>
  </li>

 <jsp:useBean id="admSvc" scope="page" class="com.adm.model.AdmService"/>
 
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adm/adm.do" >
       <b>選擇員工編號:</b>
       <select size="1" name="adm_no">
         <c:forEach var="admVO" items="${admSvc.all}" > 
          <option value="${admVO.adm_no}">${admVO.adm_no}
         </c:forEach>  
       </select>
       <input type="hidden" name="action" value="select_One_Adm">
       <input type="submit" value="查詢">
    </FORM>
  </li>

 

</ul>	

<ul>
  <li><a href='<%=request.getContextPath()%>/back-end/adm/addAdm.jsp'>新增員工</a></li>
</ul>
</div>


</body>
</html>