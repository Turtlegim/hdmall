<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set  var="id"  value="hong"  scope="page" />
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
	String cate = (String)request.getAttribute("cate");
	int count = (int)request.getAttribute("count");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>현대백화점인터넷면세점</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="format-detection" content="telephone=no">
    <meta name="title" content="현대백화점인터넷면세점">
    <meta name="description" content="내 여행 최고의 목적지 현대백화점인터넷면세점! 세일, 사은행사, 쿠폰, 적립금, 럭키딜, 타임세일, 나만의 면세쇼핑을 즐겨보세요.">
    <meta name="metaKeywords"
        content="현대면세점, 현대백화점인터넷면세점, 현대인터넷면세점, 현대백화점면세점, 현대면세, 인터넷현대면세점, 현대온라인면세점, 현대백화점온라인면세점, 현대백화점DUTYFREE,현대무역센터면세점, 현대무역센터점, 현대동대문면세점, 현대동대문점, 현대인천공항면세점, 현대인천공항점, 면세쇼핑몰, 인터넷면세점, 온라인면세점, 인천공항면세점, 인천공항면세, 공항면세, 공항면세점, 공항쇼핑, dutyfree, 면세할인, 면세점할인, 면세가격, 면세점할인방법, 면세추천, 면세선물, 면세점선물, 면세점선물추천, 현대면세점인도장, 면세점인도장, 면세점상품수령, 쇼핑, 쇼핑몰, 명품쇼핑, 해외여행, 인천공항, 출장, 출국, 신혼여행, 허니문, 여행선물, 선물인터넷면세점주문, 인터넷면세점주문가능시간, 출국3시간전, 출국전쇼핑, 출국전인터넷쇼핑, 쿠폰, 할인쿠폰, 면세쿠폰, 면세점쿠폰, 현대면세점쿠폰, 적립금, 면세점적립금, 면세적립금, 현대면세점적립금,화장품, 향수, 가방, 명품, 해외명품, 브랜드, 면세점주류, 면세점담배, 면세점홍삼, 면세점화장품, 면세점향수, 면세점명품, 면세점시계, 면세점가방, 명품가방, 면세점정품">
    <meta property="og:title" content="현대백화점인터넷면세점">
    <meta property="og:image" content="https://cdn.hddfs.com/front/images/KO/common/hddfs_og.png">
    <script src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/lottie.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.bxslider.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
    <link rel="shortcut icon" href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/n_hgk.css?ver=18">
    <script language="javascript">
        // 현재 요청경로
        var ctx_curr = "//www.hddfs.com/shop";
        var ctx_shop = "https://www.hddfs.com/shop";
        var isLogin = false;
        var SERVER_IMAGE = "https://cdn.hddfs.com/front";
        var SERVER_IMAGE_MNG = "https://cdn.hddfs.com/files/";
        var SERVER_SCRIPT_JSON = "https://cdn.hddfs.com/files";
        var USER_AUTO_LOGOUT_TIME = 1800;
        var gUmbMbshUrl = "https://www.h-point.co.kr"; // 통합멤버쉽 주소
    </script>

    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/sns.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/jquery.cookie.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>

    <!-- S: 다이퀘스트 스크립트 추가 -->
    <script type="text/javascript"
        src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoCompleteCommon.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/diquest/dqHeader.js?ver=18"></script>
    <!-- E: 다이퀘스트 스크립트 추가 -->

    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/cloud-zoom.1.0.2.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>

    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/makePCookie.js?ver=18"></script>

    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/hash.js?ver=18"></script>
    <script>
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(document.referrer);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        var Naver_Previous_Query = getParameterByName('oquery');
    </script>

    <style>
        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        img {
            padding: 0;
            display: block;
            margin: 0 auto;
            max-height: 100%;
            max-width: 100%;
        }
    </style>
</head>

<body>
    <script type="text/javascript">
        $(window).load(function () {
            fnLnbCountInfo();
            orderStatusInfo();

        });

        $(function () {
            $(".btn_gnb").on("click", function () {
                $("#gnb > ul > li").removeClass("open").css("display", "");
                $("#gnb > ul > li > ul").css("display", "none");
                $(".serviceMenu").parent().removeClass("open");
                $(".serviceMenu").parent().addClass("open");
                $(".serviceMenu").css("display", "block");

                //카테고리 JSONP load
                if ($(".serviceCtgList > li").length < 1) {
                    loadCtgList();
                }
            });
        });

        function goMainPage() {
            sessionStorage.setItem("selMainSwiperPos", 1);
            location.href = "main.html";
        }

        $(function () {
            let heart = false;
            $(".heartBtn").on("click", function () {
                if (!heart) {
                    document.getElementById("heartImg").src = "./image/heart_black.png"
                    heart = true;
                } else {
                    document.getElementById("heartImg").src = "./image/heart.png"
                    heart = false;
                }
            })
        });
    </script>

 	<include file="${action}/hdmall/jsp/header.jsp">    
    <div id="wrap">
        <main id="container">
            <meta name="google-site-verification" content="rYjJmYP3q9lxBYCTSa_Tg3h1N9l3yZjJGp0AFaKCZlM" />

            <article class="location">
                <section class="box">
                    <a class="home">홈</a>
                    <div>
                        <a> ${cate} </a>
                    </div>
                </section>
            </article>

            <!-- 상품 목록 START -->
            <article id="content">
                <section>
                    <input type="hidden" id="reLoadYn" name="reLoadYn" value="N">
                    <div class="productlist">
                        <h2 class="page_tit">${cate}</h2>

                        <div class="filter_wrap goosFilterTabArea mt60">
                            <input type="hidden" id="startPrice" value="1" />
                            <input type="hidden" id="endPrice" value="4629" />

                            <div class="sel_filter" style="display:none;">
                                <ul class="searchFilterArea"></ul>
                            </div>
                        </div>

                        <div class="sorting_wrap">
                        	
                            <span class="txt_total">총 <strong id="goosListTotCnt">${ count }</strong>개</span>
                            <input type="hidden" name="reGoosListTotCnt" id="reGoosListTotCnt" value="5763" />
                            <input type="hidden" name="reGoosListTotPage" id="reGoosListTotPage" value="145" />
                            <input type="hidden" name="filterResearchYn" id="filterResearchYn" value="N" />
                        </div>
						
				
                        <div class="product_list goosMoreArea ">
                            <ul>
                            	<c:forEach var="new_pro_view" items="${productList}">
                                <!-- 상품 목록 for문으로 삽입하기 -->
                                <li data-gooscd="10229250014901" data-minbuyqty="1"
                                    class="product_itme goosList 10229250014901">
                                    <div class="img_w">
                                        <div style="position: absolute; width: 35px; height: 35px">
                                            <button class="heartBtn"><img id="heartImg"
                                                    src="./image/heart.png" /></button>
                                        </div>
                                        <div>
                                        	<!-- src="product_detail.html"  -->
                                        	<%-- <a href="ProductDetailController?productdetail&pseq=${new_pro_view.prod_id}">  --%>
                                           <%--  <a href = "${contextPath}/productdetail?prod_id=${new_pro_view.prod_id}"> --%> 
                                            
                                            	<img src="./image/product/${new_pro_view.img}">

                                          
                                        </div>
                                        <div class="on_btn">
                                        </div>
                                    </div>
                                    <div class="pro_i">
                                    	<a href = "${contextPath}/productdetail?prod_id=${new_pro_view.id}"> 
                                        	<p class="ti_brand">${ new_pro_view.name}</p>
                                        </a>
                                        <p class="tx_ex goosNm">${ new_pro_view.context}</p>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </section>
            </article>
            <!-- 상품 목록 END -->
        </main>

<!--         <script type="text/javascript">
            function sellerInfo() {
                $("#seller_information").dialog("open");
            }
            $(document).ready(function () {
                // 다이얼로그 초기화
                $("#seller_information").dialog({
                    autoOpen: false,
                    resizable: false,
                    width: 400,
                    maxHeight: 340,
                    modal: true
                });
            });
            function moveToMain() {
                location.href = ctx_shop + '/dm/main.do';
            }
        </script> -->
    </div>
<include file="{action}/hdmall/jsp/footer.jsp">    