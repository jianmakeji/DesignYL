<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<link href="resources/frontend/css/lib/kkpager_blue.css" type="text/css" rel="stylesheet">
<link href="resources/css/lib/jquery.toastmessage.css" type="text/css" rel="stylesheet">
<link href="resources/frontend/css/src/main.css" type="text/css" rel="stylesheet">
<link href="resources/frontend/css/src/JMCSS/Header.css" type="text/css" rel="stylesheet">
<script>
	var userId = "${sessionScope.userId}";
</script>
</head>
<body style="max-width:none;">

	<%@ include file="header.jsp"%>
	<%@ include file="pageMenu.jsp"%>

	<div class="zyMargin60">
		<table class="zyTable" id="myTable">
			<thead>
				<tr style="background: #47a8a9;color: white;">
					<th><spring:message code="title"/></th>
					<th><spring:message code="introduction"/></th>
					<th><spring:message code="state"/></th>
					<th><spring:message code="operation"/></th>
				</tr>
			</thead>
			<tbody style="color: #212121;">
				
			</tbody>
		</table>
	</div>

	<div id="kkpager"></div>


    <%@ include file="footer.jsp"%>
    
	<%@ include file="loading.jsp"%>

	<script type="text/template" id="zyTrTpl">
        {@each items as i}
        <tr>
            <td>$ZY{i.title}</td>
            <td>$ZY{i.content}</td>
            <td>$ZY{i.status}</td>
            <td>
                <a href="production/workDetail/$ZY{i.id}" class="zyAction zyIconCheck" target="_blank"><spring:message code="check"/></a>&nbsp;
                {@if i.canEdit}
                    <a href="production/uploadWork/$ZY{i.id}"  class="zyAction zyIconEdit"><spring:message code="modify"/></a>&nbsp;
                    <a href="$ZY{i.id}"  class="zyAction zyIconRemove"><spring:message code="delete"/></a>
                {@/if}
            </td>
        </tr>
        {@/each}
        </script>


	<script>
		var pageName = "works";
	</script>

	<script src="resources/js/lib/jquery-1.10.2.min.js"></script>
	<script src="resources/frontend/js/lib/kkpager.min.js"></script>
	<script src="resources/js/lib/jquery.toastmessage.js"></script>
	<script src="resources/js/lib/juicer-min.js"></script>
	<script src="resources/frontend/js/src/config.js"></script>
	<script src="resources/js/src/functions.js"></script>
	<script src="resources/frontend/js/src/works.js"></script>
	<script src="resources/frontend/js/src/header.js"></script>
</body>
</html>