<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String userId = (String)session.getAttribute("userId");
	String userName = (String)session.getAttribute("userName");
%>

 <header id="header">
		<section class="box">
			<a href="javascript:" class="btn_gnb">Navigation Drawer</a>
			<h1 onclick="goMainPage();" style="cursor: pointer; height: 48px"><img id="mainLogo" src="${action}/hdmall/image/logo.png">
			</h1> <!-- 로고 이미지 src 변경 부분 -->

			<div class="default_menu">
			<%if (userName != null) { %>
				<a> <%=userName%>님 </a>
				<a href="${action}/hdmall/logout" id="logoutBtn">로그아웃</a>
			<%}else { %> 
				<a href="${action}/hdmall/login" id="loginBtn">로그인</a>
			<%} %>
				<ul>
                <li class="item_01">
                    <a href="${contextPath}/like">찜하기</a>
                </li>
                <li class="item_03">
                    <a href="${contextPath}/QBoardList">마이현대</a>
                </li>
                <li class="item_04">
                    <a href="${contextPath}/QBoardIns">고객센터</a>
                </li>
            </ul>
        </div>

		<!-- 히든메뉴 START -->
		<script type="text/javascript">
			function goMainPage() {
				sessionStorage.setItem("selMainSwiperPos", 1);
				location.href = "${action}/hdmall/jsp/main.jsp";
			}
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
					<li><strong>전체서비스</strong>
						<ul class="depth_02 serviceMenu">
							<li><a href="${contextPath}/best"> 베스트</a></li>
							<li><a href="${contextPath}/productList?cate_no=신상품"> 신상품</a></li>
							<li><a href="${contextPath}/QBoardIns"> 고객센터</a></li>
						</ul></li>
					<li><strong>카테고리</strong>
						<ul class="depth_02 serviceCtgList">
							<li><a href="${contextPath}/productList?cate_no=여성캐쥬얼">
									여성캐쥬얼</a></li>
							<li><a href="${contextPath}/productList?cate_no=남성캐쥬얼">
									남성캐쥬얼</a></li>
						</ul></li>
				</ul>
			</div>
			<button class="gnb_close">닫기</button>
		</nav>
		</section>
</header>
<!-- 히든메뉴 END 03.05 경민영 -->