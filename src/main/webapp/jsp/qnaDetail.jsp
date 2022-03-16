<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String qboardId = (String)request.getAttribute("qboard_id"); %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
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
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoCompleteCommon.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/diquest/dqHeader.js?ver=18"></script>
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
		
		.btn_basic4:hover{
   			background: #dcdcdc;
   			color: white;
   			transition: all 0.5s;
		}
	</style>
</head>

<body>	
	<%@ include file="header.jsp" %>
		
		<script type="text/javascript">			
		<!-- 배지현, 경민영  : 관리자 답변 표출 function  -->
		$(document).ready(function () {
		      if("<%=userName%>" == "관리자"){
					if ("${qboard_detail.ans_yn}" == 0){
		          		document.getElementById("ans_div").style.display = "none";
		      		}else{
		          		document.getElementById("ans_div").style.display = "none";
		      		}
		      }else{
		    	  	  document.getElementById("ans_div_insert").style.display = "none";
		    	  	  document.getElementById("saveANS").style.display = "none";  //답변등록하기 버튼 hidden
		    	  if ("${qboard_detail.ans_yn}" == 0){
		    		  document.getElementById("ans_div").style.display = "none";
		    		  
		    	  }else{
		    		  document.getElementById("ans_div").style.display = "";
		    	  }  
		      }
		      
		  });
		
		function gomyPage() {
			location.href = "${contextPath}/QBoardList";
		}
		
		function goinsert(){
		
			var title = $('#title').val();
            var context = $('#context').val();

            if (title == "" || context == "") {
                alert("제목과 내용을 작성해주세요.");

            } else if (confirm("답변을 등록하시겠습니까?")) {
                alert("등록되었습니다.");
                return true;
            }
            return false;
		}  

		</script>
			<div id="wrap">
				<div class="lnb_content" style="width: 760px; margin: 0 auto; margin-top: 60px; margin-bottom: 80px;">
					<h3 class="h3_type">문의사항</h3>
					<div class="div_view mgtsl">
						<div class="view_header">
							<p class="title">${qboard_detail.title}</p>
							<p class="day_count">
								<span class="day">${qboard_detail.ins_dt}</span>
							</p>
							<p id="ans_yn" style = "display:none">${qboard_detail.ans_yn}</p>
						</div>
						<div class="view_contents">
							<p>
								${qboard_detail.context}
							</p>
						</div>
					</div>
					<div id = "ans_div">
					<h3 class="h3_type_ans">답변</h3>
					<div class="div_view mgtsl">
						<div class="view_header">
							<p class="title">${qboard_detail.ans_title}</p>
							<p class="day_count">
								<span class="day">${qboard_detail.ans_ins_dt}</span>
							</p>
						</div>
						<div class="view_contents">
							<p>
								${qboard_detail.detail}
							</p>
						</div>
					</div>
				</div>
			<form id="counForm" name="counForm" method="post"
                        action="${action}/hdmall/QBoardAnsInsert" onsubmit="return goinsert()">	
				<div id = "ans_div_insert" class = "ans_div2" style = "border-top: 1px solid #333333; border-bottom: 1px solid #e5e5e5; padding: 25px 20px 28px 20px;">
					<h2 class="h3_type_ans" style ="margin: 0px 0px 14px 0px;">답변</h2>
					<tbody>
                        <tr>
                           <th scope="row">제목<em class="essential">*</em></th>
                            <td><input type="text" class="required" valmsg="제목을 입력해주세요." id="title" name="title" value="" placeholder="제목을 입력해주세요." style="width: 100% ; margin: 11px 0 20px 0px;" maxlength="50" onpaste="false; "></td>
                       		<td><input type= hidden name ="qboard_id"  value="<%=qboardId%>"></td>
                       </tr>
                       <tr>
                          <th scope="row">내용<em class="essential">*</em></th>
                          <td>
                           <div class="textarea_wrap">
                             <textarea placeholder="내용을 입력해주세요." id="context" name="context" maxlength="500" class="required" style = "margin: 12px 0 0 0;height: 150px;"></textarea>
                           </div>
                         </td>
                       </tr>
                    </tbody>
               </div> 
             
              
					<div class="basic_btn_box">
						<button type="button" class="btn_basic4"
							onclick = "gomyPage();">마이페이지로</button>
						<button type ="submit" class = "btn_basic4"
							id ="saveANS">답변등록</button>	
					</div>
				  </form>	
				</div>
			</div>	
				<!-- container END -->
<%@ include file="footer.jsp" %>