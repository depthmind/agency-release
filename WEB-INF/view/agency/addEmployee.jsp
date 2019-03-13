<%@ page language="java" pageEncoding="utf-8"%> 
<%@ page contentType="text/html; charset=utf-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<style type="text/css">
        .img-div{
            border: 1px solid #ddd;
            border-radius: 100%;
            float: left;
            line-height: 1;
            margin-left: 5px;
            overflow: hidden;
        }
    </style>
<%@ include file="../assets/pages/head.jsp"%>
</head>

<body>
	<%@ include file="../assets/pages/preloader.jsp"%>
	<section>
		<%@ include file="../assets/pages/leftpanel-agency.jsp"%>
		<div class="mainpanel">
			<%@ include file="../assets/pages/headerbar.jsp"%>
			<div class="pageheader">
				<h2>
					<i class="glyphicon glyphicon-cog"></i> 员工管理 <span>新增员工</span>
				</h2>
			</div>

			<div class="contentpanel">
				<!-- content goes here... -->

		<div class="panel panel-default">
        <div class="panel-heading">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title">员工基本信息</h4>
          <p>填写下表，完成员工创建。</p>
        </div>
        <form class="form-horizontal" id="form" enctype="multipart/form-data" method="POST" action="${rootPath}goods/addGoodsAndProduct.do">
        <div class="panel-body panel-body-nopadding">
	        <div class="section-block">    
	            <div class="form-group col-sm-4">
	              <label class="col-sm-4 control-label">员工姓名 <span class="asterisk">*</span></label>
	              <div class="col-sm-8">
	                <input type="text" id=contactName name="contactName" placeholder="员工姓名" class="form-control" />
	              </div>
	            </div>
	            <div class="form-group col-sm-4">
	              <label class="col-sm-4 control-label">员工电话 </label>
	              <div class="col-sm-8">
	                <input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" id="mobilephone" name=mobilephone placeholder="员工电话" class="form-control" />
	              </div>
	            </div> 		
	            <div class="form-group col-sm-4">
	              <label class="col-sm-4 control-label">地址 </label>
	              <div class="col-sm-8">
	                <input type="text" id="address" name="address" class="form-control" />
	              </div>
	            </div>
	        </div>
        </div><!-- panel-body -->
        
        <div class="panel-footer align-center">
			<input class="btn btn-primary" type="submit" value="保存"/>&nbsp;
			<input class="btn btn-default" type="button" id="btn-back" value="取消"/>
			<input hidden="hidden" name="agencyId" value="${agencyId }">
		</div><!-- panel-footer -->
     </form>   
      </div><!-- panel -->
			</div>

		</div>
		<!-- mainpanel -->
		<%@ include file="../assets/pages/rightpanel.jsp"%>
	</section>

	<%@ include file="../assets/pages/foot.jsp"%>
	<script src="${rootPath}assets/js/jquery.validate.min.js"></script>
	
	<script type="text/javascript">
	var selectedGoodsPic = ''; //定义全局变量，用于存储已选图片
	if (typeof FileReader == 'undefined') {
        document.getElementById("xmTanDiv").InnerHTML = "<h1>当前浏览器不支持FileReader接口</h1>";
        //使选择控件不可操作
        document.getElementById("thumbnail").setAttribute("disabled", "disabled");
    }
	jQuery(document).ready(function() {	
		$("#btn-back").click( function () {
			history.go(-1);
	    } ); 
		
		jQuery("#form").validate({
			rules: {
				contactName: {
					required:true,
				},
				mobilephone: {
					required:true,
					isMobile:true,
				},
				address: {
					required:true,
				},
			},
			messages: {
				contactName: {
					required:"请输入员工姓名",
				},
				mobilephone: {
					required:"请输员工电话",
				},
				address: {
					required:"请输入地址",
				},
			},
		    highlight: function(element) {
		      jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
		    },
		    success: function(element) {
		      jQuery(element).closest('.form-group').removeClass('has-error');
		    },
		    invalidHandler : function(){
		      return false;
		    },
		    submitHandler : function(){
		      form_submit();
		      return false;
		    }
		  });
		
		jQuery.validator.addMethod("isMobile", function(value, element) {  
			var length = value.length;  
			var regPhone = /^1([3578]\d|4[57])\d{8}$/;  
			return this.optional(element) || ( length == 11 && regPhone.test( value ) );    
		}, "请正确填写您的手机号码");
	});
			      
		function form_submit() {
			var f = $("#form").serialize();
			$.post('${rootPath}agency/addEmployee.do', f, function(result) {
				var rmsg = result.msg;
				if (result.success) {
					window.parent.location = "${rootPath}agency/employeeList.html?agencyId=${agencyId}";
				} else {
					$("#msgModal").modal('show');
				}
			}, "JSON");
		}
	
	</script>

</body>
</html>
