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
   <tr><td><h2>�∪極蝞∠��</h2><h4>( MVC )</h4></td></tr>
</table>

<h3>�∪極�亥岷:</h3>

<%-- �航炊銵典�� --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">隢�靽格迤隞乩��航炊:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="a">
<ul>

 <li><a href='listAllAdm.jsp'>�亥岷�券�典�∪極</a>  <br><br></li>
 <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adm/adm.do" >
        <b>頛詨�亙�∪極蝺刻��: (ex:ad000001):</b>
        <input type="text" name="adm_no">
        <input type="hidden" name="action" value="select_One_Adm">
        <input type="submit" value="����">
    </FORM>
  </li>

 <jsp:useBean id="admSvc" scope="page" class="com.adm.model.AdmService"/>
 
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adm/adm.do" >
       <b>�豢���∪極蝺刻��:</b>
       <select size="1" name="adm_no">
         <c:forEach var="admVO" items="${admSvc.all}" > 
          <option value="${admVO.adm_no}">${admVO.adm_no}
         </c:forEach>  
       </select>
       <input type="hidden" name="action" value="select_One_Adm">
       <input type="submit" value="�亥岷">
    </FORM>
  </li>

 

</ul>	

<ul>
  <li><a href='addAdm.jsp'>�啣��∪極</a></li>
</ul>
</div>


</body>
</html>