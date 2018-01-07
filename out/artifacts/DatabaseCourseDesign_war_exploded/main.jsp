<%@ page import="bean.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Users users = (Users)request.getSession().getAttribute("user");
    String name = "";
    switch (users.getAuthority()) {
        case "student":
            Student student = (Student) request.getSession().getAttribute("student");
            name = student.getSname();
            break;
        case "teacher":
        case "edu":
            Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
            name = teacher.getTname();
            break;
        case "admin":
            name = "admin";
            break;
    }
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
    <link rel="stylesheet" type="text/css" href="lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/themes/flat-blue.css">
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
                        <li class="active">Hello，<%=name%></li>
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
                                <img src="img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
                            </li>
                            <li>
                                <div class="profile-info">
                                    <h4 class="username"><%=name%></h4>
                                    <p><%=users.getId()%></p>
                                    <div class="btn-group margin-bottom-2x" role="group">
                                        <button type="button" class="btn btn-default"><i class="fa fa-user"></i>个人信息</button>
                                        <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i><a href="login.jsp">登出</a></button>
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
                    <%
                        switch (users.getAuthority()) {
                            case "student":
                    %>
                    <%--学生--%>
                        <li class="active">
                            <a href="main.jsp"><span class="icon fa fa-tachometer"></span><span class="title">选课公告</span></a></li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-element"><span class="icon fa fa-desktop"></span><span class="title">个人信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-element" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="student/information/info1.jsp">学籍信息</a></li>
                                        <li><a href="student/information/info2.jsp">联系方式</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-table"><span class="icon fa fa-table"></span><span class="title">教学计划</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-table" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="student/teachingplan/plans.jsp">教学计划查询</a></li>
                                        <li><a href="student/teachingplan/finishes.jsp">教学计划及完成情况</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-form"><span class="icon fa fa-file-text-o"></span><span class="title">选课</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-form" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="student/course/select.jsp">课程查询</a></li>
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
                                        <li><a href="student/score/this_term.jsp">本学期成绩查询</a></li>
                                        <li><a href="student/score/previous.jsp">历年成绩查询</a></li>
                                        <li><a href="student/score/fail.jsp">不及格成绩查询</a></li>
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
                                        <li><a href="student/exam/exam.jsp">考试安排查询</a></li>
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
                                        <li><a href="student/evaluation/evaluation.jsp">进入评估</a></li>
                                        <li><a href="TODO">历史查询</a></li>
                                        <li><a href="TODO">督导评估</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li><a href="license.html"><span class="icon fa fa-thumbs-o-up"></span><span class="title">奖惩查询</span></a>
                        </li>
                    <%
                                break;
                            case "teacher":
                    %>
                    <%--教师--%>
                        <li class="active"><a href="main.jsp"><span class="icon fa fa-tachometer"></span><span class="title">选课公告</span></a></li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-element1"><span class="icon fa fa-desktop"></span><span class="title">个人信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-element1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="/teacher/teacher_info1.jsp">教师信息</a></li>
                                        <li><a href="/teacher/teacher_info2.jsp">联系方式</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-table1"><span class="icon fa fa-table"></span><span class="title">开课课程</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-table1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="/teacher/teaching_course.jsp">查看开课课程</a></li>
                                        <li><a href="/teacher/teaching_student.jsp">查看选课学生</a></li>
                                        <li><a href="TODO">录入成绩</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    <%
                                break;
                            case "edu":
                    %>
                    <%--教务--%>
                        <li class="active"><a href="main.jsp"><span class="icon fa fa-tachometer"></span><span class="title">选课公告</span></a></li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-element2"><span class="icon fa fa-desktop"></span><span class="title">个人信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-element2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="/edu/edu_info1.jsp">教务信息</a></li>
                                        <li><a href="/edu/edu_info2.jsp">联系方式</a></li>
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
                    <%
                                break;
                            case "admin":
                    %>
                    <%--管理员--%>
                        <li class="active"><a href="main.jsp"><span class="icon fa fa-tachometer"></span><span class="title">选课公告</span></a></li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-element3"><span class="icon fa fa-desktop"></span><span class="title">个人信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-element3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="TODO">管理员信息</a></li>
                                        <li><a href="TODO">联系方式</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-table3"><span class="icon fa fa-table"></span><span class="title">管理用户信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-table3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="admin/manage_student.jsp">管理学生信息</a></li>
                                        <li><a href="admin/manage_teacher.jsp">管理教师信息</a></li>
                                        <li><a href="TODO">管理教务信息</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-form3"><span class="icon fa fa-file-text-o"></span><span class="title">管理院系信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-form3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="TODO">管理院系信息</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!-- Dropdown-->
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#component-example3"><span class="icon fa fa-cubes"></span><span class="title">管理选课系统</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="component-example3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="TODO">管理选课系统</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>

                    <%
                                break;
                            default:
                                break;
                        }
                    %>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>
        </div>

        <!-- Main Content -->
        <div class="container-fluid">
            <div class="side-body padding-top">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card red summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-inbox fa-4x"></i>
                                    <div class="content">
                                        <div class="title">50</div>
                                        <div class="sub-title">New Mails</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card yellow summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-comments fa-4x"></i>
                                    <div class="content">
                                        <div class="title">23</div>
                                        <div class="sub-title">New Message</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card green summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-tags fa-4x"></i>
                                    <div class="content">
                                        <div class="title">280</div>
                                        <div class="sub-title">Product View</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card blue summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-share-alt fa-4x"></i>
                                    <div class="content">
                                        <div class="title">16</div>
                                        <div class="sub-title">Share</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row  no-margin-bottom">
                    <div class="col-sm-6 col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="card primary">
                                    <div class="card-jumbotron no-padding">
                                        <canvas id="jumbotron-line-chart" class="chart no-padding"></canvas>
                                    </div>
                                    <div class="card-body half-padding">
                                        <h4 class="float-left no-margin font-weight-300">Profits</h4>
                                        <h2 class="float-right no-margin font-weight-300">$3200</h2>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <div class="thumbnail no-margin-bottom">
                                    <img src="../img/thumbnails/picjumbo.com_IMG_4566.jpg" class="img-responsive">
                                    <div class="caption">
                                        <h3 id="thumbnail-label">Thumbnail label<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3>
                                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="thumbnail no-margin-bottom">
                                    <img src="img/thumbnails/picjumbo.com_IMG_3241.jpg" class="img-responsive">
                                    <div class="caption">
                                        <h3 id="thumbnail-label2">Thumbnail label<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3>
                                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                        <p><a href="#" class="btn btn-success" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <div class="card primary">
                                    <div class="card-jumbotron no-padding">
                                        <canvas id="jumbotron-bar-chart" class="chart no-padding"></canvas>
                                    </div>
                                    <div class="card-body half-padding">
                                        <h4 class="float-left no-margin font-weight-300">Orders</h4>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="card primary">
                                    <div class="card-jumbotron no-padding">
                                        <canvas id="jumbotron-line-2-chart" class="chart no-padding"></canvas>
                                    </div>
                                    <div class="card-body half-padding">
                                        <h4 class="float-left no-margin font-weight-300">Pages view</h4>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-success">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title"><i class="fa fa-comments-o"></i> Last Message</div>
                                </div>
                                <div class="clear-both"></div>
                            </div>
                            <div class="card-body no-padding">
                                <ul class="message-list">
                                    <a href="#">
                                        <li>
                                            <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
                                            <div class="message-block">
                                                <div><span class="username">Tui2Tone</span> <span class="message-datetime">12 min ago</span>
                                                </div>
                                                <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
                                            <div class="message-block">
                                                <div><span class="username">Tui2Tone</span> <span class="message-datetime">15 min ago</span>
                                                </div>
                                                <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
                                            <div class="message-block">
                                                <div><span class="username">Tui2Tone</span> <span class="message-datetime">2 hour ago</span>
                                                </div>
                                                <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <img src="img/profile/profile-1.jpg" class="profile-img pull-left">
                                            <div class="message-block">
                                                <div><span class="username">Tui2Tone</span> <span class="message-datetime">1 day ago</span>
                                                </div>
                                                <div class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</div>
                                            </div>
                                        </li>
                                    </a>
                                    <a href="#" id="message-load-more">
                                        <li class="text-center load-more">
                                            <i class="fa fa-refresh"></i> load more..
                                        </li>
                                    </a>
                                </ul>
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
        <script type="text/javascript" src="lib/js/jquery.min.js"></script>
        <script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="lib/js/Chart.min.js"></script>
        <script type="text/javascript" src="lib/js/bootstrap-switch.min.js"></script>
        <script type="text/javascript" src="lib/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="lib/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="lib/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="lib/js/select2.full.min.js"></script>
        <script type="text/javascript" src="lib/js/ace/ace.js"></script>
        <script type="text/javascript" src="lib/js/ace/mode-html.js"></script>
        <script type="text/javascript" src="lib/js/ace/theme-github.js"></script>
        <!-- Javascript -->
        <script type="text/javascript" src="js/app.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
    </div>
</div>
</body>

</html>
