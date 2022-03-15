<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
  request.setCharacterEncoding("UTF-8");
  int likecount = (int)request.getAttribute("likecount");
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
    <meta name="title" content="현대백화점인터넷면세점">
    <meta name="description" content="내 여행 최고의 목적지 현대백화점인터넷면세점! 세일, 사은행사, 쿠폰, 적립금, 럭키딜, 타임세일, 나만의 면세쇼핑을 즐겨보세요.">
    <meta name="metaKeywords"
        content="현대면세점, 현대백화점인터넷면세점, 현대인터넷면세점, 현대백화점면세점, 현대면세, 인터넷현대면세점, 현대온라인면세점, 현대백화점온라인면세점, 현대백화점DUTYFREE,현대무역센터면세점, 현대무역센터점, 현대동대문면세점, 현대동대문점, 현대인천공항면세점, 현대인천공항점, 면세쇼핑몰, 인터넷면세점, 온라인면세점, 인천공항면세점, 인천공항면세, 공항면세, 공항면세점, 공항쇼핑, dutyfree, 면세할인, 면세점할인, 면세가격, 면세점할인방법, 면세추천, 면세선물, 면세점선물, 면세점선물추천, 현대면세점인도장, 면세점인도장, 면세점상품수령, 쇼핑, 쇼핑몰, 명품쇼핑, 해외여행, 인천공항, 출장, 출국, 신혼여행, 허니문, 여행선물, 선물인터넷면세점주문, 인터넷면세점주문가능시간, 출국3시간전, 출국전쇼핑, 출국전인터넷쇼핑, 쿠폰, 할인쿠폰, 면세쿠폰, 면세점쿠폰, 현대면세점쿠폰, 적립금, 면세점적립금, 면세적립금, 현대면세점적립금,화장품, 향수, 가방, 명품, 해외명품, 브랜드, 면세점주류, 면세점담배, 면세점홍삼, 면세점화장품, 면세점향수, 면세점명품, 면세점시계, 면세점가방, 명품가방, 면세점정품">
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
           
            
            // 찜하기 버튼이 로그인시에만 이용가능하고 버튼을 누를 떄 하트 색이 변경하는 함수  김민수 03/13            
           $(function () {
                let like = document.querySelector("#likeheart").style.color;
                let userId = '<%= (String)session.getAttribute("userId") %>';
				let prodId = '${productVO.id}';
				let isLike = '${likeVO.is_liked}';
                
                $(".likebtn").on("click", function () {
                	if ( userId == "null" ) {
                		alert("찜하기는 로그인시 이용가능합니다.");
                	}
                	else {
                		
                		if (like == "red") {
	                        document.querySelector("#likeheart").style.color = "white";
	                        like = "white"
	                    } else {
	                        document.querySelector("#likeheart").style.color = "red";
	                        like = "red"
	                    }
                		
                		$.ajax({
                            url: "${contextPath}/LikeProduct",
                            method: "post", // 요청방식은 post
                            data: {"userId": userId, "prodId" : prodId, "isLike" : isLike},
                            success: function(result) {
                            	if(result == 1) {
                        			alert("상품을 찜을 취소 또는 재등록하였습니다.");
                           	 	} else if(result == 2) {
                        			alert("상품을 찜하였습니다.");	
                           	   	} else {
                        			console.log('develop : 서버 오류');
                           	   	}
                            }, error:function(error){
                               	alert("AJAX요청 실패 : 에러코드=" + error.status); // status 에러확인 
                            }
                         });              		              		
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
                                            ${likecount}개</p>
                                    </li>
                                </ul>
                            </div>
                        </div>

						
                        <div class="productdetail_cart">
                            <br>
                            <hr style="border: solid 1px rgb(109, 101, 101);">
                        </div>
  	                    <div class="button_area">
	                           <button class="likebtn" style="    
	                            width: 100%;
	                            background: #1b1e23;
	                            color: #fff;
	                            font-size: 16px;
	                            font-weight: 600;
	                            text-align: center;
	                            line-height: 60px;">찜하기 
	
	                        	<c:choose>  
									<c:when test="${ likeVO.is_liked == true}"> 
										<span id="likeheart" style="color:red">♥</span>
									</c:when> 
									<c:otherwise> 
										<span id="likeheart">♥</span>
									</c:otherwise> 
								</c:choose>
	                            </button>
	                            <div id="wrap"> </div>
	                     </div>              
                    </div>
                </section>
            </article>
            </main>
    </div>
   	<script src="https://cdn.hddfs.com/front/js/KO/productdetail.js"></script>
    	
<%@ include file="footer.jsp" %>    