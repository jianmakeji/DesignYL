<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>
<%@ include file="../head.jsp"%>
	<link href="resources/css/lib/iview.css" type="text/css" rel="stylesheet">
	<link href="resources/frontend/css/src/phone/index.css" type="text/css" rel="stylesheet">
	<link href="resources/frontend/css/src/phone/header.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="resources/js/lib/vue.min.js"></script>
    <script type="text/javascript" src="resources/js/lib/iview.min.js"></script>
</head>

<body>
	<%@ include file="phoneHeader.jsp"%>
	<div id="phoneIndex">
		<img :src="topShowImg" style="width:100%;height:auto;">
		<img :src="scheduleImg" style="width:100%;height:auto;">
		<div style="width: 100%; background-color: #f7f7f7">
	        <section style="color: #5c5c5c; font-size: 18pt; padding-top: 20px; margin-left: 30px">NEWS | 新闻动态</section>
	     	<ul class="zyList"  >
	        	<li class="zyItem" v-for="newsItem in newsData">
		          	<a class="zyLink" :href="newsItem.zyItemUrl">
		              	<img class="zyThumb" :src="newsItem.thumb">
		              	<h3 class="zyTitle">{{newsItem.title}}</h3>
		              	<span class="zyDate">{{newsItem.publishTime}}</span>
		          	</a>
		      	</li>
	     	</ul>
	     	<div id="JMTCenter">
				<a id="JMBtn" style="margin-top: 5px;margin-bottom:110px;" href="mobile/news/1">查看更多</a>
			</div>
	   	</div>
	</div>
	<%@ include file="../frontend/footer.jsp"%>
	<script>
		var pageName = "index";
	</script>
	<script type="text/javascript" src="resources/js/lib/jquery-1.10.2.min.js"></script>
	<script src="resources/frontend/js/src/config.js"></script>
	<script type="text/javascript">
		var phoneIndex = new Vue({
			el:"#phoneIndex",
			data:function(){
				return{
					topShowImg:"resources/frontend/images/app/topShow.jpg",
					scheduleImg:"resources/frontend/images/app/schedule.jpg",
					newsData:[]
				}
			},
	       	methods: {
	           	show: function () {
	           	    this.visible = true;
	           	}
	       	},
	       	created:function(){
	       		var that = this;
	       		$.ajax({
		            "dataType":'json',
		            "type":"post",
		            "url":"news/findManageNewsByPage",
		            "data":{offset:0,limit:3},
		            "success": function (response) {
		            	that.newsData = response.aaData;
		            	for(var i = 0;i<that.newsData.length;i++){
		            		that.newsData[i].zyItemUrl = "mobile/newsDetail/" + that.newsData[i].id;
		            	}
		            }
		        })
	       	}
		})
	</script>
</body>
</html>
