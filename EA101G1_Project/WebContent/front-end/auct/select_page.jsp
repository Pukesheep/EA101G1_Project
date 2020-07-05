<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auct : Home</title>

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
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

</head>
<body>

	<table id="table-1">
	   <tr><td><h3>Auct : Home</h3><h4>( MVC )</h4></td></tr>
	</table>
	
	<p>This is the Home page for Auctb: Home</p>
	
	<h3>�v�аӫ~�d��:</h3>
	
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
 	  <li><a href='<%=request.getContextPath()%>/front-end/auct/2_listAllAuct.jsp'>List</a> all Aucts.  <br><br></li>
  
  
	  <li>
	    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auct/auct.do" >
	        <b>��J�ӫ~�s�� (AUCT000008):</b>
	        <input type="text" name="auct_id">
	        
	        <input type="hidden" name="action" value="getOne_For_Display">
	        <input type="submit" value="�e�X">
	    </FORM>
	  </li>

  	<jsp:useBean id="auctSvc" scope="page" class="com.auct.model.AuctService" />
   
	  <li>
	     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auct/auct.do" >
	       <b>��ܰӫ~�s��:</b>
	       <select size="1" name="auct_id">
	         <c:forEach var="auctVO" items="${auctSvc.all}" > 
	          <option value="${auctVO.auct_id}">${auctVO.auct_id}
	         </c:forEach>   
	       </select>
	       
	       <input type="hidden" name="action" value="getOne_For_Display">
	       <input type="submit" value="�e�X">
	       
	    </FORM>
	  </li>
  
	  <li>
	     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auct/auct.do" >
	       <b>��ܰӫ~�W��:</b>
	       <select size="1" name="auct_id">
	         <c:forEach var="auctVO" items="${auctSvc.all}" > 
	          <option value="${auctVO.auct_id}">${auctVO.auct_name}
	         </c:forEach>   
	       </select>
	       <input type="hidden" name="action" value="getOne_For_Display">
	       <input type="submit" value="�e�X">
	     </FORM>
	  </li>
</ul>

	<h3>�ӫ~�޲z</h3>
	
	<ul>
	  <li><a href='<%=request.getContextPath()%>/front-end/auct/2_insert_auct.jsp'>Add</a> �s�W�@���v�аӫ~.</li>
	</ul>


</body>
</html>