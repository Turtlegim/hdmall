<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>현대백화점인터넷면세점</title>
	<script
		src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/lottie.min.js?ver=18"></script>
	<script
		src="https://cdn.hddfs.com/front/js/KO/jquery.bxslider.js?ver=18"></script>
	<script
		src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
	<script
		src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
	<script
		src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
	<link rel="shortcut icon"
		href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
	<link rel="stylesheet"
		href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
	<link rel="stylesheet"
		href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
	<link rel="stylesheet"
		href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
	<link rel="stylesheet"
		href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
	<link rel="stylesheet"
		href="https://cdn.hddfs.com/front/css/KO/n_hgk.css?ver=18">
	
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/crew/sns.js?ver=18"></script>
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/jquery.cookie.js?ver=18"></script>
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/cloud-zoom.1.0.2.js?ver=18"></script>
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>
	
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/makePCookie.js?ver=18"></script>
	
	
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/crew/hash.js?ver=18"></script>
	<script>
		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
					.exec(document.referrer);
			return results === null ? "" : decodeURIComponent(results[1].replace(
					/\+/g, " "));
		}
	
		var Naver_Previous_Query = getParameterByName('oquery');
		
		$(function() {
			$(".btn_gnb").on("click", function() {
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
	</script>

	<style>
		html, body {
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
		#prod_img {
			height: 180px;
			width: 180px;
		}
		.prod {
			display: flex
			height: 200px;
		}
	</style>
</head>

<body>
	
<%@ include file="header.jsp"%>
<div id="wrap">
		<!-- container -->
	<main id="container" class="container">

		<form id="selfReplace"
			action="https://www.hddfs.com/shop/or/order/listCart.do"
			method="post">
			<input id="selfReplaceCartCd" type="hidden" name="cartCd" value="" />
			<input id="selfReplaceScrollMove" type="hidden" name="scrollMove"
				value="" />
		</form>

		<article id="content" style="padding-bottom: 30px;">
			<section class="cart_wrap">
				<input type="hidden" id="checkedCartSeq" value=""> <input
					type="hidden" id="checkedCartSetId" value=""> <input
					type="hidden" id="buyNow" value=""> <input type="hidden"
					id="buyNowSetGoosId" value=""> <input type="hidden"
					id="chkPspt" value="0"> <input type="hidden" id="chkDpat"
					value="0"> <input type="hidden" id="buyNowType" value="">
				<input type="hidden" id="buyNowOnlnGoosCdList" value=""> <input
					type="hidden" id="adtAucaYn" value="N">
				<ul class="title_tab">
					<li><a href="javascript:void(0);"
						onclick='goCartTab("CART");' class="on" id="tabCart">찜하기 목록</a></li>
				</ul>
				<div class="cart_contens" style="padding-right: 0px;">
					<!-- CSS 적용한거 따로 파일에 만들지 고민 -->
					<div class="cont_left" id="CART">
							<!-- 찜하기 목록이 비어있습니다 :) -->
						<div class="cart_list">
						<c:forEach var="likelist" items="${likeboard }" varStatus="status">
						<div id="like_product">
							<a href="${contextPath }/productdetail/product?prod_id=${likelist.getId() }">
							<i class="tnr_font "><em><c:out value="${status.index+1}" />.</em></i>
								<div class="prod">
									<div class="img_w" style="">
										<img id="prod_img" data-src=<c:out value="./${likelist.getImg() }"/>
											src=<c:out value="./${likelist.getImg() }"/>
											alt=<c:out value="${likelist.getContext() }"/>
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=252x252';"
											class="lazy">
										<div class="on_btn"></div>
									</div>
									<div class="pro_i">
										<p class="ti_brand" style="font-size:20px"><strong>${likelist.getName() }</strong></p>
										<p class="tx_ex goosNm" style="font-size:15px">${likelist.getContext() }</p>
										<div class="por_icons"></div>
									</div>
								</div>
							</a>
							<a href="${contextPath }/likeCancel?prod_id=${likelist.getId() }">
							<button id="deletelike" type="button" style="font-size:20px">삭제</button>
							</a>
						</div>
					</c:forEach>
					</div>
						<div class="attention_area">
							<p class="attention_tit">유의사항</p>
							<div class="attention_list">
								&bull; 장바구니에 담긴 상품은 30일간 보관됩니다.(장기간 보관을 원하실 경우 관심상품으로
								등록(180일간 저장)하여 이용하시길 바랍니다.)<br /> &bull; 환율 변경 시점과 적립금의
								사용조건에 따라 장바구니의 예상결제금액과 최종결제금액은 상이할 수 있습니다.<br /> &bull; 실제
								할인금액은 개인별로 보유하신 적립금에 따라 차이가 있을 수 있습니다.<br />
							</div>
						</div>
						<div id="changeSetGoosQtyList"></div>
					</div>
			</section>
		</article>

		</main>
	</div>
<%@ include file="footer.jsp"%>