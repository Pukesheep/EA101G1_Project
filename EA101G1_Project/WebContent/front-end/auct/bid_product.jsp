<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.auct.model.*"%>

<%
  AuctVO auctVO = (AuctVO) request.getAttribute("auctVO"); //AuctServlet.java(Controller), 存入req的auctVO物件
%>

<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BID競標專區</title>
    <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="./img/ICON(yellow).ico">
    <!-- Bootstrap官方網站 https://getbootstrap.com/ -->
    <!-- 連結Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 使用font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- 使用google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- 使用style.css -->
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/Auct_index.css">
    <link rel="stylesheet" href="../css/bid_product.css">

    <!-- 連結Bootstrap所需要的js -->
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
</head>
<body>

<!-- navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="All_index.jsp">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <span class="logo3">{{{</span>
                    </a>
                    <!-- 手機選單按鈕 -->
                    <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
                        aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- 內容 -->
                    <div class="navbar2 navbar-dark">
                        <div class="row">
                            <div class="item col-md-2"><a href="#">商城</a></div>
                            <div class="item col-md-2"><a href="#">團購</a></div>
                            <div class="item col-md-2"><a href="Auct_index.jsp">競標區</a></div>
                            <div class="item col-md-2"><a href="#">直購區</a></div>
                            <div class="item col-md-2"><a href="#">討論區</a></div>
                            <div class="item col-md-2"><a href="#">紅利</a></div>
                        </div>
                    </div>
            
                    <div class="collapse navbar-collapse" id="collapsibleNavId">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#">登入</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">註冊</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">會員中心</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">我的最愛</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">購物車</a>
                            </li>
            
                        </ul>
                    </div>
                </nav>
<!-- navbar end -->

    <section class="blank0"></section>
        
    <header class="nav-auct container">
        <ul class="text-right">
                        <a href="Auct_index.jsp"><li class="auct-navbtn">競標專區</li></a>
                        <a><li class="auct-navbtn">結標專區</li></a>
                        <a><li class="auct-navbtn">出價記錄</li></a>
                        <a><li class="auct-navbtn">戰利品</li></a>
                        <a href="listAllAuct.jsp"><li class="auct-navbtn">我的拍賣區</li></a>
        </ul>
        <h6 class="h6"> <a class="a-index" href="All_index.jsp">首頁</a> > 
                        <a class="a-index" href="Auct_index.jsp">競標區</a> > BID
        </h6>
        
    </header>

    <section class="auct-all container bg-white">
        <div class="">
            <div class="auct-title py-2">
                <h6>&nbsp&nbsp&nbsp&nbsp商品名稱</h6>
            </div>
            <div class="auct-list row px-3 py-3">
                
                    <div class="product col-md-4 mb-3">
                        <div class="product-rel">
                            <div class="auct-title  py-2">
                                <h6 class="text-center">商品名稱</h6>
                            </div>
                            <div class="auct-list">
                                <div>
                                    <img class="produce-img" src="images/002.jpg" alt="">
                                </div>
                                <div class="mt-3">
                                    <ul>
                                        <li>拍賣編號:</li>
                                        <li>商品分類:</li>
                                        <li>拍賣者:</li>
                                        <li>開始時間:</li>
                                        <li>起標價: 元</li>
                                        <li>出價增額: 元</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product col-md-4 ">
                        <div class="product-rel">
                            <div class="auct-title  py-2">
                                <h4 class="text-center">100元</h4>
                                <h4 class="text-center">00:00:10</h4>
                            </div>
                            <div class="auct-list1 mx-5">
                                <div class=" py-2 bg-white">
                                    <ul>
                                        <li class="market">市價 : 5000元</li>
                                        <li class="market">NTD 100</li>
                                        <li class="market">現省 :  元</li>
                                    </ul>
                                </div>
                            </div>
                            <div>
                                <ul>
                                    <li> <h6>目前贏家:</h6>  </li>
                                    <li><button type="submit" class="bid-btn my-2">BID / 競標</button></li>
                                </ul> 
                            </div>
                        </div>
                    </div>
                    <div class="product col-md-4 mb-3">
                        <div class="product-rel">
                            <div class="auct-title py-3">
                                <h6 class="text-center">下標記錄</h6>
                            </div>
                            <div class="bid-table">
                                <div>
                                    <table>           
                                        <tr>
                                            <th>NTD</th>
                                            <th>下標者</th>
                                            <th>出價時間</th>
                                        </tr>
    ???                              
<!-- JSTL for-each -->

                                        <tr>
                                            <td>250元</td>
                                            <td>江西男</td>
                                            <td>12:03:20</td>
                                        </tr>

<!-- JSTL for-each   end-->

                                        <tr>
                                            <td>250元</td>
                                            <td>江西男</td>
                                            <td>12:03:20</td>
                                        </tr>
                                        <tr>
                                            <td>250元</td>
                                            <td>江西男</td>
                                            <td>12:03:20</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- JSTL for-each   end-->
            </div>
            <div class="product col-md-12 mb-5">
                <div class="product-rel">
                    <div class="auct-title  py-2">
                        <h6 class="pl-3">商品描述</h6>
                    </div>
                    <div class="auct-list px-5 py-4">
                        <h4 class="describe">不知道cumque consequuntur culpa omnis illum ea fugit fuga eius vel obcaecati. Beatae libero tempora asperiores non quos, fugiat perferendis, quidem excepturi magnam nesciunt pariatur sunt consectetur quam sint.
                        Temporibus natus delectus nesciunt. Accusamus sunt modi natus aut illo vel cumque quos reiciendis atque facere minus a autem omnis numquam, explicabo, dolorum obcaecati velit dignissimos sint unde, repellat libero.
                        Cum blanditiis iure laborum fuga cumque temporibus, distinctio optio aspernatur veritatis voluptas provident itaque atque, quidem ipsum reprehenderit illum earum soluta. Explicabo offi
                    </h4>
                    </div>
                </div>
            </div>
            <a href="Auct_index.jsp"><button type="submit" class="back-btn mb-4">回競標專區</button></a>
        </div>
    </section>
    
    <button id="chatBtn" class="bg-primary">
        <i class="fas fa-comments"></i>
    </button>

</body>
</html>