<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../head.jsp"%>
<link href="resources/frontend/css/src/JMCSS/Rules.css" type="text/css" rel="stylesheet">
<link href="resources/frontend/css/src/JMCSS/Header.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="JMRule">
		<ul class="JMRuleTip" id="JMRuleTip">

			<li class="JMItem"><a class="JMLink JMActive" data-href="#JMSection1"><img src="resources/frontend/images/JMImages/sloganSmallImg.png"><spring:message code="contest_intro"/></a></li>
			<li class="JMItem"><a class="JMLink" data-href="#JMSection2"><img src="resources/frontend/images/JMImages/sloganSmallImg.png"><spring:message code="contest_objective"/></a></li>
			<li class="JMItem"><a class="JMLink" data-href="#JMSection3"><img src="resources/frontend/images/JMImages/sloganSmallImg.png"><spring:message code="organizer"/></a></li>
			<li class="JMItem"><a class="JMLink" data-href="#JMSection4"><img src="resources/frontend/images/JMImages/sloganSmallImg.png"><spring:message code="competition_process"/></a></li>
			<li class="JMItem"><a class="JMLink" data-href="#JMSection5"><img src="resources/frontend/images/JMImages/sloganSmallImg.png"><spring:message code="works_collection"/></a></li>
			<li class="JMItem"><a class="JMLink" data-href="#JMSection6"><img src="resources/frontend/images/JMImages/sloganSmallImg.png"><spring:message code="awards"/></a></li>
			<li class="JMItem"><a class="JMLink" data-href="#JMSection7"><img src="resources/frontend/images/JMImages/sloganSmallImg.png"><spring:message code="commitment"/></a></li>
		</ul>

		<div class="JMRuleDetail">
			<div class="JMSection" id="JMSection1">
				<div class="JMTitle">
					<span class="JMNum">01</span> <span class="JMText"><spring:message code="contest_intro"/></span>
				</div>
				<div class="JMContent">
					<p class="JMText"><spring:message code="contest_intro_content1"/></p>
				</div>
			</div>
			<hr />

			<div class="JMSection JMBGF4F4F4" id="JMSection2">
				<div class="JMTitle">
					<span class="JMNum">02</span> <span class="JMText"><spring:message code="contest_objective"/></span>
				</div>
				<div class="JMContent">
					<p class="JMText"><spring:message code="contest_objective_content1"/></p>
				</div>
			</div>
			<hr />
			<div class="JMSection" id="JMSection3">
				<div class="JMTitle">
					<span class="JMNum">03</span> <span class="JMText"><spring:message code="organizer"/></span>
				</div>
				<div class="JMContent">
					<div class="JMSubTitle"><spring:message code="organizer_subtitle1"/></div>
					<p class="JMText"><spring:message code="organizer_content1"/></p>
					<div class="JMSubTitle"><spring:message code="organizer_subtitle2"/></div>
					<p class="JMText"><spring:message code="organizer_content2"/></p>
					<div class="JMSubTitle"><spring:message code="organizer_subtitle3"/></div>
					<p class="JMText"><spring:message code="organizer_content3"/></p>
				</div>
			</div>
			<hr />

			<div class="JMSection JMBGF4F4F4" id="JMSection4">
				<div class="JMTitle">
					<span class="JMNum">04</span> <span class="JMText"><spring:message code="competition_process"/></span>
				</div>
				<div class="JMContent">
					<div class="JMSubTitle"><spring:message code="competition_process_subtitle1"/></div>
					<p class="JMText"><spring:message code="competition_process_content1"/></p>
					<div class="JMSubTitle"><spring:message code="competition_process_subtitle2"/></div>
					<p class="JMText"><spring:message code="competition_process_content2"/></p>
					<div class="JMSubTitle"><spring:message code="competition_process_subtitle3"/></div>
					<p class="JMText"><spring:message code="competition_process_content3"/></p>
					<div class="JMSubTitle"><spring:message code="competition_process_subtitle4"/></div>
					<p class="JMText"><spring:message code="competition_process_content4"/></p>
				</div>
			</div>
			<hr />

			<div class="JMSection" id="JMSection5">
				<div class="JMTitle">
					<span class="JMNum">05</span> <span class="JMText"><spring:message code="works_collection"/></span>
				</div>
				<div class="JMContent">
					<div class="JMSubTitle"><spring:message code="works_collection_subtitle1"/></div>
					<p class="JMText"><spring:message code="works_collection_content1_text1"/></p>
					<p class="JMText"><spring:message code="works_collection_content1_text2"/></p>
					<p class="JMText"><spring:message code="works_collection_content1_text3"/></p>
					<div class="JMSubTitle"><spring:message code="works_collection_subtitle2"/></div>
					<p class="JMText"><spring:message code="works_collection_content2_text1"/></p>
					<p class="JMText"><spring:message code="works_collection_content2_text2"/></p>
					<p class="JMText"><spring:message code="works_collection_content2_text3"/></p>
					<div class="JMSubTitle"><spring:message code="works_collection_subtitle3"/></div>
					<p class="JMText"><spring:message code="works_collection_content3_text1"/></p>
					<div class="JMSubTitle"><spring:message code="works_collection_subtitle4"/></div>
					<p class="JMText"><spring:message code="works_collection_content4_text1"/></p>
				</div>
			</div>
			<hr />

			<div class="JMSection JMBGF4F4F4" id="JMSection6">
				<div class="JMTitle">
					<span class="JMNum">06</span> <span class="JMText"><spring:message code="awards"/></span>
				</div>
				<img src="resources/frontend/images/JMImages/index7.png" alt="">
			</div>
			<hr />

			<div class="JMSection" id="JMSection7">
				<div class="JMTitle">
					<span class="JMNum">07</span> <span class="JMText"><spring:message code="commitment"/></span>
				</div>
				<div class="JMContent">
					<p class="JMText"><spring:message code="commitment_content"/></p>
					<div class="JMSubTitle"><spring:message code="commitment_subtitle1"/></div>
					<p class="JMText"><spring:message code="commitment_content1_text1"/></p>
					<div class="JMSubTitle"><spring:message code="commitment_subtitle2"/></div>
					<p class="JMText">
						<spring:message code="commitment_content2_text1"/><br />
						<spring:message code="commitment_content2_text2"/><br />
						<spring:message code="commitment_content2_text3"/><br />
						<spring:message code="commitment_content2_text4"/><br />
					</p>
					<div class="JMSubTitle"><spring:message code="commitment_subtitle3"/></div>
					<p class="JMText">
						<spring:message code="commitment_content3_text1"/><br />
						<spring:message code="commitment_content3_text2"/><br />
					</p>
					<div class="JMSubTitle"><spring:message code="commitment_subtitle4"/></div>
					<p class="JMText">
						<spring:message code="commitment_content4_text1"/><br />
						<spring:message code="commitment_content4_text2"/><br />
						<spring:message code="commitment_content4_text3"/><br />
						<spring:message code="commitment_content4_text4"/><br />
						<spring:message code="commitment_content4_text5"/><br />
						<spring:message code="commitment_content4_text6"/><br />
						<spring:message code="commitment_content4_text7"/><br />
						<spring:message code="commitment_content4_text8"/><br />
						<spring:message code="commitment_content4_text9"/><br />
					</p>
				</div>
			</div>
			<hr />
		</div>
	</div>
	<div class="JMFooter">&copy;<spring:message code="JMFooter"/></div>
	<script>
		var pageName = "rule";
	</script>
	<script src="resources/js/lib/jquery-1.10.2.min.js"></script>
	<script src="resources/frontend/js/src/config.js"></script>
	<script src="resources/frontend/js/src/header.js"></script>
	<script>
		$(document).ready(
				function() {
					var timer, scrollTops = [];
					function findIndex(list, value) {
						var flag = 0;
						for (var i = list.length - 1; i > 0; i--) {
							if (value >= list[i]) {
								flag = i;
								break;
							}
						}

						return flag;
					}
					$("#JMRuleTip .JMItem").click(
							function() {
								var targetId = $(this).find(".JMLink").data(
										"href");
								$(".JMRuleTip .JMItem .JMActive").removeClass(
										"JMActive");
								$(this).find(".JMLink").addClass("JMActive");
								$('html,body').animate({
									scrollTop : $(targetId).offset().top + 10
								}, 500);
							});

					$(".JMSection").each(function(index, el) {
						scrollTops.push($(this).offset().top);
					});

					$(window).scroll(
							function() {
								if (timer) {
									clearTimeout(timer);
								}
								timer = setTimeout(function() {
									var index = findIndex(scrollTops,
											window.scrollY);

									$("#JMRuleTip .JMActive").removeClass(
											"JMActive");
									$("#JMRuleTip .JMLink:eq(" + index + ")")
											.addClass("JMActive");
								}, 100);
							});
				});
	</script>
</body>
</html>
