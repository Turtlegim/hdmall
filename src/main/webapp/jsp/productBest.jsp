<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>현대백화점인터넷면세점</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no">
	<script
		src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/lottie.min.js?ver=18"></script>
	<script
		src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
	<script
		src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
	<script
		src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/main.ui.js?ver=18"></script>
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
		href="https://cdn.hddfs.com/front/css/KO/main.css?ver=18">
		
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
	
	<!-- S: 다이퀘스트 스크립트 추가 -->
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoCompleteCommon.js?ver=18"></script>
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/diquest/dqHeader.js?ver=18"></script>
	<!-- E: 다이퀘스트 스크립트 추가 -->
	
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
	<link rel="stylesheet" href="${action}/hdmall/css/footer.css">
	<link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">
	
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
		
		//전체 클릭시
		function allBestList() {
			var url = '<c:out value="${contextPath}"/>';

			location.href = url + "/best";
		}	// tab_item
		
		$(function () {
            let tab = false;
            $(".all").on("click", function () {
                if (!tab) {
                	document.getElementById("tab_round").background = "#5c6677";
                    tab = true;
                } else {
                    document.getElementById("tab_round").background = "#fff";
                    tab = false;
                }
            })
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
	</style>
</head>

<body>
	<script type="text/javascript">
		$(window).load(function() {
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
			location.href = "main.html";
		}
	</script>

	<%@ include file="header.jsp" %>  
	<div id="wrap">
		<!-- container -->
		<main id="container">
			<article class="location">
				<section class="box">
					<a href="https://www.hddfs.com/shop/dm/main.do" class="home">홈</a>
					<div>
						<a href="javascript:;" style="cursor: default">베스트</a>
					</div>
				</section>
			</article>

			<article id="content2">
				<h2 class="page_tit">베스트</h2>
				<section>
					<div class="specialm_visual">
						<div class="tabsort_wrap tab-style">
							<ul class="tab_round">
								<li class="tab_item" id="all">
								    <a href="${contextPath}/best">전체</a>
							    </li>
								<li class="tab_item" id="female">
								    <a href="${contextPath}/best?cate_no=여성캐쥬얼">여성캐쥬얼</a>
								</li>
								<li class="tab_item" id="male">
								    <a href="${contextPath}/best?cate_no=남성캐쥬얼">남성캐쥬얼</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="prd_list_new">
						<div class="special_content lank_top">
							<div class="product_list best_three" style="height: 540px">
								<ul style="height: 440px">
									<c:forEach var="vo" items="${best}" begin="0" end="2"
										varStatus="status">
										<li style="height: 420px"><a href="product_detail.html">
												<i class="tnr_font "><em><c:out
															value="${status.count}" />.</em></i>
												<div class="img_w">
													<img data-src=<c:out value="./${vo.getImg() }"/>
														src=<c:out value="./${vo.getImg() }"/>
														alt=<c:out value="${vo.getContext() }"/>
														onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=252x252';"
														class="lazy">
													<div class="on_btn"></div>
												</div>
												<div class="pro_i">
													<p class="ti_brand">${vo.getName() }</p>
													<p class="tx_ex goosNm">${vo.getContext() }</p>
												</div>
										</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="bstpro_num">
							<div class="product_list">
								<ul>
									<c:forEach var="vo" items="${best}" begin="3" end="6"
										varStatus="status">
										<li data-gooscd="10249300004701" data-minbuyqty="1"
											class="product_itme goosList 10249300004701"><a
											href="product_detail.html"> <i class="tnr_font "><em><c:out
															value="${status.index + 1}" />.</em></i>
												<div class="img_w">
													<img data-src=<c:out value="./${vo.getImg() }"/>
														src=<c:out value="./${vo.getImg() }"/>
														alt=<c:out value="${vo.getContext() }"/>
														onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=252x252';"
														class="lazy">
													<div class="on_btn"></div>
												</div>
												<div class="pro_i">
													<p class="ti_brand">${vo.getName() }</p>
													<p class="tx_ex goosNm">${vo.getContext() }</p>
													<div class="por_icons"></div>
												</div>
										</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</section>
			</article>
		</main>
	</div>
	<%@ include file="footer.jsp" %>  
</body>

</html>