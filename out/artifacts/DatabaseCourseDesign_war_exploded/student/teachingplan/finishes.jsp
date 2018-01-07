<%@ page import="bean.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Users users = (Users)request.getSession().getAttribute("user");
    String name = "";
    Student student = (Student) request.getSession().getAttribute("student");
    name = student.getSname();
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
    <link rel="stylesheet" type="text/css" href="../../lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/themes/flat-blue.css">
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
                        <li>教学计划</li>
                        <li class="active">教学计划及完成情况</li>
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
                                        <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i><a href="../../login.jsp">登出</a></button>
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
                        <%--学生--%>
                            <li>
                                <a href="../../main.jsp"><span class="icon fa fa-tachometer"></span><span class="title">选课公告</span></a></li>
                            <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-element"><span class="icon fa fa-desktop"></span><span class="title">个人信息</span></a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../information/info1.jsp">学籍信息</a></li>
                                            <li><a href="../information/info2.jsp">联系方式</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="active panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-table"><span class="icon fa fa-table"></span><span class="title">教学计划</span></a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-table" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="plans.jsp">教学计划查询</a></li>
                                            <li><a href="finishes.jsp">教学计划及完成情况</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-form"><span class="icon fa fa-file-text-o"></span><span class="title">选课</span></a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-form" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../course/select.jsp">课程查询</a></li>
                                            <li><a href="/controller/ScheduleServlet">本学期课表</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#component-example"><span class="icon fa fa-cubes"></span><span class="title">成绩</span></a>
                                <!-- Dropdown level 1 -->
                                <div id="component-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../score/this_term.jsp">本学期成绩查询</a></li>
                                            <li><a href="../score/previous.jsp">历年成绩查询</a></li>
                                            <li><a href="../score/fail.jsp">不及格成绩查询</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-example"><span class="icon fa fa-slack"></span><span class="title">考试安排</span></a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../exam/exam.jsp">考试安排查询</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-icon"><span class="icon fa fa-archive"></span><span class="title">教学评估</span></a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-icon" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../evaluation/evaluation.jsp">进入评估</a></li>
                                            <li><a href="icons/font-awesome.html">历史查询</a></li>
                                            <li><a href="icons/font-awesome.html">督导评估</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li><a href="license.html"><span class="icon fa fa-thumbs-o-up"></span><span class="title">奖惩查询</span></a>
                            </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>
        </div>

        <!-- Main Content -->

        <div class="container-fluid">
            <div class="side-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title"><span class="fa fa-calendar"></span>&nbsp;基本情况</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                            <tr>
                                                <th>所属年级</th>
                                                <th>所属学院</th>
                                                <th>所属专业</th>
                                            </tr>
                                            </thead>
                                            <tbody id="schedule1">
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">2015</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">软件学院</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">软件工程</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="container-fluid">
            <div class="side-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title"><span class="fa fa-calendar"></span>&nbsp;教学计划总体完成情况</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                            <tr>
                                                <th></th>
                                                <th>学分</th>
                                                <th>必修学分</th>
                                                <th>限选学分</th>
                                                <th>任选学分</th>
                                                <th>通识核心课学分</th>
                                                <th>选修课组数</th>
                                            </tr>
                                            </thead>
                                            <tbody id="schedule">
                                            <tr>
                                                <th class="text-nowrap" scope="row">毕业要求</th>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <th class="text-nowrap" scope="row">完成情况</th>
                                                <td style="word-break:break-all;word-wrap:break-word;">89</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">78</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">11</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">8</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">23</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="side-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title"><span class="fa fa-list"></span>&nbsp;教学课程完成情况</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                            <tr>
                                                <th>序号</th>
                                                <th>开课学年</th>
                                                <th>开课学期</th>
                                                <th>课程号</th>
                                                <th>课程名称</th>
                                                <th>学时</th>
                                                <th>学分</th>
                                                <th>课程属性</th>
                                                <th>课程类别</th>
                                                <th>考试类型</th>
                                                <th>总成绩</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd00920120</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">高等数学1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">80.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">5.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">学科基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">90.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd02810050</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">道德与法律</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">58.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">95.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd02910630</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">体育（1）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">32.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">95.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">4</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd02910371</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">计算机引论（双语）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">32.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">95.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03031181</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">高级程序设计语言（双语）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">88.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">4.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">92.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">6</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd06910020</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">军训</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">0.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">95.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">7</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd09010010</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">形势政策与社会实践（1）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">16.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">0.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">8</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd00900130</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">高等数学（2）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">80.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">5.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">学科基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">99.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">9</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd02810250</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">中国近现代史纲要</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">29.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">88.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">10</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd02910640</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">体育（2）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">32.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">95.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">11</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03020980</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">线性代数</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">48.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">公共基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">88.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">12</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03021140</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">认识实习1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">优秀</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">13</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030271</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">高级程序设计语言课程设计（双语）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">48.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">100.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">14</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030441</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">离散数学（双语1）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">48.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">91.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">15</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd06910010</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">军事理论</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">32.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">98.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">16</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd09010020</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">形势政策与社会实践（2）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">16.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">0.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">96.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">17</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd02910650</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">体育（3）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">32.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">90.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">18</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03020250</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">概率与统计</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">48.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">学科基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">88.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">19</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030400</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">计算机组织与结构</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">80.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">4.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">85.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">20</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030451</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">离散数学（双语2）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">32.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">94.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">21</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03031191</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">数据结构（双语2）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">32.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">92.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">22</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03031240</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">高级程序设计语言项目开发实训</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">良好</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">23</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd09010030</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">形势政策与社会实践（3）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">16.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">0.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">24</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd028010150</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">马克思主义原理</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">58.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">89.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">25</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd02910660</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">体育（4）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">32.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">95.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">26</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030151</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">操作系统（双语）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">80.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">4.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">90.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">27</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030410</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">计算机组织与结构课程设计</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">48.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">优秀</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">28</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030470</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">面向对象开发技术</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">64.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">88.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">29</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030731</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">数据结构课程设计（双语）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">48.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">90.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">30</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030751</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">数据库系统（双语）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">80.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">4.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">95.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">31</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd09010040</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">形势政策与社会实践（4）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">16.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">0.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">96.0</td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">32</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030161</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">操作系统课程设计（双语）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">33</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030361</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">计算机网络（双语）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">80.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">4.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业基础课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">34</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030561</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">软件工程（双语）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">64.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">35</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03030741</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">数据库课程设计（双语）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">36</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03031250</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">认识实习2</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">37</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">秋</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd09010050</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">形势政策与社会实践（5）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">16.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">0.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">38</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd02810360</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">毛泽东思想和中国特色社会主义理论体系概论</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">96.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">6.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">39</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03031220</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">软件测试技术</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">48.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.5</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">40</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03031230</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">软件项目管理</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">32.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">41</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd03031250</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">项目实训</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">4.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">4.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">专业必修课</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            <tr>
                                                <td style="word-break:break-all;word-wrap:break-word;">42</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">春</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">sd09010120</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">形势与政策（6）</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">16.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">必修</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">通识必修课程</td>
                                                <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                                <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
        <div class="side-body">
            <div class="row">
                <div class="col-xs-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">
                                <div class="title"><span class="fa fa-list"></span>&nbsp;任选课完成情况</div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>课程号</th>
                                            <th>课程名</th>
                                            <th>学分</th>
                                            <th>课程类别</th>
                                            <th>考试类型</th>
                                            <th>总成绩</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td style="word-break:break-all;word-wrap:break-word;">1</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">0311801310</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">国家英语四级（通选）</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">0.0</td>
                                            <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            <td style="word-break:break-all;word-wrap:break-word;">710.0</td>
                                        </tr>
                                        <tr>
                                            <td style="word-break:break-all;word-wrap:break-word;">2</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">sd01412440</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">中国生物资源（通选）</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                            <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">合格</td>
                                        </tr>
                                        <tr>
                                            <td style="word-break:break-all;word-wrap:break-word;">3</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">sd01412440</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">生物燃料-人类未来能源的希望(通选)</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                            <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">合格</td>
                                        </tr>
                                        <tr>
                                            <td style="word-break:break-all;word-wrap:break-word;">4</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">sd01412440</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">管理学与领导艺术(社科)</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                            <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">90.0</td>
                                        </tr>
                                        <tr>
                                            <td style="word-break:break-all;word-wrap:break-word;">5</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">sd01412440</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">营销策划与实践(社科)</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                            <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">90.0</td>
                                        </tr>
                                        <tr>
                                            <td style="word-break:break-all;word-wrap:break-word;">6</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">sd01412440</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">看电影学英语(通选)</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">1.0</td>
                                            <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            <td style="word-break:break-all;word-wrap:break-word;">考查</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">合格</td>
                                        </tr>
                                        <tr>
                                            <td style="word-break:break-all;word-wrap:break-word;">7</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">sd01412440</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">先秦君子风范(国学-尔雅)</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                            <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">100.0</td>
                                        </tr>
                                        <tr>
                                            <td style="word-break:break-all;word-wrap:break-word;">8</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">sd01412440</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">现代大学与科学(创新-尔雅)</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">2.0</td>
                                            <td style="word-break:break-all;word-wrap:break-word;"></td>
                                            <td style="word-break:break-all;word-wrap:break-word;">考试</td>
                                            <td style="word-break:break-all;word-wrap:break-word;">100.0</td>
                                        </tr>
                                        </tbody>
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
    <div>
        <!-- Javascript Libs -->
        <script type="text/javascript" src="../../lib/js/jquery.min.js"></script>
        <script type="text/javascript" src="../../lib/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../../lib/js/Chart.min.js"></script>
        <script type="text/javascript" src="../../lib/js/bootstrap-switch.min.js"></script>

        <script type="text/javascript" src="../../lib/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="../../lib/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../../lib/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="../../lib/js/select2.full.min.js"></script>
        <script type="text/javascript" src="../../lib/js/ace/ace.js"></script>
        <script type="text/javascript" src="../../lib/js/ace/mode-html.js"></script>
        <script type="text/javascript" src="../../lib/js/ace/theme-github.js"></script>
        <!-- Javascript -->
        <script type="text/javascript" src="../../js/app.js"></script>
        <script type="text/javascript" src="../../js/card.js"></script>

    </div>
</div>
</body>

</html>
