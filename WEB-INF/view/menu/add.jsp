﻿<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../assets/pages/head.jsp"%>
</head>

<body>
	<%@ include file="../assets/pages/preloader.jsp"%>
	<section>
		<%@ include file="../assets/pages/leftpanel.jsp"%>
		<div class="mainpanel">
			<%@ include file="../assets/pages/headerbar.jsp"%>
			<div class="pageheader">
				<h2>
					<i class="fa fa-key"></i> 菜单列表管理<span>新增菜单列表</span>
				</h2>
			</div>

			<div class="contentpanel">
				<!-- content goes here... -->

		<div class="panel panel-default">
        <div class="panel-heading">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title">菜单列表基本信息</h4>
          <p>填写下表，完成菜单列表创建。</p>
        </div>
        <form class="form-horizontal" id="form">
        <div class="panel-body panel-body-nopadding">
          
          	<div class="section-block"> 
	            <div class="form-group col-sm-6">
	              <label class="col-sm-3 control-label">菜单名称<span class="asterisk">*</span></label>
	              <div class="col-sm-6">
	                <input type="text" id="menuName" name="menuName" placeholder="菜单名称" class="form-control" value="" />
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="col-sm-3 control-label">菜单URL<span class="asterisk">*</span></label>
	              <div class="col-sm-6">
	                <input type="text" name="url" placeholder="菜单URL（少于64字符）" class="form-control" value="" />
	              </div>
	            </div> 
	            <div class="form-group col-sm-6">
	              <label class="col-sm-3 control-label">所属权限</label>
	              <div class="col-sm-6">
                    <select name="menuCategory" class="menuCategory-select fullwidth" multiple="multiple" >
					</select>     
                  </div>
	            </div>
	        </div>
        </div><!-- panel-body -->
        <div class="panel-footer align-center">
			<input id="addMenu" class="btn btn-primary" type="submit" value="保存"/>&nbsp;
			<input class="btn btn-default" type="button" id="btn-back" value="取消"/>
		</div><!-- panel-footer -->
     </form>   
      </div><!-- panel -->
			</div>

		</div>
		<!-- mainpanel -->
		<%@ include file="../assets/pages/rightpanel.jsp"%>
	</section>


<!-- Modal -->
<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">信息</h4>
      </div>
      <div class="modal-body">
        保存数据时出错了
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal -->



	<%@ include file="../assets/pages/foot.jsp"%>
	<script src="${rootPath}assets/js/jquery.validate.min.js"></script>
	<script src="${rootPath}assets/js/select2.min.js"></script>
	<script src="${rootPath}assets/js/jquery-ui-1.10.3.min.js"></script>
	<script src="${rootPath}assets/js/jquery.datatables.min.js"></script>
	
	<script type="text/javascript">
		var menuCategory = ${menuCategory}
		$(".menuCategory-select").select2({
	        placeholder: '所属权限',
	        data: menuCategory,
	     });
		
		jQuery(document).ready(function() {
			$(".nav-parent").eq(8).addClass("nav-active");
      		$(".nav-parent").eq(8).find(".children").show();

			jQuery("#form").validate({
				rules: {
					menuName: {
						required:true,
			            isMenuName:true,
					},
					url:{
						required:true,
			            isUrl:true,
					},
				},
				messages: {
					menuName:{
						required:"请输入权限名称",
					},
					url:{
						required:"请输入URL",	
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
			      $("#addMenu").attr("disabled","disabled");
			      form_submit();
			      return false;
			    }
			 });
			jQuery.validator.addMethod("isMenuName", function(value, element) {  
				var length = value.length;  
				return length <=15;    
			}, "请少于15字");
			jQuery.validator.addMethod("isUrl", function(value, element) {  
				var length = value.length;  
				return length <=64;    
			}, "请少于64字");

			$("#btn-back").click( function () {
				history.go(-1);
		    }); 
		});
		
		function form_submit() {
			var f = $("#form").serialize();
			$.post('${rootPath}menu/add.do', f, function(result) {
				var rmsg = result.msg;
				if (result.success) {
					window.parent.location = "${rootPath}menu/list.html";
				} else {
					$("#msgModal").modal('show');
				}
			}, "JSON");
		}
	</script>
</body>
</html>
