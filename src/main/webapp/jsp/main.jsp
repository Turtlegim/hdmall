<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
			location.href = "main.jsp";
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
	<header id="header">
		<section class="box">
			<a href="javascript:" class="btn_gnb">Navigation Drawer</a>
			<h1 onclick="goMainPage();" style="cursor: pointer; height: 48px"><img id="mainLogo" src="${action}/hdmall/image/logo.png">
			</h1> <!-- 로고 이미지 src 변경 부분 -->

			<div class="default_menu">
			<%
				String userName = (String)session.getAttribute("userName");
			%>
			<%if (userName != null) { %>
				<a> <%=userName%>님 </a>
				<a href="${action}/hdmall/logout" id="logoutBtn">로그아웃</a>
			<%}else { %> 
				<a href="${action}/hdmall/login" id="loginBtn">로그인</a>
			<%} %>
				<ul>
					<li class="item_01">
						<a href="like.html">찜하기</a>
					</li>
					<li class="item_03">
						<a href="mypage.html">마이현대</a>
					</li>
					<li class="item_04">
						<a href="q&a_insert.html">고객센터</a>
					</li>
					<li class="exchange_rate exchageRateTxt"></li>
				</ul>
			</div>

			<!-- 히든메뉴 START -->
			<script type="text/javascript">
				function commOpenLayer(cookieChkYn, hiddenYn) {
					$.ajax({
						async: true,
						url: ctx_curr + "/dm/main/popInfo.json",
						dataType: "json",
						type: "POST",
						success: function (popInfo, textStatus, jqXHR) {
							var data = popInfo.resPop;
							var html = "";
							for (var i = 0; i < data.popSeqList.length; i++) {
								html += "<div class=\"main_popup\" id=\"main_bottom_pop" + data.popSeqList[i].popSeq + "\" data-seq=\"" + data.popSeqList[i].popSeq + "\">";
								var addClass = "";
								var addStyle = "";
								if (data.popSeqList[i].popTmplCd == '001') {
									addClass = "popswiper-container";
								} else {
									addClass = "html_wrap";
									addStyle = "style='width:560px; height: 368px;'";
								}
								html += "<div class=\"" + addClass + "\" " + addStyle + ">";
								if (data.popSeqList[i].popTmplCd == '001') {
									html += "<ul class=\"swiper-wrapper mainPopList\">";
									for (var j = 0; j < data.dataList.length; j++) {
										if (data.popSeqList[i].popSeq == data.dataList[j].popSeq) {
											html += "<li class=\"swiper-slide\">";
											var link = data.dataList[j].linkUrl != null ? data.dataList[j].linkUrl : "javascript:";

											var wiseLog = "";
											if (link != "javascript:") {
												if (link.indexOf("?") != -1) {
													wiseLog = "&MG=KR_PC_Main_Popup" + data.popSeqList[i].popSeq + "_" + data.dataList[j].popDtlSeq;
												} else {
													wiseLog = "?MG=KR_PC_Main_Popup" + data.popSeqList[i].popSeq + "_" + data.dataList[j].popDtlSeq;
												}
											}

											if (data.dataList[j].shrtVdoUrl != null) {
												html += "<video preload=\"none\" muted loop class='video-js'  style='width:560px; height:368px; object-fit:cover; background-color: black;'>";
												html += "<source src=\"https://cdn.hddfs.com/files/" + data.dataList[j].shrtVdoUrl + "\" type=\"video/mp4\">";
												html += "<strong>Your browser does not support the video tag.</strong>";
												html += "</video>";
											} else {
												var mainTitl = data.dataList[j].mainTitl != null ? data.dataList[j].mainTitl : "";
												var subTitl = data.dataList[j].subTitl != null ? data.dataList[j].subTitl : "";
												var bnnrWrd = data.dataList[j].bnnrWrd != null ? data.dataList[j].bnnrWrd : "";

												html += "<a href=\"" + link + wiseLog + "\"  class='item_wrap'>";
												html += "<div class='pop_txt'>";
												html += "<strong class='cate'>" + mainTitl + "</strong>";
												html += "<p>" + subTitl + "</p>";
												html += "<p>" + bnnrWrd + "</p>";
												html += "</div>";
												html += "<img src=\"https://cdn.hddfs.com/files/" + data.dataList[j].imgUrl + "?RS=750X494\" alt=\"" + data.dataList[j].mainTitl + "\">";
												html += "</a>";
											}
											html += "</li>";
										}
									}
									html += "</ul>";
									html += "<div class=\"swiper_control\" id=\"mainPop_" + data.popSeqList[i].popSeq + "\">";
									html += "<div class=\"swiper-pagination\"></div>";
									html += "<div class=\"swiper-prev\"></div>";
									html += "<div class=\"swiper-next\"></div>";
									html += "</div>";
								} else {
									html += data.popSeqList[i].htmlCont;
								}
								html += "</div>";
								html += "<div class=\"close_section\">";
								html += "<span class=\"today_close chk\">";
								html += "<input type=\"checkbox\" class=\"today_close\" id=\"btn_hidden_layer_" + data.popSeqList[i].popSeq + "\" onclick=\"saveMainLayerCookie(" + data.popSeqList[i].popSeq + ");\" hiddenYn=\"N\" />";
								html += "<label for=\"btn_hidden_layer_" + data.popSeqList[i].popSeq + "\" style=\"cursor: pointer;\">오늘 하루 보지 않기</label>";
								html += "</span>";
								html += "<span class=\"popup_close\"  data-seq=\"" + data.popSeqList[i].popSeq + "\" onclick=\"closeMainLayer(" + data.popSeqList[i].popSeq + ");\">닫기</span>";
								html += "</div>";
								html += "</div>";
							}
						}
					});
				}
			</script>

			<nav class="navication">
				<div id="gnb">
					<h2>Global Navigation Bar</h2>
					<ul class="depth_01">
						<li>
							<strong>전체서비스</strong>
							<ul class="depth_02 serviceMenu">
								<li>
									<a href="best.html">
										베스트</a>
								</li>
								<li>
									<a href="product_list.html">
										신상품</a>
								</li>
								<li>
									<a href="q&a_insert.html">
										고객센터</a>
								</li>
							</ul>
						</li>
						<li>
							<strong>카테고리</strong>
							<ul class="depth_02 serviceCtgList">
								<li>
									<a href="product_list.html">
										여성캐쥬얼</a>
								</li>
								<li>
									<a href="product_list.html">
										남성캐쥬얼</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				</div><button class="gnb_close">닫기</button>
			</nav>
	</header>
	<!-- 히든메뉴 END 03.05 경민영 -->

	<div id="wrap">
		<!-- 메인 상단 이미지 스와이프 START 03.07 경민영 -->
		<div class="swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img class="img_main" src="${action}/hdmall/image/main1.png" alt=""></div>
				<div class="swiper-slide"><img class="img_main" src="${action}/hdmall/image/main2.png" alt=""></div>
			</div>

			<script>
				const swiper = new Swiper('.swiper', {
					autoplay: true,
					loop: true
				});
			</script>

			<!-- 메인 상단 이미지 스와이프 END 03.07 경민영 -->

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