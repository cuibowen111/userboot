<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<!--导航条-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#aaa">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">后台登录系统</a>
        </div>

        <div class="collapse navbar-collapse" id="aaa">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <p class="navbar-text navbar-right">欢迎：小黑&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </li>
                <li class="nav navbar-nav navbar-right">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-hand-right">退出登录</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!--页面布局-->
<div class="container-fluid">
    <div class="row">
        <!--菜单-->
        <div class="col-sm-2">
            <div class="panel-group" id="accordion">
                <!--手风琴-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="#collapseOne" data-toggle="collapse" data-parent="#accordion">
                                <center>用户管理</center>
                            </a>
                        </h4>
                    </div>

                    <div class="panel-collapse collapse" id="collapseOne">
                        <div class="panel-body">
                            <a href="javascript:void(0)" onclick="$('#myContent').load('jqgridAndUser.jsp')" class="btn btn-danger btn-block" type="submit">
                                用户列表
                            </a>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="#collapseTwo" data-toggle="collapse" data-parent="#accordion">
                                <center>类别管理</center>
                            </a>
                        </h4>
                    </div>

                    <div class="panel-collapse collapse" id="collapseTwo">
                        <div class="panel-body">
                            <button class="btn btn-danger btn-block" type="submit">
                                1111
                            </button>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="#collapseThree" data-toggle="collapse" data-parent="#accordion">
                                <center>图书管理</center>
                            </a>
                        </h4>
                    </div>

                    <div class="panel-collapse collapse" id="collapseThree">
                        <div class="panel-body">
                            <button class="btn btn-danger btn-block" type="submit">
                                1111
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--菜单内容-->
        <div class="col-sm-10" id="myContent">
            <!--巨幕-->
            <div class="jumbotron">
                <h1>Hello, world!</h1>
                <p>...</p>
                <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
            </div>

            <!--可关闭的警告框-->
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert">
                    <span>&times;</span>
                </button>
                <strong>Oh snap! You got an error!</strong>
                <!--页面主体-->
                <p>Change this and that and try again. Duis mollis, est non commodo luctus, nisi erat porttitor ligula,
                    eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>
                <button type="button" class="btn btn-danger">Take this action</button>
                <button type="button" class="btn btn-default">Or do this</button>
            </div>

            <!--面板-->
            <div class="panel panel-default">
                <div class="panel panel-heading">
                    <h3 class="panel-title">系统状态</h3>
                </div>
                <!--进度条-->
                <div class="panel-body">
                    <p>内存使用率</p>
                    <div class="progress">
                        <div class="progress-bar progress-bar-success progress-bar-striped" style="width: 40%"></div>
                    </div>
                    <p>数据库使用率</p>
                    <div class="progress">
                        <div class="progress-bar progress-bar-info progress-bar-striped" style="width:20%"></div>
                    </div>
                    <p>磁盘使用率</p>
                    <div class="progress">
                        <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 60%"></div>
                    </div>
                    <p>CPU使用率</p>
                    <div class="progress">
                        <div class="progress-bar progress-bar-danger progress-bar-striped" style="width: 80%"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
