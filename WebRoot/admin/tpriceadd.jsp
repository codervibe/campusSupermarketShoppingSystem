<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>设置特价</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/personal.css" media="all">
	<script type="text/javascript" src="<%=path %>/layer/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/layer/layer.js"></script>
	<script type="text/javascript" src="<%=path %>/admin/js/popup.js"></script>
</head>
<body>
<% 
String id = request.getParameter("id");
String price = request.getParameter("price");
%>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>设置特价</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" id="supplierform" method="post" action="<%=path %>/admin/updateTprice.do" onsubmit="return supplieradd()">
			<input type="hidden" name="id" value="<%=id %>"/>
			<input type="hidden" id="price" value="<%=price %>"/>
				<div class="layui-form-item">
					<label class="layui-form-label">特价</label>
					<div class="layui-input-block">  
					  	<input type="text" name="tprice" id="tprice" onblur="checkprice()" required oninvalid="setCustomValidity('商品特价不能为空或价格输入有误')" oninput="setCustomValidity('');"  pattern="(0||[1-9][0-9]{0,9})(\.[0-9]{1,2})?" style="width: 300px;"  autocomplete="off"  class="layui-input" placeholder="商品特价" >
					</div>
				</div>
			    
				
				
				
				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
					    
						<button class="layui-btn" lay-submit="" id="supplierbutton" lay-filter="demo1" >立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="<%=path %>/admin/common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
	});

	function up(tt)
	{
			    layer.open({
			      type: 2,
			      title: '上传文件',
			      shadeClose: true,
			      shade: false,
			      maxmin: true, //开启最大化最小化按钮
			      area: ['450px', '200px'],
			      content: '/onlineshopssm/upload.jsp?Result='+tt
			    });
	}	

	function checkprice(){
        var price = $("#price").val();
        var tprice = $("#tprice").val();
        var dprice = parseFloat(price);
        var dtprice = parseFloat(tprice);
        if(dprice<=dtprice){
        	$("#tprice").val("");
			layer.msg("特价不能大于原价");
        }
    }
</script>
</body>
</html>