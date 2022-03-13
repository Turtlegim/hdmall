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
            location.href = "${action}/hdmall/jsp/main.jsp";
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
        <!-- container -->
        <main id="container">
            <!-- E : breadcrumb -->
            <!-- S : mypage top -->
            <main id="container">
                <article class="location"></article>
                <article class="top_fullbg">
                    <h2 class="page_tit">MY PAGE</h2>
                    <div class="myhd_firinfo">
                        <div class="myinfo">
                            <p class="name">
                                <strong>
                                    OOO
                                </strong>
                                <em>님</em>
                            </p>
                            <a href="user_manage.jsp" style="text-decoration-line: underline;">회원정보 수정</a>
                        </div>
                        <div class="mypresent">
                            <dl>
                                <a href="https://www.hddfs.com/shop/mm/myBnf/listSvmt.do">
                                    <dt>문의사항</dt>
                                    <dd id="svmtAmt"><strong>0</strong>개</dd>
                                </a>
                            </dl>
                            <dl>
                                <a href="https://www.hddfs.com/shop/mm/myBnf/listSvmt.do">
                                    <dt>찜한 갯수</dt>
                                    <dd id="svmtAmt"><strong>0</strong>개</dd>
                                </a>
                            </dl>
                            <dl>
                            </dl>
                        </div>
                    </div>
    
   				</article>
			</main>
		</main>
   	</div>

    <script type="text/javascript">

        function goUrl(url) {
            location.href = ctx_shop + url;
        }

    </script><!-- E : mypage top -->
    <article id="content">
        <section class="myhd_asis myhd_content">

            <div class="lnb_content">
                <div class="content_wrap">
                    <h3 class="h3_type line">
                        문의내역</h3>
                    <div class="notice_list_wrap">
                        <fieldset>
                            <legend>게시판 검색</legend>
                            <div class="tb_sort_wrap">
                                <p class="sort_tit small">총 <span>244</span> 건</p>
                                <div class="tb_sort">
                                    <form id="searchForm" name="searchForm" method="get" onsubmit=""
                                        action="https://www.hddfs.com/shop/om/consmBbc/listMngBbc.do">
                                        <input type="hidden" id="page" name="page" value="1">
                                        <span class="selw02">
                                            <select name="searchType" id="searchType" class="sel_type"
                                                style="display: none;">
                                                <option value="all">제목 + 내용</option>
                                                <option value="titl">제목</option>
                                                <option value="cont">내용</option>
                                            </select>
                                        </span>
                                        <input type="text" placeholder="검색어를 입력해주세요." id="searchWord" name="searchWord"
                                            value="">
                                        <button type="button" class=" btn_basic2 small"
                                            onclick="javascript:fnSearch();">검색</button>
                                    </form>
                                </div>
                            </div>
                        </fieldset>
                        <div class="tb_list">
                            <table>
                                <caption>포토상품평</caption>
                                <colgroup>
                                    <col style="width:90px">
                                    <col style="width:120px">
                                    <col style="width:auto">
                                    <col style="width:95px">
                                    <col style="width:100px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">번호</th>
                                        <th scope="col">분류</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">등록일</th>
                                        <th scope="col">조회수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>244</td>
                                        <td>이용안내</td>
                                        <td class="tl"><a href="javascript:fnMngBbcDetail('7062');"
                                                class="tover">[공지]개인정보처리방침 일부 개정 안내 </a></td>
                                        <td class="gray">2022-02-08</td>
                                        <td class="gray">375</td>
                                    </tr>
                                    <tr>
                                        <td>243</td>
                                        <td>이용안내</td>
                                        <td class="tl"><a href="javascript:fnMngBbcDetail('7024');" class="tover">캘빈클라인
                                                브랜드 퇴점 안내</a></td>
                                        <td class="gray">2021-12-20</td>
                                        <td class="gray">1,202</td>
                                    </tr>
                                    <tr>
                                        <td>242</td>
                                        <td>이용안내</td>
                                        <td class="tl"><a href="javascript:fnMngBbcDetail('6962');" class="tover">[공지]
                                                H.Point Web 리뉴얼 작업으로 인한 서비스 이용 부분적 제한 안내 </a>
                                        </td>
                                        <td class="gray">2021-12-07</td>
                                        <td class="gray">450</td>
                                    </tr>
                                    <tr>
                                        <td>241</td>
                                        <td>이용안내</td>
                                        <td class="tl"><a href="javascript:fnMngBbcDetail('6922');"
                                                class="tover">겟츠프로그램, 블랑카우/키오스킨, 블랑풀 브랜드 퇴점 안내</a></td>
                                        <td class="gray">2021-12-01</td>
                                        <td class="gray">191</td>
                                    </tr>
                                    <tr>
                                        <td>240</td>
                                        <td>이용안내</td>
                                        <td class="tl"><a href="javascript:fnMngBbcDetail('6863');" class="tover">[공지]
                                                ALIPAY, WECHAT PAY 결제수단 오류 안내</a></td>
                                        <td class="gray">2021-11-09</td>
                                        <td class="gray">700</td>
                                    </tr>
                                    <tr>
                                        <td>239</td>
                                        <td>이용안내</td>
                                        <td class="tl"><a href="javascript:fnMngBbcDetail('6862');" class="tover">보나쥬르
                                                브랜드 퇴점 안내</a></td>
                                        <td class="gray">2021-11-09</td>
                                        <td class="gray">190</td>
                                    </tr>
                                    <tr>
                                        <td>238</td>
                                        <td>이용안내</td>
                                        <td class="tl"><a href="javascript:fnMngBbcDetail('6842');" class="tover">엠브라리오
                                                브랜드 퇴점 안내</a></td>
                                        <td class="gray">2021-10-29</td>
                                        <td class="gray">861</td>
                                    </tr>
                                    <tr>
                                        <td>237</td>
                                        <td>이용안내</td>
                                        <td class="tl"><a href="javascript:fnMngBbcDetail('6802');" class="tover">[공지]
                                                온라인몰 사이트 일시 중단 예정 공지</a></td>
                                        <td class="gray">2021-10-15</td>
                                        <td class="gray">1,096</td>
                                    </tr>
                                    <tr>
                                        <td>236</td>
                                        <td>이용안내</td>
                                        <td class="tl"><a href="javascript:fnMngBbcDetail('6742');"
                                                class="tover">H.Point 구매 적립 변경 안내</a></td>
                                        <td class="gray">2021-09-27</td>
                                        <td class="gray">3,431</td>
                                    </tr>
                                    <tr>
                                        <td>235</td>
                                        <td>이용안내</td>
                                        <td class="tl"><a href="javascript:fnMngBbcDetail('6722');" class="tover">셀라피
                                                브랜드 퇴점 안내</a></td>
                                        <td class="gray">2021-09-17</td>
                                        <td class="gray">321</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="paging">
                            <a href="?page=1" class="active">1</a>
                            <a href="?page=2">2</a>
                            <a href="?page=3">3</a>
                            <a href="?page=4">4</a>
                            <a href="?page=5">5</a>
                            <a href="?page=6">6</a>
                            <a href="?page=7">7</a>
                            <a href="?page=8">8</a>
                            <a href="?page=9">9</a>
                            <a href="?page=10">10</a>
                            <a href="?page=2" title="다음" class="ico_comb next"></a>
                            <a href="?page=25" title="마지막" class="ico_comb nnext"></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </article>

<%@ include file = "footer.jsp"%>