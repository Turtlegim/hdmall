<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
	int pwdCheck = 0; // 비밀번호 확인이 완료되지 않은 상태
%>

<head>
	<meta charset="utf-8">
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
	<script src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/main.ui.js?ver=18"></script>
	<link rel="shortcut icon" href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/main.css?ver=18">

	<!-- main 이미지 슬라이더 -->
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

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

		var mySwiper = new Swiper('.swiper-container', {
			// 슬라이드를 버튼으로 움직일 수 있습니다.
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},

			// 현재 페이지를 나타내는 점이 생깁니다. 클릭하면 이동합니다.
			pagination: {
				el: '.swiper-pagination',
				type: 'bullets',
			},

			// 현재 페이지를 나타내는 스크롤이 생깁니다. 클릭하면 이동합니다.
			scrollbar: {
				el: '.swiper-scrollbar',
				draggable: true,
			},

			// 4초마다 자동으로 슬라이드가 넘어갑니다. 1초 = 1000
			autoplay: {
				delay: 4000,
			},
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
			location.href = "${action}/hdmall/jsp/main.jsp";
		}
        
        $(document).on('click', '#logoutBtn', function () {
        	var userName = session.getElementById("userName");
        	
        	$.ajax({
                url: "${action}/hdmall/logout",
                method: "post", //요청방식은 post
                data: {"userName": userName},
                success: function(result) {
                	if(result.result == 1) {
            			alert("로그아웃 성공");
               	 	} else if(result.result == 0) {
            			alert("로그아웃 실패");		
               	   	} else {
            			console.log('develop : 서버 오류');
               	   	}
                },
                error:function(error){
                   	alert("AJAX요청 실패 : 에러코드 = " + error.status); // status 에러확인 
                }
             });
   		});
        
        $(document).on('click', '#pwdCheck', function () {
        	var userPwd = document.getElementById("userPwd").value;
        	
	       	if(userPwd == ""){
     		  	alert("비밀번호를 입력주세요.");
     		} else { // IdCheckController 요청
     			$.ajax({
                    url: "${action}/hdmall/pwdCheck",
                    method: "post", // 요청방식은 post
                    data: {"userPwd": userPwd},
                    success: function(result) {
                    	if(result.result == 1) {
                			alert("비밀번호 확인 성공");
                   	 	} else {
                			alert("비밀번호를 다시 입력해주세요.");
                   	   	}
                    }, error:function(error){
                       	alert("AJAX요청 실패 : 에러코드=" + error.status); // status 에러확인 
                    }
                 });
   			}
	       	
	       	pwdCheck = true;
   		});
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
	<%@ include file = "header.jsp"%>

	<div id="wrap">
	    <article id="content">
            <section>
                <div class="pw_recheck">
                    <p>회원님의 소중한 개인정보보호를 위하여<br>
                        비밀번호를 다시 한번 확인해 주시기 바랍니다.</p>
                    <span class="input_de"><input type="password" id="userPwd" value=""></span>
                    <div class="btn_area mt40">
                        <button type="button" class="btn_basic2 small" id="pwdCheck"
                                           style="width: 170px; height: 60px;">확인</button>
                    </div>    
                </div>
            </section>
	    </article>
	</div>
	
<%@ include file = "footer.jsp"%>			