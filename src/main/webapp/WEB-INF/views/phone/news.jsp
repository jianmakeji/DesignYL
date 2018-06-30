<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>
	<link href="resources/css/lib/iview.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="resources/js/lib/vue.min.js"></script>
    <script type="text/javascript" src="resources/js/lib/iview.min.js"></script>
</head>

<body>
	<div id="phoneNews">
		<i-button @click="show">Click me!</i-button>
   		<modal v-model="visible" title="Welcome">Welcome to iView</modal>
	</div>
	<script type="text/javascript">
		var phoneNews = new Vue({
			el:"#phoneNews",
			data:function(){
				return{
					visible: false
				}
			},
		       methods: {
		           show: function () {
		               this.visible = true;
		           }
		       }
		})
	</script>
</body>
</html>
