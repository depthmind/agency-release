<%@ page language="java" pageEncoding="utf-8"%>
<div class="leftpanel">
<style>
  .second-children li{
            display:none;
        }
    .children > li:hover .second-children li{
         display:block;
        }
        .second-children{
            margin-top:0px;
            margin-left:18px;
            position:absolute;
            line-height:18px;
            padding-left:10px;
        }
        .nav-bracket .second-children {
            list-style: none;
            display: none;
            margin: 5px 0;
            padding: 0;
        }

        .nav-bracket .second-children > li > a {
            color: #94989d;
            font-size: 13px;
            display: block;
            padding: 8px 0 8px 8px;
            -moz-transition: all 0.2s ease-out 0s;
            -webkit-transition: all 0.2s ease-out 0s;
            transition: all 0.2s ease-out 0s;
        }

        .nav-bracket .second-children > li > a > span {
            margin-top: 2px;
        }

        .nav-bracket .second-children > li > a:hover,
        .nav-bracket .second-children > li > a:active,
        .nav-bracket .second-children > li > a:focus {
            text-decoration: none;
            color: #1caf9a;
        }

        .nav-bracket .second-children > li .fa {
            font-size: 12px;
            opacity: 0.5;
            margin-right: 5px;
            text-align: left;
            width: auto;
            vertical-align: baseline;
        }

        .nav-bracket .second-children > li.active > a {
            color: #1caf9a;
        }

        .nav-bracket .second-children ul {
            margin-left: 12px;
            border: 0;
        }
	</style>
    <div class="logopanel">
        <h1><span></span> 代理系统 <span></span></h1>
    </div><!-- logopanel -->
    <div class="leftpanelinner">

        <h5 class="sidebartitle"></h5>
        <ul class="nav nav-pills nav-stacked nav-bracket">  
            <li class="nav-parent" id="agency"><a href=""><i class="glyphicon glyphicon-briefcase"></i> <span>员工管理</span></a>
                <ul class="children">
                    <li><a href="${rootPath }agency/employeeList.html?agencyId=1"><i class="fa fa-caret-right"></i> 员工列表</a></li>
                    <li><a href="${rootPath }agency/addEmployee.html?agencyId=1"><i class="fa fa-caret-right"></i> 新增员工</a></li>
                </ul>     
            </li> 
            <li class="nav-parent" id="goods"><a href=""><i class="fa fa-circle"></i> <span>商品管理</span></a>
                <ul class="children">
                    <li><a href="${rootPath }goods/goodsList.html?agencyId=1"><i class="fa fa-caret-right"></i> 商品列表</a></li>
                    <li><a href="${rootPath }goods/addGoodsAndProduct.html?agencyId=1"><i class="fa fa-caret-right"></i> 新增商品</a></li>
                </ul>     
            </li> 
            <li><a href="${rootPath }signout.html" id="signout"><i class="glyphicon glyphicon-log-out"></i> 退出登录</a></li>                     
        </ul>
        
        <script type="text/javascript">
        	//获取session中的roleID，根据ID判断左侧导航栏的显隐
			var roleID = <%=session.getAttribute("roleID")%>
			var menuNameList= <%=session.getAttribute("menuNameList")%>
			var menuIdList= <%=session.getAttribute("menuIdList")%>
				document.getElementById("agency").style.display = "block"
				document.getElementById("goods").style.display = "block"
				document.getElementById("parameter").style.display = "none"
				document.getElementById("menu").style.display = "none"
				document.getElementById("signout").style.display = "block"
				document.getElementById("individual").style.display = "block"
			for(var i=0;i<menuNameList.length;i++){
				if(menuNameList[i]==("代理业绩统计")||menuNameList[i]==("获取链接")||menuNameList[i]==("代理的下级业绩统计")){
					document.getElementById("agency").style.display = "block";
				}
				if(menuNameList[i]==("管理员统计所有代理业绩")){
					document.getElementById("admin").style.display = "block";
				}
				if(menuNameList[i]==("用户展示列表界面")||menuNameList[i]==("新增用户界面")||menuNameList[i]==("编辑用户界面")){
						document.getElementById("user").style.display = "block";
				}
				/* if(menuNameList[i]==("编辑角色界面")||menuNameList[i]==("权限列表界面")
						||menuNameList[i]==("新增角色界面")||menuNameList[i]==("角色列表界面")
						||menuNameList[i]==("编辑权限界面")||menuNameList[i]==("新增权限界面")){
						document.getElementById("menu").style.display = "block";
				} */
				/* if(menuNameList[i]==("系统参数列表界面")||menuNameList[i]==("新增系统参数界面")||menuNameList[i]==("编辑系统参数界面")||menuNameList[i]==("邮件日志列表界面")
						||menuNameList[i]==("短信日志列表界面")||menuNameList[i]==("im通讯日志列表界面")
					    ||menuNameList[i]==("腾讯im日志列表界面")||menuNameList[i]==("异常日志列表界面")){
						document.getElementById("parameter").style.display = "block";
				} */
			}
		</script>

    </div><!-- leftpanelinner -->
</div><!-- leftpanel -->
