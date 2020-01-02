<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="app" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <%-- bootstrap的核心css --%>
    <link rel="stylesheet" href="${app}/css/bootstrap.min.css">
    <%-- jqgrid主题样式 --%>
    <link rel="stylesheet" href="${app}/jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
    <%-- jqgrid.js --%>
    <script src="${app}/js/jquery-3.3.1.min.js"></script>
    <%--bootstrap.js--%>
    <script src="${app}/js/bootstrap.min.js"></script>
    <%-- 国际化 --%>
    <script src="${app}/jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
    <%-- jqGird核心js --%>
    <script src="${app}/jqgrid/js/trirand/jquery.jqGrid.min.js"></script>
    <script>
        $(function () {
            $("#list").jqGrid({
                url:"${app}/user/queryByPage",
                datatype:"json",
                colNames:[
                    "Id","姓名","密码","生日","手机号","状态","操作"
                ],
                autowidth:true,//表格宽度能够自动调整
                colModel:[
                    {name:"id"},
                    {name:"name",editable:true},
                    {name:"password",editable:true,edittype:"password"},
                    {name:"birthday",editable:true,edittype:"date"},
                    {name:"iphone",editable:true},
                    {name:"status",editable:true,edittype:"select",editoptions:{
                        value:"已激活:已激活;未激活:未激活"
                        }},
                    {name:"option",formatter:function(cellvalue, options, rowObject){
                        return "<button class='btn btn-primary'>修改</button><button class='btn btn-primary'>删除</button>"
                        }}
                ],
                pager:"#pager",//定义导航栏
                styleUI:"Bootstrap",
                viewrecords:true,//定义是否要显示总记录数
                caption:"用户列表",//	表格名称
                toolbar:[true,"top"], //表格的工具栏
                editurl:"${app}/user/edit",//定义对form编辑时的url
                rowNum:2,//每页展示的条数
                rowList:[2,4,6]
            }).jqGrid("navGrid","#pager",{})
        })
    </script>
</head>
<body>
    <table id="list"></table>
    <div id="pager" style="height: 50px"></div>
</body>
</html>
