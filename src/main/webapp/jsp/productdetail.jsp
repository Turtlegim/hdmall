<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>현대백화점인터넷면세점</title>
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
    <link rel="shortcut icon" href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/n_hgk.css?ver=18">
    <link rel="stylesheet" href="../css/detailprod.css">
    <link rel="stylesheet" href="${action}/hdmall/css/footer.css">
    <link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">

    <script language="javascript">
        // 현재 요청경로
        var ctx_curr = "//www.hddfs.com/shop";
        var ctx_shop = "https://www.hddfs.com/shop";
        var isLogin = true;
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
			location.href = "${action}/hdmall/jsp/main.jsp";
		}
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
    <div id="wrap">
        <script type="text/javascript">
            
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
                location.href = "${action}/hdmall/jsp/main.jsp";
            }
            
            $(function () {
                let like = false;
                $(".likebtn").on("click", function () {
                    if (!like) {
                        document.querySelector("#likeheart").style.color = "red";
                        like = true;
                    } else {
                        document.querySelector("#likeheart").style.color = "white";
                        like = false;
                    }
                })
            });
            </script>


<%@ include file="header.jsp" %>  

        <!-- container -->
    <main id="container">
            <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/productdetail.css">
            <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/product.css">
            <script src="https://cdn.hddfs.com/front/js/KO/product.js"></script>
			
            <article id="content" class="productdetail">
                <section class="pd_area">
                    <div class="pd_visual" style="padding: 100px 18px;">
                        <div class="swiper-container swiper_visual">
                            
                                <div class="swiper-slide">
                                    <a href="javascript://">이미지 크게보기</a>
                                    <img src="./image/product/${productVO.img}" />
                                </div>
                        </div>

                    </div>
                    <div class="pd_info" style="padding: 40px 180px 100px 120px;">
                        <div class="summary_info" style="margin-top: 150px;">

                            <h2><strong>Product Info 제품정보</strong></h2>

                            <div class="price">
                                <ul class="del">
                                    <li>
                                        <strong style="font-size: 19px;">
                                            제품명 </strong>
                                        <p style="font-size: 18px; padding-top: 8px;">
                                            ${productVO.name}</p>
                                    </li>
                                    <li>
                                        <strong style="font-size: 19px;">
                                            판매가 </strong>
                                        <p style="font-size: 18px; padding-top: 8px;">
                                            ${productVO.price}원</p>
                                    </li>
                                    <li>
                                        <strong style="font-size: 19px;">
                                            카테고리</strong>
                                        <p style="font-size: 18px; padding-top: 8px;">
                                            ${productVO.cate_no}</p>
                                    </li>
                                    <li>
                                        <strong style="font-size: 19px;">
                                            제품설명</strong>
                                        <p style="font-size: 18px; padding-top: 8px;">
                                            ${productVO.context}</p>
                                    </li>
                                    <li>
                                        <strong style="font-size: 19px;">
                                            좋아요</strong>
                                        <p style="font-size: 18px; padding-top: 8px;">
                                            0개</p>
                                    </li>
                                </ul>
                            </div>
                        </div>


                        <div class="productdetail_cart">
                            <br>
                            <hr style="border: solid 1px rgb(109, 101, 101);">
                            <div class="selectlist"></div>
                        </div>
                        <div class="button_area">
                            <button class="likebtn" style="    width: 100%;
                            background: #1b1e23;
                            color: #fff;
                            font-size: 16px;
                            font-weight: 600;
                            text-align: center;
                            line-height: 60px;
                            ">찜하기 <span id="likeheart">♥</span></button>
                            <div id="wrap"> </div>
                        </div>
                        <ul class="layercall"></ul>
                    </div>
                </section>
            </article>
            </main>
    </div>
    	<script src="https://cdn.hddfs.com/front/js/KO/productdetail.js"></script>

    <script type="text/javascript">
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
    </script>
    <!-- footer start 배지현 (03.07) -->
    <div id="wrap">
        <footer id="footer">
            <div class="policy">
                <div class="copy">
                    <div class="copyright">
                        <div class="logo">
                            <!-- <span onclick="moveToMain();" style="cursor:pointer;">HYUNDAI DEPARTMENT SHOP - DUTY FREE</span>-->
                            <strong>현대 IT&E 1차 프로젝트(2조) </strong>
                        </div>
                        <ul>
                            <li>
                                <span>김기범</span>
                                <span>배지현</span>
                                <span>김민수</span>
                                <span>경민영</span>
                            </li>
                            <li>
                                <span>대표메일 : turtlegim@gmail.com</span>
                            </li>
                        </ul>
                    </div>
                    <div class="escrow">
                        <strong>서블릿 MVC2 패턴과 오라클 DB[PL-SQL] 활용</strong>
                        <span>
                            2022년 03월 18일까지 열심히 한 프로젝트입니다. 예쁘게 봐주세요.
                        </span>
                        <p>주식회사 현대 IT&E 2조</p>
                        <p>2조 is awsome</p>
                        <!--//award-->
                    </div>
                </div>
        </footer>
    </div>
</body>

</html>