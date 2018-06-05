<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>
<%@ include file="../head.jsp"%>
<link href="resources/frontend/css/lib/kkpager_blue.css" type="text/css" rel="stylesheet">
<link href="resources/css/lib/jquery.toastmessage.css" type="text/css" rel="stylesheet">
<link href="resources/frontend/css/src/JMCSS/Home.css" type="text/css" rel="stylesheet">
<link href="resources/frontend/css/src/JMCSS/Header.css" type="text/css" rel="stylesheet">
</head>

<body>

	<%@ include file="header.jsp"%>
	<div class="JMHome">
		<div id="JMItem">
			<img src="resources/frontend/images/JMImages/index1.jpeg">

			<div class="ChangshaDiv">CHANG SHA</div>
			<div id="JMInfo">
				<span id="JMTitle_1">长沙-媒体艺术之都</span><br> <span id="JMTitle_2">视觉形象设计大赛</span>
			</div>

			<div class="JMYellowDiv"></div>
		</div>

		<!-- 大赛目标 -->
		<div class="JMdasaimubiao">
			<!-- 灰色背景 -->
	        <div class="JMgrayBG"></div>
			<div class="JMDasaiBox1">
	            <h1 class="JMTitle"><spring:message code="contest_target"/></h1>
	            <p class="JMDasaiBox1Content1"><spring:message code="contest_target_box1_Content1"/></p>
	            <p class="JMDasaiBox1Content2"><spring:message code="contest_target_box1_Content2"/></p>
	            <p class="JMDasaiBox1Content3"><spring:message code="contest_target_box1_Content3"/></p>
	        </div>
			<!-- 蓝色框 -->
			<div class="JMDasaiPhoto1">
				<img class="JMBlueImg" src="resources/frontend/images/JMImages/index2.jpeg" />
			</div>

			<div class="JMDasaiBox2">
				<div class="JMDasaiBox2Div1">
					<img class="JMDasaiBox2Div1_photo1" src="resources/frontend/images/JMImages/index4.jpeg">
					<p class="JMDasaiBox2Content1"><spring:message code="contest_target_box2_Content1"/></p>
				</div>
				<div class="JMDasaiBox2Div2">
					<img class="JMDasaiBox2Div2_photo2" src="resources/frontend/images/JMImages/index5.jpeg">
					<p class="JMDasaiBox2Content2"><spring:message code="contest_target_box2_Content2"/></p>
				</div>
				<img class="JMDasaiBox2Div2_photo3" src="resources/frontend/images/JMImages/index3.jpeg">
			</div>
		</div>

		<img class="JMRaceProcess" src="resources/frontend/images/JMImages/indexProcess.png" />

		<div class="JMNewsInformation">
			<section>NEWS | 新闻动态</section>
			<div class="">
				<ul id="JMList">
					
					<c:forEach items="${newsList}" var="item">
						<li class="JMItem"><a class="JMLink" href="news/newsDetail/${item.id}" target="_blank"> <img class="JMThumb" src="${item.thumb}">
								<h3 class="JMTitle">${item.title}</h3> <span class="JMDate">${fn:substring(item.publishTime, 0, 10)}</span>
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="JMTCenter">
			<a id="JMBtn" style="margin: 20px auto;" href="news/news/1"><spring:message code="JMmore"/> >></a>
		</div>
	</div>
	<img src="resources/frontend/images/JMImages/index8.png" />

	<div class="JMFooter">&copy;<spring:message code="JMFooter"/></div>

	<script>
		var pageName = "index";
	</script>
	<script src="resources/js/lib/jquery-1.10.2.min.js"></script>
	<script src="resources/frontend/js/lib/kkpager.min.js"></script>
	<script src="resources/js/lib/jquery.toastmessage.js"></script>
	<script src="resources/js/lib/juicer-min.js"></script>
	<script src="resources/frontend/js/src/config.js"></script>
	<script src="resources/js/src/functions.js"></script>
	<script src="resources/frontend/js/src/header.js"></script>

</body>
</html>
