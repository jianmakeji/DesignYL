<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="JMHeader">

	<div class="JMLogo">
		<a href=""><img alt="" src="/DesignYL/resources/frontend/images/app/Logo.png"></a>
	</div>
	<div class="JMTopNav">
		<ul class="JMMenu">			
			<li class="JMItem"><a class="JMLink" href="/DesignYL/mobile/index" data-page-name="index"><spring:message code="home"/></a></li>
			<li class="JMItem"><a class="JMLink" href="/DesignYL/mobile/news/1" data-page-name="news"><spring:message code="news"/></a></li>
			<li class="JMItem"><a class="JMLink" href="/DesignYL/mobile/rule" data-page-name="rule"><spring:message code="regulations"/></a></li>
		</ul>
	</div>
</div>

