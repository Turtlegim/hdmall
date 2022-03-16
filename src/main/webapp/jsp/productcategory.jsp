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
	<meta name="google-site-verification" content="rYjJmYP3q9lxBYCTSa_Tg3h1N9l3yZjJGp0AFaKCZlM"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>현대픽픽스토어</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="format-detection" content="telephone=no">
    <script src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/lottie.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.bxslider.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
    
	<link rel="icon" type="image/png" sizes="96x96" href="${action}/hdmall/image/favicon-96x96.png">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/n_hgk.css?ver=18">
    <link rel="stylesheet" href="${action}/hdmall/css/footer.css">
    <link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">
    
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
			location.href = "${action}/hdmall/main.do";
		}
    </script>

<%@ include file="header.jsp" %> 
    <div id="wrap">
        <main id="container">

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
                        
                            <span class="txt_total">총 <strong id="goosListTotCnt">${count}</strong>개</span>
                            <input type="hidden" name="reGoosListTotCnt" id="reGoosListTotCnt" value="5763" />
                            <input type="hidden" name="reGoosListTotPage" id="reGoosListTotPage" value="145" />
                            <input type="hidden" name="filterResearchYn" id="filterResearchYn" value="N" />
                        </div>
						
				
                        <div class="product_list goosMoreArea ">
                            <ul>
                            	<c:forEach var="product" items="${productList}">
                                <!-- 상품 목록 for문으로 삽입하기 -->
                                <li data-gooscd="10229250014901" data-minbuyqty="1"
                                    class="product_itme goosList 10229250014901">
                                    <a href = "${contextPath}/productdetail?prod_id=${product.getId()}">
	                                    <div class="img_w">
	                                        <div style="position: absolute; width: 35px; height: 35px">
		                                        <button class="heartBtn">
			                                        <c:choose>
			                                        	<c:when test="${ product.getIslike() == 1}">                                    
			                                        		<c:set var="src" value="./image/heart_black.png"/>
			                                        	</c:when>
			                                        	<c:otherwise>
			                                        		<c:set var="src" value="./image/heart.png" />
			                                        	</c:otherwise>                                  
			                                        </c:choose>
			                                        <img id="heartImg" src= ${ src } />
		                                        </button>
	                                        </div> 
	                                        <div>                                
	                                            <img src="./image/product/${product.getImg()}">                                        
	                                        </div>
	                                        <div class="on_btn">
	                                        </div>
	                                    </div>
                                    </a>
                                    <div class="pro_i">
                                    	
                                        	<p class="ti_brand">${ product.getName()}</p>
                                      
                                        	<p class="tx_ex goosNm">${ product.getContext()}</p>
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

    </div>
<%@ include file="footer.jsp" %>    