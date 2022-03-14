<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% int count=(int)request.getAttribute("count"); 
%>

<!DOCTYPE html>
<html lang="ko">

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

	<script type="text/javascript"
	    src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
	<script type="text/javascript"
	    src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/sns.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/jquery.cookie.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>
	
	<!-- S: 다이퀘스트 스크립트 추가 -->
	<script type="text/javascript"
	    src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoCompleteCommon.js?ver=18"></script>
	<script type="text/javascript"
	    src="https://cdn.hddfs.com/front/js/KO/diquest/dqHeader.js?ver=18"></script>
	<!-- E: 다이퀘스트 스크립트 추가 -->
	
	<script type="text/javascript"
	    src="https://cdn.hddfs.com/front/js/KO/cloud-zoom.1.0.2.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
	<script type="text/javascript"
	    src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>
	
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
		
		.tb_sort_wrap {
		    margin-top: 15px;
		}
	</style>
</head>

<body>
    <%@ include file="header.jsp" %>
	<script type="text/javascript">
		  $(document).ready(function () {
		      var $tmp = null;
		      $('table tr').mouseover(function () {
		          if ($tmp != null) {
		              $tmp.css("backgroundColor", "#fff");
		          }
		
		          $tmp = $(this);
		          $tmp.css("backgroundColor", "#f5f7fa");
		
		      });
		
		      if ("<%=userId%>" != "admin") {
		          console.log("userId" + <%=userName %>);
		          document.getElementById("chim").style.display = "";
		      } else {
		          document.getElementById("chim").style.display = "none";
		      }
		
		  });

		  function goUrl(url) {
		      location.href = ctx_shop + url;
		  }
	</script>	

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
                              <%=userName%>
                          </strong>
                          <em>님</em>
                      </p>
                      <a href="${action}/hdmall/userManage" style="text-decoration-line: underline;">회원정보 수정</a>
                  </div>
                  <div class="mypresent">
                      <dl>
                          <dt>문의사항</dt>
                          <dd id="svmtAmt"><strong>${count}</strong>개</dd>
                            </a>
                        </dl>
                        <dl id="chim">
                            <a href="${action}/hdmall/like">
                                <dt>찜한 갯수</dt>
                                <dd id="svmtAmt"><strong>${count_like}</strong>개</dd>
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

	<!-- E : mypage top -->
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
	                            <p class="sort_tit small">총 <span>${count_combo}</span> 건</p>
	                          <div class="tb_sort">
	                              <form id="searchForm" name="searchForm" method="get"
	                                  action="${action}/hdmall/QBoardList">
	                                  <input type="hidden" id="page" name="page" value="1">
	                                  <span class="selw02">
	                                      <select name="searchType" id="searchType" class="sel_type"
	                                          style="display: none;">
	                                          <option value="all">젼체</option>
	                                          <option value="title">제목</option>
	                                      </select>
	                                  </span>
	                                  <input type="text" name='searchword' placeholder="검색어를 입력해주세요."
	                                      id="searchWord" value="">
	                                  <button type="submit" class=" btn_basic2 small">검색</button>
	                              </form>
	                          </div>
	                      </div>
	                  </fieldset>
	                  <div class="tb_list">
	                      <table id="mytable">
	                          <colgroup>
	                              <col style="width:90px">
	                              <col style="width:120px">
	                              <col style="width:95px">
	                              <col style="width:100px">
	                          </colgroup>
	                          <thead>
	                              <tr>
	                                  <th scope="col">번호</th>
	                                  <th scope="col">제목</th>
	                                  <th scope="col">등록일</th>
	                                  <th scope="col">답변</th>
	                              </tr>
	                          </thead>
	                          <tbody>
	                              <c:forEach var="qna_Board" items="${qboardList}">
	                                  <tr>
	                                      <td>${qna_Board.getNum()}</td>
	                                      <a href="${action}/hdmall/QBoardDetail?ans_yn=${qna_Board.getAns_yn()}&aboard_id=${qna_Board.getId()}"> 
	                                      <td class="tl">${qna_Board.getTitle()}</td>
	                                      </a>
	                                      <td class="gray">${qna_Board.getIns_dt()}</td>
	                                      <td class="gray" id="ansyn_chk">${qna_Board.getAns_yn()}
	                                      </td>
	                                  </tr>
	                              </c:forEach>
	                            </tbody>
	                        </table>
	
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	</article>

<%@ include file="footer.jsp" %>