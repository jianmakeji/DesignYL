var attachUrl = ""; 
var uploadWork = (function (config, functions) {
    return {
        
        initData: function (id) {
            ZYCOUHandler.getDataDetail(config.ajaxUrls.workDetail.replace(":id", id), {id: id}, function (data) {
                var personInfoPanel, workInfoPanel, targetPanel, targetPanel2;
                $("#zySelectPersonType input[value='" + data.participantType + "']").prop("checked", true);
                targetPanel = $("#zySelectPersonType input:checked").data("target");
                $(".zyPersonInfoPanel").addClass("zyHidden");
                $(targetPanel).removeClass("zyHidden");
                personInfoPanel = $(".zyPersonInfoPanel").not(".zyHidden");
                personInfoPanel.find('input[name="participantName"]').val(data.participantName);
                personInfoPanel.find('input[name="participantIdNumber"]').val(data.participantIdNumber);
                personInfoPanel.find('textarea[name="participantBrief"]').val(data.participantBrief);
                personInfoPanel.find('textarea[name="teamMember"]').val(data.teamMember);
                personInfoPanel.find("input[name='affiliatedUnit']").val(data.affiliatedUnit);
                
                workInfoPanel = $(".zyWorkInfoPanel");
                if(data.fileType == 1){
                    workInfoPanel.find("input[name='title']").val(data.title);
                    workInfoPanel.find("input[name='h5Address']").val(data.h5Address);
                    workInfoPanel.find("textarea[name='videoAddress']").val(data.videoAddress);
                    workInfoPanel.find("textarea[name='content']").val(data.content);
                    workInfoPanel.find(".zyActionOtherImage").attr("src", data.pimage);
                }else if(data.fileType == 3){
                    workInfoPanel.find("input[name='title']").val(data.title);
                    workInfoPanel.find("textarea[name='content']").val(data.content);
//                  口号：slogan
                    workInfoPanel.find("input[name='slogan']").val(data.slogan);
                    $("#zyProductImgInfo").addClass("zyHidden");
                    $("#zyProductSloganInfo").removeClass("zyHidden");
                    $("input[class ='zyProductsloganInfoRadio']").attr("checked", true);
                }
            });
        },
        getSubmitData: function () {
            var personInfoPanel, workInfoPanel, productType;
            var obj = {};
            obj.participantType = $("#zySelectPersonType input:checked").val();
            personInfoPanel = $(".zyPersonInfoPanel").not(".zyHidden");
            obj.participantName = personInfoPanel.find('input[name="participantName"]').val();
            obj.participantIdNumber = personInfoPanel.find('input[name="participantIdNumber"]').val();
            obj.participantBrief = personInfoPanel.find('textarea[name="participantBrief"]').val();
            obj.teamMember = personInfoPanel.find('textarea[name="teamMember"]').val();
            obj.affiliatedUnit = personInfoPanel.find("input[name='affiliatedUnit']").val();
            workInfoPanel = $(".zyWorkInfoPanel").not(".zyHidden");
            
            productType = $("#zySelectProductType input:checked").val();
            if(productType == "1"){
                obj.title = workInfoPanel.find("input[name='title']").val();
                obj.content = workInfoPanel.find("textarea[name='content']").val();
                obj.videoAddress = workInfoPanel.find("textarea[name='videoAddress']").val();
                obj.h5Address = workInfoPanel.find("input[name='h5Address']").val();
                obj.attachFile = attachUrl;
                obj.pimage = $("#uploadBg").attr('src');
                obj.fileType = 1;
                obj.status = 1;
            }else if(productType == "3"){
//              口号
                obj.slogan = workInfoPanel.find("input[name='slogan']").val();
                obj.title = workInfoPanel.find("input[name='title']").val();
                obj.content = workInfoPanel.find("textarea[name='content']").val();
                obj.fileType = 3;
                obj.status = 1;
            }
            if (id) {
                obj.id = id;
            }

            return obj;
        },
        goToStep: function (stepId) {
            var personInfoPanel, workInfoPanel, canGo = true, previewTpl;
            if (stepId == "#zyStep1") {
                $(".zyStepTip").addClass("zyHidden");
                $("#zyInfoPanel").removeClass("zyHidden");
                $("#zyPreview").addClass("zyHidden");
                $("#zyStep1Tip").removeClass("zyHidden");
            }
            if (stepId == "#zyStep2") {
                //检测数据
                personInfoPanel = $(".zyPersonInfoPanel").not(".zyHidden");
                personInfoPanel.find(".zyActionRequired").each(function (index, el) {
	                if (!$(this).val()) {
	                    canGo = false;
	                }
                });
                if (!canGo) {
                    $().toastmessage("showErrorToast", config.messages.pleaseEnterPersonalInfo);
                    return false;
                }
                $(".zyStepTip").addClass("zyHidden");
                $("#zyInfoPanel").removeClass("zyHidden");
                $("#zyPreview").addClass("zyHidden");
                $("#zyStep2Tip").removeClass("zyHidden");
            }
            if (stepId == "#zyPreview") {
                //检测数据，设置数据
                workInfoPanel = $(".zyWorkInfoPanel").not(".zyHidden");
                workInfoPanel.find(".zyActionRequired").each(function (index, el) {
                    if (!$(this).val()) {
                        canGo = false;
                    }
                });

                if (!canGo) {
                    $().toastmessage("showErrorToast", config.messages.pleaseEnterWorkInfo);
                    return false;
                }

                previewTpl = $("#zyPreviewTpl").html();
                var obj = this.getSubmitData();
                $("#zyPreviewContent").html(juicer(previewTpl, this.getSubmitData()));

                $("#zyInfoPanel").addClass("zyHidden");
                
                $("#videoContainer").html($("#videoAddress").val());
            }
            $(".zyStep .zyStepItem.zyActive").removeClass("zyActive");
            $(".zyStepItem[data-target='" + stepId + "']").addClass("zyActive");
            $(".zyStepPanel").addClass("zyHidden");
            $(stepId).removeClass("zyHidden");
        }
    }
})(config, functions);

$(document).ready(function () {
//  ***************************附件上传******************************    
    var uploader = new plupload.Uploader({
        browse_button : 'browse', //触发文件选择对话框的按钮，为那个元素id
        url : config.ajaxUrls.attachUpload, //服务器端的上传页面地址
        multi_selection:false,
        filters:{
        	mime_types : [{ title : "Zip files", extensions : "zip,rar" }],
        	max_file_size : '200mb',
        	prevent_duplicates : true
        },
        multipart_params:{	//上传的参数
        	fileType:1,
        	file:[]
        }
    });    

    uploader.init();

    uploader.bind('FilesAdded',function(uploader,files){
//    	uploader.settings.multipart_params.file = files;
//    	that.vedioTitle = files[0].name;
//    	that.progressModel = true;
    });
 
    uploader.bind('UploadProgress',function(uploader,file){
//    	that.percent = file.percent; 
    });
    
    uploader.bind('FileUploaded',function(up, file, info){
    	$("#zyFormAttachTitle").html(file.name);
    	attachUrl = JSON.parse(info.response).object;
    });
    
    uploader.bind('Error',function(uploader,file){
//    	that.percent = file.percent; 
    });
    //最后给"开始上传"按钮注册事件
    document.getElementById('upload-btn').onclick = function(){
        uploader.start(); 
    }
	
    var submitUrl = config.ajaxUrls.workCreate;
    juicer.set({
        'tag::interpolateOpen': '$ZY{'
    });
    
    if (id) {
        uploadWork.initData(id);
        submitUrl = config.ajaxUrls.workUpdate
    }
    var zyFormHandler = new ZYFormHandler({
        submitUrl: submitUrl,
        redirectUrl: config.viewUrls.works
    });

    var productOSSUploaderObject = new uploadOSSObject("uploadBg","image/jpg,image/jpeg,image/png","jpg,jpeg,png",'10mb',
			$("#bgConsole"),$("#ossBgProgress"),$("#bgFileDescribe"),$("#ossBgfile .determinate"),$("#bgFileCompletePersent"),$("#uploadBg"));
	var productUploader = createUploader(productOSSUploaderObject);
	productUploader.init();

    $(".zyStep .zyStepItem, .zyActionNavBtn").click(function () {
        var targetPanel = $(this).data("target");
        uploadWork.goToStep(targetPanel);

    });

//    ***************************填写参赛者信息******************************
    $("#zySelectPersonType input[type='radio']").click(function () {
        var targetPanel = $(this).data("target");
        $(".zyPersonInfoPanel").addClass("zyHidden");
        $(targetPanel).removeClass("zyHidden");
    });
//    *****************************验证身份证信息****************************
 // 验证身份证 
    function isCardNo(card) {
    	var pattern = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)/; 
    	return pattern.test(card); 
    }
// 	个人
    function formValidate() {
     	var str = '';
    	// 验证身份证
	     if($.trim($('#identityPersonal').val()).length == 0) { 
	      	str += '身份证号码没有输入\n';
	      	$('#identityPersonal').focus();
	     } else {
	      	if(isCardNo($.trim($('#identityPersonal').val())) == false) {
	      		 str += '身份证号不正确；\n';
	      		 $('#identityPersonal').focus();
	     	 }
	     }
	     // 如果没有错误则提交
	     if(str != '' && $("#zySelectPersonType input[value='1']").is(':checked')) {
	    	$("#identityPersonal").val("");
	    	$().toastmessage("showErrorToast", "身份证信息有误");
	      	return false;
	     } 
    }
    $("#identityPersonal").blur(function(){
    	formValidate();
    })
//  队长
    function formValidate1() {
     	var str = '';
    	// 验证身份证
	    if($.trim($('#identityCaptain').val()).length == 0) { 
	      	str += '身份证号码没有输入\n';
	      	$('#identityCaptain').focus();
	     } else {
	      	if(isCardNo($.trim($('#identityCaptain').val())) == false) {
	       		str += '身份证号不正确；\n';
	       		$('#identityCaptain').focus();
	      	}
	     }
	     // 如果没有错误则提交
	     if(str != ''  && $("#zySelectPersonType input[value='2']").is(':checked')) {
	    	$("#identityCaptain").val("");
	    	$().toastmessage("showErrorToast", "身份证信息有误");
	      	return false;
	     } 
    }
    $("#identityCaptain").blur(function(){
    	formValidate1();
    }) 
//    *****************************验证营业执照信息****************************
    //  验证营业执照
    function isBusinessLicenseNo(BusinessLicense) { 
    	var pattern = /^(?:(?![IOZSV])[\dA-Z]){2}\d{6}(?:(?![IOZSV])[\dA-Z]){10}$/; 
    	return pattern.test(BusinessLicense); 
	}
    function formValidate2() {
     	var str = '';
    	// 验证身份证
	    if($.trim($('#BusinessLicense').val()).length == 0) { 
	      	str += '营业执照号码没有输入\n';
	      	$('#BusinessLicense').focus();
	    } else {
	      	if(isBusinessLicenseNo($.trim($('#BusinessLicense').val())) == false) {
	       		str += '营业执照号不正确；\n';
	       		$('#BusinessLicense').focus();
	      	}
	    }
	    if(str != ''  && $("#zySelectPersonType input[value='3']").is(':checked')) {
	    	$("#BusinessLicense").val("");
	    	$().toastmessage("showErrorToast", "营业执照号码信息有误");
	      	return false;
	    } 
    }
    $("#BusinessLicense").blur(function(){
    	formValidate2();
    })
//    ***************验证口号字数********************
    function checkSlogan(){
    	var str = "";
	    if($.trim($('#slogan').val()).length > 20) { 
	      	str += '口号字数超过限制\n';
	      	$('#slogan').focus();
	    }else if($.trim($('#slogan').val()).length == 0){
	    	str += '请填写口号\n';
		    $('#slogan').focus();
	    }
	    if(str != '') {
	    	$("#slogan").val("");
	    	$().toastmessage("showErrorToast", "口号输入有字数限制");
	      	return false;
	    } 
    }
    $("#slogan").blur(function(){
    	checkSlogan();
    })
//    *****************************作品上传**********************************
    	//  图幅、口号按钮选择
	  $("#zySelectProductType input[type='radio']").click(function () {
	  	var targetPanel = $(this).data("target");
	  	$(".zyProductInfoPanel").addClass("zyHidden");
	      $(targetPanel).removeClass("zyHidden");
	  });
//    *****************************作品上传**********************************
    $("#zySelectGroup input[type='radio']").click(function () {
        var targetPanel = $(this).data("target");
        $(".zyWorkInfoPanel").addClass("zyHidden");
        $(targetPanel).removeClass("zyHidden");
    });

    $("#zySubmitData").click(function () {
        formValidate();
        zyFormHandler.submitFormWithJSON(null, uploadWork.getSubmitData());
    });

});
