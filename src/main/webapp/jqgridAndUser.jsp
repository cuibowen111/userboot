<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="app" value="${pageContext.request.contextPath}"/>

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
                        return "<button class='btn btn-primary' id='update'>修改</button><button class='btn btn-primary' id='delete'>删除</button>"
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

    $("#bedata").click(function() {
        jQuery("#list").jqGrid('editGridRow', "new", {
            height : 300,
            reloadAfterSubmit : false
        });
    });

    $("#update").click(function() {
        var gr = jQuery("#list").jqGrid('getGridParam', 'selrow');
        if (gr != null)
            jQuery("#list").jqGrid('editGridRow', gr, {
                height : 300,
                reloadAfterSubmit : false
            });
        else
            alert("Please Select Row");
    });

    $("#delete").click(function() {
        var gr = jQuery("#list").jqGrid('getGridParam', 'selrow');
        if (gr != null)
            jQuery("#list").jqGrid('delGridRow', gr, {
                reloadAfterSubmit : false
            });
        else
            alert("Please Select Row to delete!");
    });
</script>


<!--菜单内容-->
<div class="col-sm-10" style="top: -35px;">
    <!--页头-->
    <div class="page-header">
        <h1>用户管理</h1>
    </div>
    <!--标签页-->
    <div>
        <ul class="nav nav-tabs">
            <li role="presentation" class="active">
                <a href="#home">用户列表</a>
            </li>
            <li role="presentation">
                <a data-toggle="modal" data-target="#myModal" id="bedata">用户添加</a>
            </li>
        </ul>

        <!--用户列表-->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                <!--带标题的面版-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <!--居中-->
                        <center>
                            <form class="form-inline" id="selectLike">
                                <div class="form-group">
                                    <label>姓名</label>
                                    <input type="text" class="form-control" placeholder="请输入姓名" name="name">
                                </div>
                                <div class="form-group">
                                    <label>手机号</label>
                                    <input type="text" class="form-control" placeholder="请输入手机号" name="iphone">
                                </div>
                                <div class="form-group">
                                    <label>激活状态</label>
                                    <select name="status" class="form-control">
                                        <option value="" >----请选择----</option>
                                        <option value="已激活">已激活</option>
                                        <option value="未激活">未激活</option>
                                    </select>
                                </div>
                                <button type="button" class="btn btn-info" id="selectLikeUser">查询</button>
                            </form>
                        </center>
                    </div>

                    <div class="panel-body">
                        <!--表格-->
                        <table id="list"></table>
                        <!--分页-->
                        <div id="pager" style="height: 50px"></div>
                    </div>

                    <div>
                        <center>
                            <form action="${app}/user/upload" method="post" enctype="multipart/form-data">
                                <input type="file" name="file"> <br>
                                <input type="submit" value="上传">
                            </form>
                        </center>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>




