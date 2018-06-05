<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="JMHeader">

	<div class="JMLogo">
		<a href=""><img alt="" src="resources/frontend/images/JMImages/indexLogo.png"></a>
	</div>
	<div class="JMNoticeBoard">
		<div class="JMNoticeBoardLeft">
			<a href="user/register"><spring:message code="sign_up"/></a>
		</div>
		<div class="JMNoticeBoardRight">
			<div class="JMItem">
				<span id="countDown" class="countDown"></span><spring:message code="end_day"/>
			</div>
		</div>

	</div>
	<div class="JMTopNav">
		<ul class="JMMenu">
			<li class="JMItem"><a class="JMLink" href="index" data-page-name="index"><spring:message code="home"/></a></li>
			<li class="JMItem"><a class="JMLink" href="news/news/1" data-page-name="news"><spring:message code="news"/></a></li>
			<li class="JMItem"><a class="JMLink" href="rule/rules" data-page-name="rule"><spring:message code="regulations"/></a></li>
			<li class="JMItem"><a class="JMLink" href="judge/judge" data-page-name="judge"><spring:message code="jury"/></a></li>
		</ul>

		<ul class="JMUserMenu">
			<c:if test="${!empty sessionScope.userId}">
				<li class="JMItem"><a href="production/works" class="JMLink JM20C7BE">[ ${sessionScope.realname} ]</a></li>
				<li class="JMItem"><a class="JMLink" href="logout"><spring:message code="logout"/><fmt:message key="logout"/></a></li>
			</c:if>
			<c:if test="${empty sessionScope.userId}">
				<li class="JMItem"><a class="JMLink JMIconUser" href="login"> </a></li>
			</c:if>
		</ul>

	</div>
</div>

