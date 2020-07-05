<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Auth Homepage</title>

<style>

  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h2>Auth Home page</h2><h4>( MVC )</h4></td></tr>
</table>

<h3>���u�d��:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>

 <li><a href='listAllAuth.jsp'>List</a> all Auth.  <br><br></li>
 <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auth/auth.do" >
        <b>��J���u�s��: (ex:ad000001):</b>
        <input type="text" name="adm_no">
        <input type="hidden" name="action" value="select_One_Auth">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

 <jsp:useBean id="authSvc" scope="page" class="com.auth.model.AuthService"/>
 
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auth/auth.do" >
       <b>��ܭ��u�s��:</b>
       <select size="1" name="adm_no">
         <c:forEach var="authVO" items="${authSvc.all}" > 
          <option value="${authVO.adm_no}">${authVO.adm_no}
         </c:forEach>  
       </select>
       <input type="hidden" name="action" value="select_One_Auth">
       <input type="submit" value="�d��">
    </FORM>
  </li>

 

</ul>	

<ul>
  <li><a href='addAuth.jsp'>Add</a> a new Auth.</li>
</ul>



</body>
</html>