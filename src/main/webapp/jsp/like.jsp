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
	<link rel="stylesheet" href="${action}/hdmall/css/footer.css">
    <link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">
	
	
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
	</script>
	
	<script type="text/javascript">
		function goMainPage() {
			sessionStorage.setItem("selMainSwiperPos", 1);
			location.href = "${action}/hdmall/main.do";
		}
	
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
		
		.top_line {
    		border-top: 3px solid #1b1e23;
    		margin: 0 auto;
		}
		
		div#like_product {
   			 display: inline-flex;
    		 text-align: center;
    		 align-content: center;
		}
		.prod {
    		display: inline-flex;
    		align-items: center;
		}

		.pro_i{
    		 display: inline-flex;
    		 align-items: center;
		}
		
		button#deletelike {
    			padding: 12px;
    			border: solid 2px lightgray;
    			border-radius: 13px;
			}
			
	    .deletelike:hover{
    			background: #dcdcdc;
    			color: white;
    			transition: all 0.5s;
    			}
		
	</style>
</head>

<body>
	
<%@ include file="header.jsp"%>
<div id="wrap">
		<!-- container -->
	<script>
		$( document ).ready(function() {
	    	if (userName == null) {
	    		alert("찜하기 화면은 로그인 후 이용 가능합니다.");
	    	}
	    });
	</script>
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
				<ul class="title_tab" style="margin-left: 20px;">
					<li><a href="javascript:void(0);"
						onclick='goCartTab("CART");' class="on" id="tabCart">찜하기 목록</a></li>
				</ul>
				<div class="cart_contents" style="padding-right: 0px;">
					<!-- CSS 적용한거 따로 파일에 만들지 고민 -->
					<div class="top_line" id="CART">
							<!-- 찜하기 목록이 비어있습니다 :) -->
						<div class="cart_list" style="margin">
						<c:forEach var="likelist" items="${likeboard }" varStatus="status">
						<div id="like_product" style="margin-top: 50px; margin-bottom:25px;">
							<a href="${contextPath }/productdetail/product?prod_id=${likelist.getId() }">
							<i class="tnr_font" style="width: 30px; height: 180px; float: left; margin-left: 25px; margin-right: 25px;"><em style="height: 180px;"><c:out value="${status.index+1}" />.</em></i>
								<div class="prod" style="width: 1000px;">
									<div class="img_w" style="width: 180px; float: left;">
										<img id="prod_img" data-src=<c:out value="./${likelist.getImg() }"/>
											src=<c:out value="./${likelist.getImg() }"/>
											alt=<c:out value="${likelist.getContext() }"/>
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=252x252';"
											class="lazy">
										<div class="on_btn"></div>
									</div>
									<div class="pro_i">
										<p class="ti_brand" style="font-size:20px; float:left;     margin-left: 50px;"><strong>${likelist.getName() }</strong></p>
										<p class="tx_ex goosNm" style="font-size:15px; margin-left: 25px;  width: 650px;">${likelist.getContext() }</p>
										<div class="por_icons" ><a href="${contextPath }/likeCancel?prod_id=${likelist.getId() }">
											<button  class = "deletelike" id="deletelike" type="button" style="font-size:15px; float: right;">삭제</button>
										</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
					</div>
						<div class="attention_area">
							<p class="attention_tit">유의사항</p>
							<div class="attention_list">
								&bull; 찜한 상품들이 보관됩니다.(구매를 원하실때엔 현대백화점 인터넷면세점에서 구매가능합니다.)<br /> &bull; 찜한목록을 삭제하고싶다면
								삭제버튼을 눌러주세요.<br /> &bull; 
								각자의 취향대로 찜한 상품들의 상세사항을 보고싶다면 상품을 클릭해주세요.<br />
							</div>
						</div>
						<div id="changeSetGoosQtyList"></div>
					</div>
			</section>
		</article>
		</main>
	</div>
<%@ include file="footer.jsp"%>