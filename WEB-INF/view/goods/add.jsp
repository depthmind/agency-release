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
	<%-- <link rel="stylesheet" type="text/css" href="${rootPath}assets/jquery-easyui-1.7.0/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${rootPath}assets/jquery-easyui-1.7.0/themes/icon.css"> --%>
</head>

<body>
	<%@ include file="../assets/pages/preloader.jsp"%>
	<section>
		<%@ include file="../assets/pages/leftpanel-agency.jsp"%>
		<div class="mainpanel">
			<%@ include file="../assets/pages/headerbar.jsp"%>
			<div class="pageheader">
				<h2>
					<i class="glyphicon glyphicon-cog"></i> 商品管理 <span>新增商品</span>
				</h2>
			</div>

			<div class="contentpanel">
				<!-- content goes here... -->

		<div class="panel panel-default">
        <div class="panel-heading">
          <div class="panel-btns">
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title">商品基本信息</h4>
          <p>填写下表，完成商品创建。</p>
        </div>
        <form class="form-horizontal" id="form" enctype="multipart/form-data" method="POST" action="${rootPath}goods/addGoodsAndProduct.do">
        <div class="panel-body panel-body-nopadding">
	        <div class="section-block">
	        	<div class="form-group col-sm-4">
					<label class="col-sm-4 control-label">一级分类<span class="asterisk">*</span></label>
					<div class="col-sm-8">
						<input type="text" name="oneLevelCategory" id="oneLevelCategory"
							class="level-one-select fullwidth" value="${enterpriseName}"/>
					</div>
				</div>
				<div class="form-group col-sm-4" id="erji" hidden="hidden">
					<label class="col-sm-4 control-label">二级分类<span class="asterisk">*</span></label>
					<div class="col-sm-8">
					<input type="text" name="secondLevelCategory"
						class="level-two-select form-control fullwidth" value="${enterpriseCustomer}" />
					</div>
				</div>  
	            <div class="form-group col-sm-4">
	              <label class="col-sm-4 control-label">商品名称 <span class="asterisk">*</span></label>
	              <div class="col-sm-8">
	                <input type="text" id="goodsName" name="goodsName" placeholder="商品名称" class="form-control" />
	              </div>
	            </div>
	            <div class="form-group col-sm-4">
	              <label class="col-sm-4 control-label">商品编码 </label>
	              <div class="col-sm-8">
	                <input type="text" id="goodsCode" name="goodsCode" placeholder="商品编码" class="form-control" />
	              </div>
	            </div> 		
	            <!-- <div class="form-group col-sm-4">
	              <label class="col-sm-4 control-label">已售数量 </label>
	              <div class="col-sm-8">
	                <input type="text" id="soldAmount" name=""soldAmount"" placeholder="前端展示的销量=实际销量+已出售量" class="form-control" />
	              </div>
	            </div> --> 	
	            <div class="form-group col-sm-4">
	              <label class="col-sm-4 control-label"> 缩略图 <span class="asterisk">*</span></label>
	              <div class="col-sm-8">
	                <input type="file" onchange="xmTanUploadImg(this)" id="thumbnail" name="thumbnail" class="form-control" />
	              </div>
	            </div>
	            <div id="pic"></div>
	            <div class="form-group col-sm-4">
	              <label class="col-sm-4 control-label"> 商品图片 <span class="asterisk">*</span></label>
	              <div class="col-sm-8">
	                <input type="file" multiple="multiple" onchange="uploadGoodsPic(this)" id="goodsPic" name="goodsPic" class="form-control" />
	              </div>
	            </div>
	            <div id="pics"></div>
	            <div class="img-box" id="imgboxid">
 
    </div>

	                  <div id="xmTanDiv"></div><br/>
	            <div id="errordiv"   style="margin-top:15px;width:100%;text-align:center;">
            </div>
	            <!-- <div class="form-group col-sm-4">
	              <label class="col-sm-4 control-label">售价 <span class="asterisk">&nbsp;</span></label>
	              <div class="col-sm-8">
	                <input type="text" name="sellPrice" placeholder="售价（单位：元）" class="form-control" />
	              </div>
	            </div> 	
	            <div class="form-group col-sm-4">
	              <label class="col-sm-4 control-label">商品库存 <span class="asterisk">&nbsp;</span></label>
	              <div class="col-sm-8">
	                <input type="text" name="stock" placeholder="商品库存" class="form-control" />
	              </div>
	            </div> --> 
	        </div>
	        <%-- <div class="section-block"> 
	        	<table id="dg" class="easyui-datagrid" title="规格管理" style="width:700px;height:auto"
			data-options="
				iconCls: 'icon-edit',
				singleSelect: true,
				rownumbers:true,
				toolbar: '#tb',
				method: 'get',
				url:'${rootPath }miniApp/findAllProduct.do',
				onClickRow: onClickRow
			">
		<thead>
			<tr>
				<th data-options="field:'id',width:80" hidden="true">ID</th>
				<th data-options="field:'productName',width:80,editor:'textbox'">规格名称</th>
				<th data-options="field:'productName',width:100,
						formatter:function(value,row){
							return row.productName;
						},
						editor:{
							type:'combobox',
							options:{
								valueField:'id',
								textField:'productName',
								method:'get',
								url:'${rootPath }goods/findProductByGoodsId',
								required:true
							}
						}">规格名称</th>
				<th data-options="field:'price',width:80,align:'right',editor:{type:'numberbox',options:{precision:1}}">价格</th>
				<th data-options="field:'stock',width:80,align:'right',editor:'numberbox'">库存</th>
				<th data-options="field:'description',width:250,editor:'textbox'">描述</th>
				<th data-options="field:'status',width:60,align:'center',editor:{type:'checkbox',options:{on:'在售',off:'下架'}}">状态</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="height:auto">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">新增</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">取消</a>
		<!-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges()">GetChanges</a> -->
	</div>
	        </div> --%>                                          
        </div><!-- panel-body -->
        
        <div class="panel-footer align-center">
			<input class="btn btn-primary" type="submit" value="保存"/>&nbsp;
			<input class="btn btn-default" type="button" id="btn-back" value="取消"/>
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
	<script src="${rootPath}assets/js/select2.min.js"></script>
	<%-- <script type="text/javascript" src="${rootPath}assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="${rootPath}assets/js/jquery.easyui.min.js"></script> --%>
	
	<script type="text/javascript">
	var oneLevelCategory = ${oneLevelCategory};
	$(".level-one-select").select2({
        placeholder: '选择一级分类',
        data: oneLevelCategory
      });
	
	$("#oneLevelCategory").change(function(){
  		var id = $("#oneLevelCategory").val();
  		try{
   		  $.post("${rootPath}category/findSecondLevelCategoryById.do?id=" + id,function(result) {
   			  $("#erji").show()
				var secondLevelCategory = result
				$(".level-two-select").select2({
					 placeholder: '选择一个企业客户',
					 data: secondLevelCategory
				});
			}, "JSON");
   		  }
   	  catch(e) {
   		  alert(e);
   	  }  		
  	})
	
	var selectedGoodsPic = ''; //定义全局变量，用于存储已选图片
	if (typeof FileReader == 'undefined') {
        document.getElementById("xmTanDiv").InnerHTML = "<h1>当前浏览器不支持FileReader接口</h1>";
        //使选择控件不可操作
        document.getElementById("thumbnail").setAttribute("disabled", "disabled");
    }
	jQuery(document).ready(function() {	
		/* jQuery("#form").validate({
			rules: {
				goodsName: {
					required:true,
				},
				goodsPic: {
					required:true,
				},
				thumbnail: {
					required:true,
				}
			},
			messages: {
				goodsName: {
					required:"请输入商品名称",
				},
				goodsPic: {
					required:"请上传商品图片",
				},
				thumbnail: {
					required:"请上传缩略图",
				}
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
		  }); */
		$("#btn-back").click( function () {
			history.go(-1);
	    } ); 
		jQuery.validator.addMethod("isDomain", function(value, element) {  
			var length = value.length;  
			return length <=32;    
		}, "请少于32字");
		jQuery.validator.addMethod("isValue", function(value, element) {  
			var length = value.length;  
			return length <=512;    
		}, "请少于512字");
		jQuery.validator.addMethod("isDepict", function(value, element) {  
			var length = value.length;  
			return length <=30;    
		}, "请少于30字");
		jQuery.validator.addMethod("isChinese", function(value, element) {  
			var length = value.length;  
			return length <=30;    
		}, "请少于30字");
		jQuery.validator.addMethod("isEnglish", function(value, element) {  
			var length = value.length;  
			return length <=32;    
		}, "请少于32字");
	});
			      
		function form_submit() {
			var f = $("#form").serialize();
			$.post('${rootPath}upload/filesUpload?filePath=' + fileObj, f, function(result) {
				var rmsg = result.msg;
				if (result.success) {
					window.parent.location = "${rootPath}parameter/add.html";
				} else {
					$("#msgModal").modal('show');
				}
			}, "JSON");
			/* $.ajax({
			    url: '${rootPath}upload/filesUpload',
			    type: 'post',
			    dataType: 'multipart/form-data',
			    data: {
			    	filePath: JSON.stringify(arr),  //JSON.stringify() 方法用于将JavaScript值转换为 JSON 字符串，缺少此句传到后台的则为空值
			        //sumID: sumID  //datagrid未显示出来的那个字段，表中的三行的这个字段相同，都为1L，传递到后台供保存到数据库时使用
			    },
			    success: function(response) {  //后台返回的要显示的消息
			        $.messager.show({
			            title:'提示',
			            msg: response.msg
			        });
			    }
			}); */
		}
	
		function xmTanUploadImg(obj) {
            var file = obj.files[0];
            
            console.log(obj);console.log(file);
            console.log("file.size = " + file.size);  //file.size 单位为byte

            var reader = new FileReader();

            //读取文件过程方法
            reader.onloadstart = function (e) {
                console.log("开始读取....");
            }
            reader.onprogress = function (e) {
                console.log("正在读取中....");
            }
            reader.onabort = function (e) {
                console.log("中断读取....");
            }
            reader.onerror = function (e) {
                console.log("读取异常....");
            }
            reader.onload = function (e) {
                console.log("成功读取....");
                var thumbnail = '<img src=\"' + e.target.result + '\"</img>';
                document.getElementById('pic').innerHTML = thumbnail;
            }
            reader.readAsDataURL(file)
        }
		var arr = []; //定义存储文件的数组，用于删除已选图片
		var fileObj;
		var fd = new FormData();
		function uploadGoodsPic(obj) {
			fileObj = obj
            var file = obj.files[0];
            arr.push(obj.files[0]);
            console.log(arr);
            //console.log(obj);console.log(file);
            //console.log("file.size = " + file.size);  //file.size 单位为byte

            var reader = new FileReader();

            //读取文件过程方法
            reader.onloadstart = function (e) {
                console.log("开始读取....");
            }
            reader.onprogress = function (e) {
                console.log("正在读取中....");
            }
            reader.onabort = function (e) {
                console.log("中断读取....");
            }
            reader.onerror = function (e) {
                console.log("读取异常....");
            }
            reader.onload = function (e) {
                console.log("成功读取....");
                selectedGoodsPic = selectedGoodsPic + '<img style="width:40px;height:40px" src=\"' + e.target.result + '\"</img>';
                document.getElementById('pics').innerHTML = selectedGoodsPic;
            }
            reader.readAsDataURL(file)
			var fl=obj.files.length;
	        for(var i=0;i<fl;i++){
	            var file=obj.files[i];
	            var reader = new FileReader();
	 
	            //读取文件过程方法
	 
	            reader.onloadstart = function (e) {
	                console.log("开始读取....");
	            }
	            reader.onprogress = function (e) {
	                console.log("正在读取中....");
	            }
	            reader.onabort = function (e) {
	                console.log("中断读取....");
	            }
	            reader.onerror = function (e) {
	                console.log("读取异常....");
	            }
	            reader.onload = function (e) {
	                console.log("成功读取....");
	 
	                var imgstr='<img style="width:100px;height:100px;" src="'+e.target.result+'"/>';
	                var oimgbox=document.getElementById("imgboxid");
	                var ndiv=document.createElement("div");
	 
	                ndiv.innerHTML=imgstr;
	                ndiv.className="img-div";
	                oimgbox.appendChild(ndiv);
	               
	            }
	 
	            reader.readAsDataURL(file);
	            fd.append(i,this.files[i]);
        }
		
		var editIndex = undefined;
		function endEditing(){
			if (editIndex == undefined){return true}
			if ($('#dg').datagrid('validateRow', editIndex)){
				var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productName'});
				var productName = $(ed.target).combobox('getText');
				$('#dg').datagrid('getRows')[editIndex]['productName'] = productName;
				$('#dg').datagrid('endEdit', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		function onClickRow(index){
			if (editIndex != index){
				if (endEditing()){
					$('#dg').datagrid('selectRow', index)
							.datagrid('beginEdit', index);
					editIndex = index;
				} else {
					$('#dg').datagrid('selectRow', editIndex);
				}
			}
		}
		function append(){
			if (endEditing()){
				$('#dg').datagrid('appendRow',{status:'P'});
				editIndex = $('#dg').datagrid('getRows').length-1;
				$('#dg').datagrid('selectRow', editIndex)
						.datagrid('beginEdit', editIndex);
			}
		}
		function removeit(){
			if (editIndex == undefined){return}
			$('#dg').datagrid('cancelEdit', editIndex)
					.datagrid('deleteRow', editIndex);
			editIndex = undefined;
		}
		function accept(){
			if (endEditing()){
				$('#dg').datagrid('acceptChanges');
				var addrows = $("#dg").datagrid('getRows'); //获取加项列表中的所有行，上面截图中datagrid的"id=additem"
				var str = [];        //声明一个数组，是一个数组对象
				for(var i=0; i<addrows.length; i++) {
				    var arr = {};           //声明一个对象
				    arr.id = addrows[i].id;  //未在datagrid中显示该字段,但数据库中存在，并且后面后台的保存操作也是根据该字段来进行
				    arr.productName = addrows[i].productName;  //名称
				    arr.price = addrows[i].price; 
				    arr.stock = addrows[i].stock; 
				    str[i] = arr;   //
				}
				$.ajax({
				    url: '${rootPath}goods/saveProduct.do',
				    type: 'post',
				    dataType: 'json',
				    data: {
				        equations: JSON.stringify(str),  //JSON.stringify() 方法用于将JavaScript值转换为 JSON 字符串，缺少此句传到后台的则为空值
				        //sumID: sumID  //datagrid未显示出来的那个字段，表中的三行的这个字段相同，都为1L，传递到后台供保存到数据库时使用
				    },
				    success: function(response) {  //后台返回的要显示的消息
				        $.messager.show({
				            title:'提示',
				            msg: response.msg
				        });
				    }
				});
			}
		}
		function reject(){
			$('#dg').datagrid('rejectChanges');
			editIndex = undefined;
		}
		function getChanges(){
			var rows = $('#dg').datagrid('getChanges');
			alert(rows.length+' rows are changed!');
		}
	}
	</script>

</body>
</html>
