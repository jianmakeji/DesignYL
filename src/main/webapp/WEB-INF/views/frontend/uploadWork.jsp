<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../head.jsp"%>

<link href="resources/css/lib/jquery.toastmessage.css" type="text/css" rel="stylesheet">
<link href="resources/frontend/css/src/main.css" type="text/css" rel="stylesheet">
<style type="text/css">

</style>
<script>
	var id = "${production.id}";
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="pageMenu.jsp"%>

	<div class="zyTwoSide zyMargin60" id="zyInfoPanel">
		<div class="zyCLeft zyTipPanel">
			<h2 class="zyTitle"><spring:message code="uploading"/></h2>
			<div id="zyStep1Tip" class="zyStepTip">
				<p class="zyText"><spring:message code="write_contestant_info"/></p>
				<p class="zyText"><spring:message code="personnel_restrictions"/><span>2-5</span>人</p>
			</div>
			<div id="zyStep2Tip" class="zyStepTip zyHidden">
				<h5 class="zySubTitle"><spring:message code="upload_requirements"/></h5>
				<p class="zyText">
					<spring:message code="upload_requirements_content1"/><font class="zyFF0000">A1</font>（841mm×1189mm）<spring:message code="upload_requirements_content2"/><font class="zyFF0000"><spring:message code="upload_requirements_content3"/></font><spring:message code="upload_requirements_content4"/><font class="zyFF0000"><spring:message code="upload_requirements_content5"/>5M</font>,<spring:message code="upload_requirements_content6"/><br> <br><spring:message code="upload_requirements_content7"/><br>
					<br><spring:message code="upload_requirements_content8"/>
				</p>
			</div>
		</div>

		<div class="zyCRight zyHandlerPanel">
			<div class="zyStep" id="zyStep">
				<div class="zyStepItem zyActive" data-target="#zyStep1"><spring:message code="contestant_info"/></div>
				>
				<div class="zyStepItem" data-target="#zyStep2"><spring:message code="production_info"/></div>
				>
				<div class="zyStepItem" data-target="#zyPreview"><spring:message code="preview_submission"/></div>
			</div>
			<div class="zyStepPanel" id="zyStep1">
				<div class="zyForm">
					<div class="zyFormRow" id="zySelectPersonType">
						<input type="radio" name="participantType" value="1" checked="checked" data-target="#zyPersonalInfo"><label><spring:message code="personal"/></label> <input type="radio"
							name="participantType" value="2" data-target="#zyTeamInfo" style="margin-left: 60px"><label><spring:message code="group"/></label> <input type="radio" name="participantType" value="3"
							data-target="#zyCompanyInfo" style="margin-left: 60px"><label><spring:message code="company"/></label>
					</div>
					<div id="zyPersonalInfo" class="zyPersonInfoPanel">
						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="name"/></label>
							<div class="zyFormControl">
								<input type="text" name="participantName" class="zyInput zyActionRequired">
							</div>
							<span class="zyRequired">*</span>
						</div>

						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="ID_number"/></label>
							<div class="zyFormControl">
								<input id="identityPersonal" type="text" name="participantIdNumber" class="zyInput zyActionRequired">
							</div>
							<span class="zyRequired">*</span>
						</div>

						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="subordinate_units"/></label>
							<div class="zyFormControl">
								<input type="text" name="affiliatedUnit" class="zyInput">
							</div>
						</div>

						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="introduction"/></label>
							<div class="zyFormControl">
								<textarea name="participantBrief" class="zyInput zyTextarea zyActionRequired"></textarea>
							</div>
							<span class="zyRequired">*</span>
						</div>
					</div>
					<div id="zyTeamInfo" class="zyPersonInfoPanel zyHidden">
						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="captain_name"/></label>
							<div class="zyFormControl">
								<input type="text" name="participantName" class="zyInput zyActionRequired">
							</div>
							<span class="zyRequired">*</span>
						</div>

						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="captain_ID_number"/></label>
							<div class="zyFormControl">
								<input id="identityCaptain" type="text" name="participantIdNumber" class="zyInput zyActionRequired">
							</div>
							<span class="zyRequired">*</span>
						</div>

						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="captain_subordinate_units"/></label>
							<div class="zyFormControl">
								<input type="text" name="affiliatedUnit" class="zyInput">
							</div>
						</div>

						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="member"/></label>
							<div class="zyFormControl">
								<textarea name="teamMember" class="zyInput zyTextarea zyActionRequired" placeholder="中文逗号隔开"></textarea>
							</div>
							<span class="zyRequired">*</span>
						</div>

						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="introduction"/></label>
							<div class="zyFormControl">
								<textarea name="participantBrief" class="zyInput zyTextarea zyActionRequired"></textarea>
							</div>
							<span class="zyRequired">*</span>
						</div>
					</div>

					<div id="zyCompanyInfo" class="zyPersonInfoPanel zyHidden">
						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="company_name"/></label>
							<div class="zyFormControl">
								<input type="text" name="participantName" class="zyInput zyActionRequired">
							</div>
							<span class="zyRequired">*</span>
						</div>

						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="business_license"/></label>
							<div class="zyFormControl">
								<input id="BusinessLicense" type="text" name="participantIdNumber" class="zyInput zyActionRequired">
							</div>
							<span class="zyRequired">*</span>
						</div>

						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="introduction"/></label>
							<div class="zyFormControl">
								<textarea name="participantBrief" class="zyInput zyTextarea zyActionRequired"></textarea>
							</div>
							<span class="zyRequired">*</span>
						</div>
					</div>

				</div>

				<button id="zystep" class="zyBtn zyActionNavBtn" data-target="#zyStep2"><spring:message code="next_step"/></button>
			</div>

			<div class="zyStepPanel zyHidden" id="zyStep2">
				<div class="zyForm">
					
					<div id="zyProductInfo" class="zyWorkInfoPanel">
						
						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="title"/></label>
							<div class="zyFormControl">
								<input type="text" name="title" class="zyInput zyActionRequired">
							</div>
							<span class="zyRequired">*</span>
						</div>

						<div class="zyFormRow">
							<label class="zyFormLabel"><spring:message code="introduction"/></label>
							<div class="zyFormControl">
								<textarea name="content" class="zyInput zyTextarea zyActionRequired"></textarea>
							</div>
							<span class="zyRequired">*</span>
						</div>
						
						
						<!-- 口号作品	或者		图幅作品	-->
						<div class="zyFormRow zyHidden" id="zySelectProductType">
							<input type="radio" class="zyProductImgInfoRadio" name="SelectProductType" value="1" checked="checked" data-target="#zyProductImgInfo"><label>图幅作品<spring:message code="confirm_password"/></label> 
							<input type="radio" class="zyProductsloganInfoRadio"	name="SelectProductType" value="3" data-target="#zyProductSloganInfo" style="margin-left: 60px"><label>口号作品<spring:message code="confirm_password"/></label> 
						</div>
						<!-- 口号作品	或者		图幅作品 -->
						
						<div id="zyProductImgInfo" class="zyProductInfoPanel">
							<div class="zyFormRow">
								<label class="zyFormLabel">H5<spring:message code="Website"/></label>
								<div class="zyFormControl">
									<input type="text" name="h5Address" class="zyInput">
								</div>
							</div>
							
							<div class="zyFormRow">
								<label class="zyFormLabel"><spring:message code="video_shareAddress "/></label>
								<div class="zyFormControl">
									<textarea id="videoAddress" name="videoAddress" class="zyInput zyTextarea"></textarea>
								</div>
							</div>
							
							<div class="zyFormRow">
								<label class="zyFormLabel">图幅</label>
								<div class="zyFormControl zyUploadControl" id="uploadImageContainer1">
									<img id="uploadBg" class="zyActionOtherImage" style="width: 300px;height:430px" src="resources/frontend/images/app/defaultImage.jpg" /> 
									<div id="uploadBgInfo" style="width:300px">
										<div id="ossBgfile">
											<div><b id="bgFileDescribe"><span id="bgFileCompletePersent"></span></b>
												<div  id="ossBgProgress"  class="progress">
													<div class="determinate" style="width: 1%"></div>
												</div>
											</div>
										</div>
										<pre id="bgConsole"></pre>
										<p>&nbsp;</p>
									</div>
								</div>
								<span class="zyRequired">*</span>
							</div>
						</div>
						<div id="zyProductSloganInfo" class="zyProductInfoPanel zyHidden">
							<div class="zyFormRow">
								<label class="zyFormLabel">口号</label>
								<div class="zyFormControl">
									<input id="slogan" type="text" name="slogan" placeholder="仅限16个字符" class="zyInput">
								</div>
								<span class="zyRequired">*</span>
							</div>
						</div>
						
					</div>

					<button class="zyBtn zyActionNavBtn" data-target="#zyStep1"><spring:message code="previous_step"/></button>
					<button class="zyBtn zyActionNavBtn" data-target="#zyPreview"><spring:message code="next_step"/></button>
				</div>
			</div>
		</div>
	</div>

	<div class="zyStepPanel zyHidden zyMargin60" id="zyPreview">
		<div class="zyStep zyTCenter">
			<div class="zyStepItem" data-target="#zyStep1"><spring:message code="contestant_info"/></div>
			>
			<div class="zyStepItem" data-target="#zyStep2"><spring:message code="production_info"/></div>
			>
			<div class="zyStepItem  zyActive" data-target="#zyPreview"><spring:message code="preview_submission"/></div>
		</div>

		<div class="zyWorkDetail" id="zyPreviewContent"></div>

		<script type="text/template" id="zyPreviewTpl">
            <h3 class="zyTitle">标题：$ZY{title}</h3>
            <h3 class="zyAuthor">作者：$ZY{participantName}</h3>
            <p class="zyText">简介：$ZY{content}</p>
			{@if slogan}
               <div class="slogan">口号:&nbsp;&nbsp;$ZY{slogan}</div>
            {@/if}

            {@if h5Address}
               <div class="zy20C7BE">H5网页链接:&nbsp;&nbsp;<a class="zy20C7BE" href="$ZY{h5Address}" target="_blank">H5演示地址<spring:message code="confirm_password"/></a></div>
            {@/if}

            {@if videoAddress}
               <div id="videoContainer" style="text-align:center"></div>
            {@/if}

            {@if pimage}
                <img id="imgProduct" src="$ZY{pimage}" style="margin:10px auto;">
            {@/if}
        </script>

		<div class="zyTCenter" style="margin-top: 50px;">
			<button class="zyBtn zyActionNavBtn" data-target="#zyStep2"><spring:message code="previous_step"/></button>
			<button class="zyBtn" id="zySubmitData"><spring:message code="submit"/></button>
		</div>
	</div><br><br><br><br>

    <div class="zyFooter">&copy;<spring:message code="JMFooter"/></div>
	<%@ include file="loading.jsp"%>
	
	<script>
		var pageName = "uploadWork";
	</script>

	<script src="resources/js/lib/jquery-1.10.2.min.js"></script>
	<script src="resources/js/lib/jquery.toastmessage.js"></script>
	<script src="resources/js/lib/plupload.full.min.js"></script>
	<script src="resources/js/lib/juicer-min.js"></script>
	<script src="resources/frontend/js/src/config.js"></script>
	<script src="resources/js/src/functions.js"></script>
	<script src="resources/js/src/ZYFormHandler.js"></script>
	<script src="resources/js/src/ZYCOUHandler.js"></script>
	<script src="resources/frontend/js/src/ossupload.js"></script>
	<script src="resources/frontend/js/src/uploadWork.js"></script>
	<script src="resources/frontend/js/src/header.js"></script>
</body>
</html>