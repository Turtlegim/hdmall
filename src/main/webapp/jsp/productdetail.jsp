<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
  request.setCharacterEncoding("UTF-8");
  int likecount = (int)request.getAttribute("likecount");
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
       	

        // 김민수 : 찜하기 버튼이 로그인시에만 이용가능하고 버튼을 누를 떄 하트 색이 변경하는 함수                     
       	$(function () {
       		// 현재 찜하기 하트 색상, userid, prodid, islike 저장
            let like = document.querySelector("#likeheart").style.color;
            let userId = '<%= (String)session.getAttribute("userId") %>';
			let prodId = '${productVO.id}';
			let isLike = '${islike}';
            
			// 버튼 클릭시 로그인여부에 따라 처리 
			$(document).on("click", ".likebtn", function () {
            	if ( userId == "null" ) {
            		alert("로그인 후 이용 가능한 서비스입니다.");
            	}
            	else {
            		
            		// 클릭시 버튼 색상 변경
            		if (like == "red") {
                        document.querySelector("#likeheart").style.color = "white";
                        like = "white"
                    } else {
                        document.querySelector("#likeheart").style.color = "red";
                        like = "red"
                    }
            		
            		// ajax로 LikeProduct에 data를 전달
            		 $.ajax ({
                        url: "${contextPath}/LikeProduct?t=" + new Date().getTime(),
                        method: "post", // 요청방식은 post
                        data: {"userId": userId, "prodId" : prodId, "isLike" : isLike},
                        success: function(result) { 
                        	if(result == 1) {
                    			alert("찜하기 취소"); // 찜했던 상품을 누르면 찜을 취소하고, 찜을 안했던 상품을 누르면 찜하기 동작 실행
                    			isLike = 0;
                        	} else if(result == 2) {
                    			alert("상품을 찜하였습니다.");
                    			isLike = 1;
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
    
    <style>
    	element.style {
    		min-width: 0px;
		}

        html,
        body {
            height: 100%;
            margin: 0 auto;
            padding: 0;
        }

        img {
            padding: 0;
            display: block;
            margin: 0 auto;
            max-height: 100%;
            max-width: 100%;
        }
        .likebtn {
        	width: 100%;
        	background: #1b1e23;
	        color: #fff;
	        font-size: 16px;
	        font-weight: 600;
	        text-align: center;
	        line-height: 60px;
        }
        
        #pdinfo {
        	font-size: 18px; 
        	padding-top: 8px;
        }
    </style>
</head>

<body style="overflow-x: hidden">

<%@ include file="header.jsp" %>  
        <!-- container -->
    <main id="container">
    <div id="wrap">
            <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/productdetail.css">
            <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/product.css">
            <script src="https://cdn.hddfs.com/front/js/KO/product.js"></script>
			
            <article id="content" class="productdetail">
                <section class="pd_area">
                	<div style="margin-left: 200px; margin-top: 150px; float: left;">                       
                        <img src="./image/product/${productVO.getImg()}" style="width: 460px; height: 460px"/>
                    </div>
                    <div class="pd_info" style="height: 830px;">
                        <div class="summary_info" style="margin-top: 150px;">
                            <h2><strong>Product Info 제품정보</strong></h2>

                            <div class="price">
                                <ul class="del">
                                    <li>
                                        <strong style="font-size: 19px;">
                                            제품명 </strong>
                                        <p id="pdinfo">
                                            ${productVO.getName()}</p>
                                    </li>
                                    <li>
                                        <strong style="font-size: 19px;">
                                            판매가 </strong>
                                        <p id="pdinfo">
                                            ${productVO.getPrice()}원</p>
                                    </li>
                                    <li>
                                        <strong style="font-size: 19px;">
                                            카테고리</strong>
                                        <p id="pdinfo">
                                            ${productVO.getCate_no()}</p>
                                    </li>
                                    <li style="width: 400px;">
                                        <strong style="font-size: 19px;">
                                            제품설명</strong>
                                        <p id="pdinfo">
                                            ${productVO.getContext()}</p>
                                    </li>
                                    <li>
                                        <strong style="font-size: 19px;">
                                            좋아요</strong>
                                        <p id="pdinfo">
                                            ${likecount}개</p>
                                    </li>
                                    <li>
                                        <strong style="font-size: 19px;">
                                            조회수</strong>
                                        <p id="pdinfo">
                                            ${productVO.getHitnum()}</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="productdetail_cart">
                            <br>
                            <hr style="border: solid 1px rgb(109, 101, 101);">
                        </div>
  	                    <div class="button_area">
	                           <button class="likebtn">찜하기 
								
								<!-- 김민수 : 상품 상세페이지에서 user의 찜하기 여부에 따라 하트 색상 변경-->
	                        	<c:choose>  
									<c:when test="${ islike == 1}"> 
										<span id="likeheart" style="color:red">♥</span>
									</c:when> 
									<c:otherwise> 
										<span id="likeheart">♥</span>
									</c:otherwise> 
								</c:choose>
	                            </button>
	                     </div>              
                    </div>
                </section>
            </article>
           </div>
        </main>
</body>
<%@ include file="footer.jsp" %>    