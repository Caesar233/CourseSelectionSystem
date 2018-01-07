<%@ page import="bean.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Content-type", "text/html;charset=UTF-8");
    Users users = (Users)request.getSession().getAttribute("user");
    String name = "";
    Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
    name = teacher.getTname();

%>

<!DOCTYPE html>
<html>

<head>
    <title>学生选课管理信息系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="../lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="my.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/themes/flat-blue.css">
</head>

<body class="flat-blue">
<div class="app-container">
    <div class="row content-container">
        <nav class="navbar navbar-default navbar-fixed-top navbar-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-expand-toggle">
                        <i class="fa fa-bars icon"></i>
                    </button>
                    <ol class="breadcrumb navbar-breadcrumb">
                        <li>个人信息</li>
                        <li class="active">联系方式</li>
                    </ol>
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-th icon"></i>
                    </button>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-times icon"></i>
                    </button>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-comments-o"></i></a>
                        <ul class="dropdown-menu animated fadeInDown">
                            <li class="title">
                                Notification <span class="badge pull-right">0</span>
                            </li>
                            <li class="message">
                                No new notification
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown danger">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-star-half-o"></i> 4</a>
                        <ul class="dropdown-menu danger  animated fadeInDown">
                            <li class="title">
                                Notification <span class="badge pull-right">4</span>
                            </li>
                            <li>
                                <ul class="list-group notifications">
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge">1</span> <i class="fa fa-exclamation-circle icon"></i> new registration
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge success">1</span> <i class="fa fa-check icon"></i> new orders
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge danger">2</span> <i class="fa fa-comments icon"></i> customers messages
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item message">
                                            view all
                                        </li>
                                    </a>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown profile">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=name%><span class="caret"></span></a>
                        <ul class="dropdown-menu animated fadeInDown">
                            <li class="profile-img">
                                <img src="../img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
                            </li>
                            <li>
                                <div class="profile-info">
                                    <h4 class="username"><%=name%></h4>
                                    <p><%=users.getId()%></p>
                                    <div class="btn-group margin-bottom-2x" role="group">
                                        <button type="button" class="btn btn-default"><i class="fa fa-user"></i>个人信息</button>
                                        <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i><a href="../login.jsp">登出</a></button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="side-menu sidebar-inverse">
            <nav class="navbar navbar-default" role="navigation">
                <div class="side-menu-container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">
                            <div class="icon fa fa-paper-plane"></div>
                            <div class="title">学生选课管理信息系统</div>
                        </a>
                        <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav">
                        <%--教务--%>
                        <li><a href="../main.jsp"><span class="icon fa fa-tachometer"></span><span class="title">选课公告</span></a></li>
                        <li class="active panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-element2"><span class="icon fa fa-desktop"></span><span class="title">个人信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-element2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="edu_info1.jsp">教务信息</a></li>
                                        <li><a href="edu_info2.jsp">联系方式</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-table2"><span class="icon fa fa-table"></span><span class="title">教学计划</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-table2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="TODO">查看教学计划</a></li>
                                        <li><a href="TODO">更改教学计划</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-form2"><span class="icon fa fa-file-text-o"></span><span class="title">课程信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-form2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="TODO">查看课程信息</a></li>
                                        <li><a href="TODO">更改课程信息</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!-- Dropdown-->
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#component-example2"><span class="icon fa fa-cubes"></span><span class="title">成绩</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="component-example2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="TODO">查看成绩</a></li>
                                        <li><a href="TODO">更改成绩</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!-- Dropdown-->
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-example2"><span class="icon fa fa-slack"></span><span class="title">奖惩</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-example2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="TODO">查看奖惩</a></li>
                                        <li><a href="TODO">更改奖惩</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!-- Dropdown-->
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-icon2"><span class="icon fa fa-archive"></span><span class="title">考试安排</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-icon2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="TODO">查看考试安排</a></li>
                                        <li><a href="TODO">更改考试安排</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>
        </div>

        <div class="container-fluid">
            <div class="side-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title"><span class="fa fa-list"></span>&nbsp;维护个人信息</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div class="table-responsive">
                                        <table width="100%" class="myCss">
                                            <tbody>
                                            <tr>
                                                <td colspan="2" rowspan="7" align="center"></td>
                                                <td align="right" width="16.6%">教师编号：</td>
                                                <td align="left" width="16.6%">91608</td>
                                                <td align="right" width="16.6%">姓名：</td>
                                                <td align="left" width="16.6%">孙玮茄</td>
                                            </tr>
                                            <tr>

                                                <td align="right">姓名简称：</td>
                                                <td align="left"></td>
                                                <td align="right">性别：</td>
                                                <td align="left">女</td>
                                            </tr>
                                            <tr>

                                                <td align="right">出生日期：</td>
                                                <td align="left"></td>
                                                <td align="right">民族：</td>
                                                <td align="left">汉</td>
                                            </tr>
                                            <tr>

                                                <td align="right">年龄：</td>
                                                <td align="left"></td>
                                                <td align="right">政治面貌：</td>
                                                <td align="left">党员</td>
                                            </tr>
                                            <tr>

                                                <td align="right">籍贯：</td>
                                                <td align="left"></td>
                                                <td align="right">联系电话：</td>
                                                <td align="left"></td>
                                            </tr>
                                            <tr>

                                                <td align="right">院系：</td>
                                                <td align="left">软件学院</td>
                                                <td align="right">外语语种：</td>
                                                <td align="left">外语</td>
                                            </tr>
                                            <tr>

                                                <td align="right">邮编：</td>
                                                <td align="left">250101</td>
                                                <td align="right"></td>
                                                <td align="left"></td>
                                            </tr>
                                        </table>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="app-footer">
            <div class="wrapper">
                <span class="pull-right">回到顶部 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2017 Copyright. 邵明山
            </div>
        </footer>
        <script type="text/javascript" src="../lib/js/jquery.min.js"></script>
        <script type="text/javascript" src="../lib/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../lib/js/Chart.min.js"></script>
        <script type="text/javascript" src="../lib/js/bootstrap-switch.min.js"></script>

        <script type="text/javascript" src="../lib/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="../lib/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../lib/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="../lib/js/select2.full.min.js"></script>
        <script type="text/javascript" src="../lib/js/ace/ace.js"></script>
        <script type="text/javascript" src="../lib/js/ace/mode-html.js"></script>
        <script type="text/javascript" src="../lib/js/ace/theme-github.js"></script>
        <!-- Javascript -->
        <script type="text/javascript" src="../js/app.js"></script>
        <script type="text/javascript" src="../js/card.js"></script>
    </div>
</div>
</body>

</html>
