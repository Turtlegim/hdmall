<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- 김기범 : productBest.jsp -->
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>현대픽픽스토어</title>
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
	<link rel="icon" type="image/png" sizes="96x96" href="${action}/hdmall/image/favicon-96x96.png">
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
	<link rel="stylesheet" href="${action}/hdmall/css/footer.css">
    <link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">
	
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
			location.href = "${action}/hdmall/main.do";
		}
	</script>

	<%@ include file="header.jsp" %>  
	<div id="wrap">
		<!-- container -->
		<main id="container">
			<article class="location">
				<section class="box">
					<a class="home">홈</a>
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
								    <a href="${contextPath }/best">전체</a>
							    </li>
								<li class="tab_item" id="female">
								    <a href="${contextPath }/best?cate_no=여성캐쥬얼">여성캐쥬얼</a>
								</li>
								<li class="tab_item" id="male">
								    <a href="${contextPath }/best?cate_no=남성캐쥬얼">남성캐쥬얼</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="prd_list_new">
						<div class="special_content lank_top">
							<div class="product_list best_three" style="height: 540px">
								<ul style="height: 440px">
									<c:forEach var="vo" items="${best}" begin="0" end="2" varStatus="status"> <%-- controller로부터 받아온 best 리스트 상위 3개 출력 --%>
										<li style="height: 420px">
											<a href="${contextPath }/productdetail?prod_id=${vo.getId()}">
												<i class="tnr_font "><em><c:out value="${status.count}" />.</em></i>
												<div class="img_w">
													<img data-src=<c:out value="./image/product/${vo.getImg() }"/>
														src=<c:out value="./image/product/${vo.getImg() }"/>
														alt=<c:out value="${vo.getContext() }"/>
														onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=252x252';"
														class="lazy">
												</div>
												<div class="pro_i">
													<p class="ti_brand">${vo.getName() }</p>
													<p class="tx_ex goosNm">${vo.getContext() }</p>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="bstpro_num">
							<div class="product_list">
								<ul>
									<c:forEach var="vo" items="${best}" begin="3" end="6" varStatus="status"> <%-- controller로부터 받아온 best 리스트 상위 3~7번째 출력 --%>
										<li class="product_item">
											<a href="${contextPath }/productdetail?prod_id=${vo.getId() }">
												<i class="tnr_font "><em><c:out value="${status.index + 1}" />.</em></i>
												<div class="img_w">
													<img data-src=<c:out value="./image/product/${vo.getImg() }"/>
														src=<c:out value="./image/product/${vo.getImg() }"/>
														alt=<c:out value="${vo.getContext() }"/>
														onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=252x252';"
														class="lazy">
												</div>
												<div class="pro_i">
													<p class="ti_brand">${vo.getName() }</p>
													<p class="tx_ex goosNm">${vo.getContext() }</p>
													<div class="por_icons"></div>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</section>
			</article>
		</main>
	</div>
	    <script type="text/javascript">
        function sellerInfo() {
            $("#seller_information").dialog("open");
        }
        // 햄버거 자동으로 내려주는 펑션
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
 <%@ include file="footer.jsp" %>  