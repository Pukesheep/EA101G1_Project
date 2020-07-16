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
    <title>���бM��</title>
    <!-- TODO: ��title ��icon -->
    <link rel="icon shortcut" href="images/ICON(yellow).ico">
    <!-- Bootstrap�x����� https://getbootstrap.com/ -->
    <!-- �s��Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- �ϥ�font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- �ϥ�google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- �ϥ�style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">

    <!-- �s��Bootstrap�һݭn��js -->
    <!-- jquery.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- popper.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <!-- bootstrap.min.js -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        
    <style type="text/css">
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
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/front-end/index.jsp">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <span class="logo3">{{{</span>
            </a>
            <!-- ��������s -->
            <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
                aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- ���e -->
            <div class="navbar2 navbar-dark">
                <div class="row">
                    <div class="item col-md-2"><a href="#">�ӫ� </a></div>
                    <div class="item col-md-2"><a href="#">���� </a></div> 
                    <div class="item col-md-2"><a href="/auct/Auct_index.html">�v�а� </a></div> 
                    <div class="item col-md-2"><a href="#">���ʰ� </a></div> 
                    <div class="item col-md-2"><a href="#">�Q�װ� </a></div> 
                    <div class="item col-md-2"><a href="#">���Q </a></div> 
                </div>
            </div>
    
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">�n�X</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">���U</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">�|������</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">�ڪ��̷R</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">�ʪ���</a>
                    </li>
    
                </ul>
            </div>
        </nav>
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
        <button id="chatBtn" class="bg-primary">
            <i class="fas fa-comments"></i>
        </button>


</body>
</html>