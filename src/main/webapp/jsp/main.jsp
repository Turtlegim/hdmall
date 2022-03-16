<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- 김기범 -->
<!-- hashmap을 이용하기 위한 import -->
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.Map.Entry" %>
<%
	HashMap<String, Integer> like_list = null; // 상품명과 좋아요 수를 저장하기 위한 객체 선언 
	Object obj = (Object) request.getAttribute("likelist"); // servlet으로부터 객체를 받아옴.
	if (obj != null)
		like_list = (HashMap<String, Integer>)obj; // 제대로 받아왔으면 형변환하여 변수에 대입
	Iterator <Entry<String, Integer>> entries = like_list.entrySet().iterator(); // hash에서 데이터를 꺼내오기 위한 이터레이터 선언.
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>현대픽픽스토어</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no">
	<script src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/lottie.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/main.ui.js?ver=18"></script>
	
	<link rel="icon" type="image/png" sizes="96x96" href="${action}/hdmall/image/favicon-96x96.png">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/main.css?ver=18">
	<link rel="stylesheet" href="${action}/hdmall/css/footer.css">
    <link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">

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
			location.href = "${action}/hdmall/main.do";
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
	<%@ include file = "header.jsp"%>
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
		</div>
		<!-- 메인 상단 이미지 스와이프 END 03.07 경민영 -->
	</div>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
	        //구글차트 
	        google.charts.load('current', {'packages':['corechart']}); 
	        google.charts.setOnLoadCallback(drawChart);
	        function drawChart() {
	            var data = new google.visualization.DataTable();
	            data.addColumn('string','상품명');
	            data.addColumn('number','찜한 수');
	
	            data.addRows([
	            	// key(상품명-varchar2) 와 value(찜 수-number)를 받아서 차트 생성
	            		<% 
	            	 	while (entries.hasNext()) {
	            			Map.Entry<String, Integer> entry = entries.next(); %>
	            			['<%=entry.getKey()%>',<%=entry.getValue()%>]<%if(entries.hasNext()){%>
	            				, <%}}%>
							]);
	            
	            var opt = {
	                    'title':'상품별 사용자 관심 누적 수',
	                    'width':1000,
	                    'height':600,
	                    pieSliceText:'value' + '개',
	                    legend:'labeled',
	                    pieHole: 0.4,
	                    colors: ['#FF0000', '#FF3E00', '#FF6F00', '#FFC600', '#FFF200', '#CDDD00', '#99C800', '#1E9600', 
	                    	'3D8076', '#0083B0', '5B6BE5', '#00B4DB', '#4568DC', '#B06AB3', '#7D69C7']
	            };
	            var chart = new google.visualization.PieChart(document.getElementById('myChart'));
	            chart.draw(data,opt);
	        }
        </script>
        <% if (!like_list.isEmpty()) { %>
        <div id="wrap">
			<div id="myChart" align='center'></div>
		</div>
		<%} %>
</body>
<%@ include file = "footer.jsp"%>			