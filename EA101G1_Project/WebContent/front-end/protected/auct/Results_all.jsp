<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>


<%    
      
    AuctService auctSvc = new AuctService();
    List<AuctVO> list = auctSvc.getAllResult();
    pageContext.setAttribute("list",list);
%>

<%
	java.util.GregorianCalendar time = new java.util.GregorianCalendar();
	long now_ms = time.getTimeInMillis();
	pageContext.setAttribute("now_ms", now_ms);
%>

<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BID�v�бM��</title>
    
<%@ include file="/files/HeaderCssLink" %>

    <!-- �ϥ�style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">
    
        
    <style type="text/css">
  	  body {
		    background-color:white;
		    background: url(<%=request.getContextPath()%>/front-end/protected/auct/images/rkXP0RBoX3.jpg);
		    background-size: cover;
		}
		
    	.product button {
            border: none;
            background: linear-gradient(rgb(179, 174, 174), grey, #cecdcc);
        }
    
    	.produce-li{
		   position: relative;
		}
		
		.produce-img{
		    width: 270px;
		    margin:5px 0;
		    position: relative;
		    /* background-size: cover; */
		}
		.produce-img2{
		    width: 180px;
		    margin:5px 0;
		    position: absolute;
		    left: 28.5%;
		    top:15%;
		    z-index: 888;
		    /* background-size: cover; */
		}
    	   
    </style>
        

</head>

<body>
    <!-- navbar -->
    	<%@ include file="/files/header.jsp" %>
    <!-- navbar end -->
    
    
        <section class="blank0"></section>

        <section class="nav-auct container">
            <ul class="text-right">
                <li class="auct-navbtn">
	                <a href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp">�v�бM��</a>
	            </li>
	            <li class="auct-navbtn">
	                <a href="<%=request.getContextPath()%>/front-end/protected/auct/Results_all.jsp">���бM��</a>
	            </li>
	            
	            <li class="auct-navbtn">
	                <a href="<%=request.getContextPath()%>/front-end/protected/auct/buy_order.jsp">�ԧQ�~</a>
	            </li>
	            <li class="auct-navbtn">
	                <a href="<%=request.getContextPath()%>/front-end/protected/auct/listAllAuct.jsp">�ڪ�����</a>
	            </li>
            </ul>
            <h6 class="h6"> <a class="a-index" href="All_index.jsp">����</a> > ���бM��</h6>

        </section>
		<br>

        <section class="auct-all container">
            <div class="">
                <div class="auct-title py-2">
                    <span class="span1">&nbsp&nbsp&nbsp&nbsp</span>
                    <span class="span2"> &nbsp�w���аӫ~</span>
                </div>
                <div class="auct-list bg-white row">
 
<%@ include file="page3.file" %>                
<!-- JSTL for-each -->
<c:forEach var="auctVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
     <div class="product col-md-4 mb-5">
                        <div class="product-rel">
                            <div class="auct-title  py-3">
                                <h6 class="text-center">${auctVO.auct_name}</h6>
                            </div>
                            <div class="auct-list">
                                <div>
                                    <ul>
                                    	<li>���� : ${auctVO.marketPrice}��</li>
                                        <li>
                                            <img src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" height="200px">
                                        	<img class="produce-img2" src="images/sold-out.png" alt="">
                                        </li>
                                        
                                        
                                        <li id="bid_state" style="color:red;font-weight:bolder;">
										<jsp:useBean id="auctVO" scope="page" class="com.auct.model.AuctVO" />
											<%
												Timestamp startTime = auctVO.getAuct_start();
													long a = startTime.getTime();
													Timestamp endTime = auctVO.getAuct_end();
													long b = endTime.getTime();
													if (now_ms < a) {
														out.println("��楼�}�l");
													} else if (now_ms >= a && now_ms <=b) {
														out.println("���i�椤");
													} else {
														out.println("���w����");
													}
											%>
										</li>
                                        
                                        <li>NTD <span style="font-size:20px;font-weight:bolder; color: blue;">${auctVO.maxPrice}</span>  ��</li>
                                        <li>Ĺ�a :  <span style="font-weight:bolder; color: blue;">${MemberSvc.getOneMember(auctVO.buy_id).mem_name}</span></li>
                                        
                                        <li>
												<button type="submit" class="bid-btn" disable>�v�е���</button>
										</li>
										
                                    </ul>
                                </div>                  
                            </div>
                        </div>
                    </div>            
</c:forEach>
<!-- JSTL for-each   end-->

<%@ include file="page4.file" %>


                </div>
            </div>
        </section>


        <!-- ��ѫ� -->
<!--         <button id="chatBtn" class="bg-primary"> -->
<!--             <i class="fas fa-comments"></i> -->
<!--         </button> -->
<%@ include file="/files/footer.jsp" %>


</body>
</html>