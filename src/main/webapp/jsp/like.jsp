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
	 <script type="text/javascript"><!--
		$(window).load(function() {
			fnLnbCountInfo();
			orderStatusInfo();

		});

		function fnLnbCountInfo() {
			$.ajax({
				async : true,
				url : "//www.hddfs.com/shop/cm/comm/lnbInfo.json",
				dataType : "json",
				type : "POST",
				success : function(data, textStatus, jqXHR) {
					//if(!crew.ajaxValidate(data)){ return; }

					var result = data.cartCnt;
					if (result >= 99) {
						result = "99+";
					}

					if (data.cartCnt > 0) {
						$("#rwingCartCnt").html(result);
						$("#rwingCartCnt").show();
					} else {
						$("#rwingCartCnt").html("0"); //전체삭제시 장바구니 카운트가 초기화 되지 않아 장바구니 추가시 기존카운트에 추가됨.
						$("#rwingCartCnt").hide();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					//console.log(jqXHR.status);
				}
			});
		}

		function orderStatusInfo() {
			if (isLogin) {
				$
						.ajax({
							async : true,
							url : "//www.hddfs.com/shop/cm/comm/orderStatusInfo.json",
							dataType : "json",
							type : "POST",
							success : function(data, textStatus, jqXHR) {
								if (!crew.ajaxValidate(data)) {
									return;
								}

								var result020 = typeof (data.orderStatInfo['020']) == "undefined" ? 0
										: Number(data.orderStatInfo['020']); //주문완료
								var result030 = typeof (data.orderStatInfo['030']) == "undefined" ? 0
										: Number(data.orderStatInfo['030']); //상품준비중
								var result040 = typeof (data.orderStatInfo['040']) == "undefined" ? 0
										: Number(data.orderStatInfo['040']); //상품이동중
								var result050 = typeof (data.orderStatInfo['050']) == "undefined" ? 0
										: Number(data.orderStatInfo['050']); //인도대기

								var result = result020 + result030 + result040
										+ result050;

								if (result >= 99) {
									result = "99+";
								}
								$(".orderStatusTxt").html(
										result == null ? 0 : result);

								//관심 브랜드 처리
								var interestList = data.interestBranList;
								var interestListLength = $(".interestBranList > li").length;
								if (interestList.length + interestListLength > 20) {
									for (var i = 0; i < (interestList.length
											+ interestListLength - 20); i++) {
										$(".interestBranList > li:last")
												.remove();
									}
								}

								var html = "";
								for (var i = 0; i < interestList.length; i++) {
									var onlnBranCd = interestList[i].onlnBranCd;
									if ($(".interest" + onlnBranCd).length < 1) {
										html += "<li class=\"interest" + onlnBranCd + "\">";
										html += "<a  href=\"https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd="
												+ onlnBranCd + "\">";
										html += "<p>" + interestList[i].branNm
												+ "</p>";
										html += "<img src=\"https://cdn.hddfs.com/files/"
												+ interestList[i].branReprImgUrl
												+ "?sf=webp&RS=200x200\" alt=\"\" onerror=\"this.onerror=null; this.src='https://cdn.hddfs.com/front/images/M_KO/common/noimg.png?sf=webp&RS=200x200';\">";
										html += "</a>";
										html += "</li>";
									}
								}
								$(".interestBranList").prepend(html);

								if ($(".interestBranList > li").length < 1) {
									$(".interestBranList").parent().remove();
								}
							},
							error : function(jqXHR, textStatus, errorThrown) {
								console.log(jqXHR.status);
							}
						});
			} else {
				if ($(".interestBranList > li").length < 1) {
					$(".interestBranList").parent().remove();
				}
			}
			if ($(".luxuryAreaList > li").length < 1) { //럭셔리 없는 경우 항목삭제
				$(".luxuryAreaList").parent().remove();
			}
		}
-->
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
		}
	</script> 
	
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

<!-- 			<script type="text/javascript">
				$(window)
						.bind(
								"pageshow",
								function(event) {
									if (event.originalEvent.persisted
											|| (window.performance && window.performance.navigation.type == 2)) {
										location.href = 'https://www.hddfs.com/shop/or/order/listCart.do'
									}
								});

				$(document).ready(function() {
					if ($("#cartCd").val() != "001") {
						$(".loadProgBar").css("display", "none");
					}
					$(".select_items a").click(function() {
						$(".select_items").hide();
					});
					$(document).mouseup(function(e) {
						if ($(".select_items").has(e.target).length === 0)
							$(".select_items").hide();
					});
				});

				$(function() {
					$(".btn_onoff").click(function() {
						if ($(this).hasClass("on")) {
							$(this).removeClass("on");
						} else {
							$(this).addClass("on");
						}
					});

					$(".tooltip").hide();
					$(".btn_tooltip").click(function() {
						$(this).next(".tooltip").show();
					});
					$(".close").click(function() {
						$(this).parent(".tooltip").hide();
					});
				});

				$(function() {
					var product_slider = 4;
					$(".product-module-swipera")
							.each(
									function(index, element) {
										var $this = $(this);
										$this.addClass("instance-swipwe-"
												+ index);
										$this
												.siblings(".swiper-prev")
												.addClass(
														"instance-prev" + index)
										$this
												.siblings(".swiper-next")
												.addClass(
														"instance-next" + index)

										var swiper = new Swiper(
												".instance-swipwe-" + index,
												{
													slidesPerView : "auto",
													spaceBetween : 16,
													slidesPerGroup : 1,
													observer : true,
													observeParents : true,
													navigation : {
														nextEl : '.instance-next'
																+ index,
														prevEl : '.instance-prev'
																+ index
													}
												});

										if ($(this).find('.swiper-slide').length <= product_slider) {
											$(this)
													.parent()
													.find(
															'.swiper-next, .swiper-prev')
													.hide();
										}
									});
				});

				function maxDcAmtInfo() {

					var setGoosId = [];
					var setGoooCd = [];
					var setGoosQty = [];

					$("input[name='chkSetCartSeq']:checked").each(
							function() {
								var checkedsetGoosId = $(this).attr(
										"data-setGoosId");
								var checkedSetIdx = $(this).attr("data-idx");

								$("input[name='setGoosQtyVal']").each(
										function() {

											var index = $(this)
													.attr("data-idx");
											var goosQty = 0;
											var onlnGoosCd = 0;
											if (checkedSetIdx === index) {
												goosQty = $(this).attr(
														"data-goosQty");
												onlnGoosCd = $(this).attr(
														"data-setOnlnGoosCd");
												setGoosQty.push(goosQty);
												setGoooCd.push(onlnGoosCd);
											}

										});
							});

					var goosQtyList = [];
					var onlineGoosCdList = [];
					$("input[name='cartSeq']:checked").each(function() {
						var checkedIdx = $(this).attr("data-idx");
						var onlnGoosCd = $(this).attr("data-onlnGoosCd");
						var goosQty = $("#goosQty" + checkedIdx).val();

						onlineGoosCdList.push(onlnGoosCd);
						goosQtyList.push(goosQty);
					});

					goosQtyList = goosQtyList.join(",");
					onlineGoosCdList = onlineGoosCdList.join(",");

					setGoooCd = setGoooCd.join(",");
					setGoosQty = setGoosQty.join(",");

					getMaxDcPrc(onlineGoosCdList, goosQtyList, setGoooCd,
							setGoosQty);
				}

				function goosDetail(goosCd) {
					setCookie('ADULT_GOOSCD', goosCd);
					openPopup('', 'cartGoosCdDetail', goosCd, '', '', '', '',
							'');
				}
			</script>
-->		</main>
	</div>

	<!-- // container -->
	<!-- <script type="text/javascript">
		function sellerInfo() {
			$("#seller_information").dialog("open");
		}
		$(document).ready(function() {
			// 다이얼로그 초기화
			$("#seller_information").dialog({
				autoOpen : false,
				resizable : false,
				width : 400,
				maxHeight : 340,
				modal : true
			});
		});
		function moveToMain() {
			location.href = ctx_shop + '/dm/main.do';
		}
	</script> -->
<%@ include file="footer.jsp"%>