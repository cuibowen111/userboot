<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

    <script type="text/javascript">
        function all(){
            $("#myTbody").empty();
            $.ajax({
                url:"${pageContext.request.contextPath}/user/queryAll",
                datatype:"json",
                success:function (data) {
                    $.each(data, function (index, item) {
                        $("#myTbody").append("<tr>" +
                            "<td>"+item.id+"</td>" +
                            "<td>"+item.name+"</td>" +
                            "<td>"+item.password+"</td>" +
                            "<td>"+item.birthday+"</td>" +
                            "<td>"+item.iphone+"</td>" +
                            "<td>"+item.status+"</td>" +
                            "<td><button type=\"submit\" class=\"btn btn-primary\" id="+item.id+" data-toggle=\"modal\" data-target=\"#myModal1\" onclick='selectId(this)'>修改</button>" +
                            "<button type=\"submit\" class=\"btn btn-primary\" onclick='deleteId(this)' id="+item.id+">删除</button></td>"+
                            "</tr>")
                    });
                }
            })
        }

        /*根据id删除*/
        function deleteId(even) {
            var prop = $(even).prop("id");
            $.ajax({
                url:"${pageContext.request.contextPath}/user/deleteUser",
                datatype:"json",
                data:"id="+prop,
                success:function () {
                    all();
                }
            })
        }


        /*根据id查询*/
        function selectId(even) {
            var prop = $(even).prop("id");
            $.ajax({
                url:"${pageContext.request.contextPath}/user/selectById",
                datatype:"json",
                data:{"id":prop},
                success:function (data) {
                    $("#name1").val(data.name)
                    $("#password1").val(data.password)
                    $("#age1").val(data.age)
                    $("#birthday1").val(data.birthday)
                    $("#iphone1").val(data.iphone)
                    var status = data.status;
                    if (status=="激活"){
                        $("#status1").val("激活")
                    } else {
                        $("#status1").val("未激活")
                    }
                }
            })
        }

        function removeadd(){
            $("#add")[0].reset();
        }

        function removeupdate(){
            $("#update")[0].reset();
        }

        /*/!*用户添加*!/
        function ope() {
            $('#myModal').modal("show");
            $("#insert")[0].reset();
            $.ajax({

            })
        }*/

        /*用户修改*/
        /*function opes(){
            $('#myModal1').modal("show")
            $("#update")[0].reset();
        }*/
        $(function () {

            /*模糊查询*/
            $("#selectLikeUser").click(function () {
                $("#myTbody").empty();
                var serialize = $("#selectLike").serialize();
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/queryLike",
                    datatype:"json",
                    data:serialize,
                    success:function (data) {
                        $.each(data, function (index, item) {
                            $("#myTbody").append("<tr>" +
                                "<td>"+item.id+"</td>" +
                                "<td>"+item.name+"</td>" +
                                "<td>"+item.password+"</td>" +
                                "<td>"+item.birthday+"</td>" +
                                "<td>"+item.iphone+"</td>" +
                                "<td>"+item.status+"</td>" +
                                "<td><button type=\"submit\" class=\"btn btn-primary\" id="+item.id+" data-toggle=\"modal\" data-target=\"#myModal1\" onclick='selectId(this)'>修改</button>" +
                                "<button type=\"submit\" class=\"btn btn-primary\" onclick='deleteId(this)' id="+item.id+">删除</button></td>"+
                                "</tr>")
                        });
                    }
                })
            })

            /*修改*/
            $("#myUpdate").click(function () {
                var serialize = $("#update").serialize();
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/updateUser",
                    datatype:"json",
                    data:serialize,
                    success:function () {
                        all();
                    }
                })
                removeupdate();
            })

            /*添加*/
            $("#myInsert").click(function () {
                var serialize = $("#add").serialize();
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/addUser",
                    datatype:"json",
                    data:serialize,
                    success:function () {
                        all();
                    }
                })
                removeadd();
            })

            /*查询所有*/
            all();
        })
    </script>


<!--模态框 用户添加-->
<div class="modal fade" tabindex="-1" id="myModal" data-backdrop="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" data-target="#myModal">
                    <span>&times;</span>
                </button>
                <h4 class="modal-title">添加用户</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="add">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">姓名:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" placeholder="请输入姓名" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">密码:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" placeholder="请输入密码" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">年龄:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" placeholder="请输入年龄" name="age">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">生日:</label>
                        <div class="col-sm-6">
                            <input type="date" class="form-control" placeholder="年/月/日" name="birthday">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">手机号:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" placeholder="请输入手机号" name="iphone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">激活状态:</label>
                        <div class="col-sm-6">
                            <select name="status" class="form-control">
                                <option value="激活">已激活</option>
                                <option value="未激活">未激活</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="myInsert">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="removeadd()">关闭</button>
            </div>
        </div>
    </div>
</div>

<%--用户修改--%>
<div class="modal fade" tabindex="-1" id="myModal1" data-backdrop="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" data-target="#myModal">
                    <span>&times;</span>
                </button>
                <h4 class="modal-title">修改用户信息</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="update">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">姓名:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="name1" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">密码:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="password1" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">年龄:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="age1" name="age">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">生日:</label>
                        <div class="col-sm-6">
                            <input type="date" class="form-control" id="birthday1" name="birthday">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">手机号:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="iphone1" name="iphone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">激活状态:</label>
                        <div class="col-sm-6">
                            <select name="status" class="form-control" id="status1">
                                <option value="激活">已激活</option>
                                <option value="未激活">未激活</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="myUpdate">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="removeupdate()">关闭</button>
            </div>
        </div>
    </div>
</div>








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
                        <a data-toggle="modal" data-target="#myModal">用户添加</a></li>
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
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>姓名</th>
                                        <th>密码</th>
                                        <th>生日</th>
                                        <th>手机号</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="myTbody">
                                    </tbody>
                                </table>

                                <!--分页-->
                                <nav aria-label="Page navigation">
                                    <ul class="pager">
                                        <li><a href="#">上一页</a></li>
                                        <li><a href="#">下一页</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>




