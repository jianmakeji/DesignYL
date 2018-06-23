<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="../head.jsp"%>

<link href="resources/frontend/css/lib/kkpager_blue.css" type="text/css" rel="stylesheet">
<link href="resources/frontend/css/src/JMCSS/News.css" type="text/css" rel="stylesheet">
<link href="resources/frontend/css/src/JMCSS/Header.css" type="text/css" rel="stylesheet">

<script>
	var totalCount = "${pagingModel.count}";
	var page = "${pagingModel.currentPage}";
</script>
</head>
<body>
	<%@ include file="header.jsp"%>


    <!-- 新闻列表 -->
    <div class="JMNewsList">
      <ul class="JMNewsListUl">   
      	<c:forEach items="${pagingModel.list}" var="item">
			<li class="JMNews1">
				<img src="${item.thumb}" alt="">
				<a class="JMNewsTextBox" href="news/newsDetail/${item.id}" target="_blank">
					<span class="JMNewsText_date">${fn:substring(item.publishTime, 0, 10)}</span>
					<h3 class="JMNewsText_title">${item.title}</h3>
					<p class="JMNewsText_content">${item.newsAbstract}</p>
				</a>
				<hr>
			</li>
		</c:forEach>
      </ul>
    </div> 
	<div id="kkpager"></div>

   	<div class="JMFooter">&copy;</div>
	<script>
		var pageName = "news";
	</script>
	<script src="resources/js/lib/jquery-1.10.2.min.js"></script>
	<script src="resources/frontend/js/src/config.js"></script>
	<script type="text/javascript" src="resources/frontend/js/lib/kkpager.min.js"></script>
	<script src="resources/frontend/js/src/header.js"></script>
	<script>
		$(document).ready(function() {
			var documentHeight = $(document.body).height(),
				 JMNewsListHeight = $(".JMNewsList").height(),
				 JMFooterHeight = $(".JMFooter").height(),
				 kkpagerHeight = $("#kkpager").height(),
				 addHeight = documentHeight - 2*JMFooterHeight - 2*kkpagerHeight,
				 totalHeight = JMNewsListHeight + JMFooterHeight + kkpagerHeight ;
			 if(totalHeight < documentHeight){
				 $(".JMNewsList").css({ "min-height": addHeight +"px" });
			 }			
			var totalPage;
			if(totalCount % 10 > 0){
				totalPage = parseInt(totalCount / 10) + 1;
			}else if(totalCount % 10 == 0){
				totalPage = totalCount / 10;
			}
			var totalRecords = totalCount;
			var pageNo = page;
			//生成分页
			//有些参数是可选的，比如lang，若不传有默认值
			kkpager.generPageHtml({
				pno : pageNo,
				//总页码
				total : totalPage,
				isGoPage : false,
				isShowTotalPage : false,
				isShowCurrPage : false,
				//总数据条数
				totalRecords : totalRecords,
				//链接前部
				hrefFormer : 'news',
				//链接尾部
				hrefLatter : '/',

				getLink : function(n) {
					return this.hrefFormer + this.hrefLatter + this.hrefFormer + this.hrefLatter + n;
				}
			});
		});
	</script>
</body>
</html>