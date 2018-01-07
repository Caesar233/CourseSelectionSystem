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
                        <li>成绩</li>
                        <li class="active">历年成绩查询</li>
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
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-table"><span class="icon fa fa-table"></span><span class="title">教学计划</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-table" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="../teachingplan/plans.jsp">教学计划查询</a></li>
                                        <li><a href="../teachingplan/finishes.jsp">教学计划及完成情况</a></li>
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
                        <li class="active panel panel-default dropdown"><a data-toggle="collapse" href="#component-example"><span class="icon fa fa-cubes"></span><span class="title">成绩</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="component-example" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="this_term.jsp">本学期成绩查询</a></li>
                                        <li><a href="previous.jsp">历年成绩查询</a></li>
                                        <li><a href="fail.jsp">不及格成绩查询</a></li>
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
                                    <div class="title"><span class="fa fa-list"></span>&nbsp;历年成绩列表</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                            <tr>
                                                <th>学年学期</th>
                                                <th>课程号</th>
                                                <th>课程名</th>
                                                <th>课序号</th>
                                                <th>学分</th>
                                                <th>考试时间</th>
                                                <th>总成绩</th>
                                                <th>五分制绩点</th>
                                                <th>五分制等级</th>
                                                <th>课程属性</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <tr>
                                                <td>2016-2017-2</td>
                                                <td>sd02810150</td>
                                                <td>马克思主义原理</td>
                                                <td>335</td>
                                                <td>3</td>
                                                <td>20170626</td>
                                                <td>73.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-2</td>
                                                <td>sd03030410</td>
                                                <td>计算机组织与结构课程设计</td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>20170626</td>
                                                <td>良好</td>
                                                <td>3.5</td>
                                                <td>B</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-2</td>
                                                <td>sd03030470</td>
                                                <td>面向对象开发技术</td>
                                                <td>1</td>
                                                <td>3.5</td>
                                                <td>20170626</td>
                                                <td>79.0</td>
                                                <td>3.8</td>
                                                <td>B+</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-2</td>
                                                <td>sd03030731</td>
                                                <td>数据结构课程设计(双语)</td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>20170626</td>
                                                <td>良好</td>
                                                <td>3.5</td>
                                                <td>B</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-2</td>
                                                <td>sd03030751</td>
                                                <td>数据库系统(双语)</td>
                                                <td>1</td>
                                                <td>4.5</td>
                                                <td>20170626</td>
                                                <td>88.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-2</td>
                                                <td>sd07510310</td>
                                                <td>中国古代礼仪文明(国学-尔雅)</td>
                                                <td>600</td>
                                                <td>2</td>
                                                <td>20170626</td>
                                                <td>99.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>任选</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-2</td>
                                                <td>sd09010040</td>
                                                <td>形势政策与社会实践(4)</td>
                                                <td>357</td>
                                                <td>0.5</td>
                                                <td>20170626</td>
                                                <td>95.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd01412440</td>
                                                <td>中国生物资源(通选)</td>
                                                <td>900</td>
                                                <td>1</td>
                                                <td>20170102</td>
                                                <td>合格</td>
                                                <td>3.5</td>
                                                <td>B</td>
                                                <td>任选</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd01412680</td>
                                                <td>生物燃料-人类未来能源的希望(通选)</td>
                                                <td>900</td>
                                                <td>1</td>
                                                <td>20170102</td>
                                                <td>合格</td>
                                                <td>3.5</td>
                                                <td>B</td>
                                                <td>任选</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd02910650</td>
                                                <td>体育(3)</td>
                                                <td>303</td>
                                                <td>1</td>
                                                <td>20170102</td>
                                                <td>92.0</td>
                                                <td>4.5</td>
                                                <td>A</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd03020250</td>
                                                <td>概率与统计</td>
                                                <td>4</td>
                                                <td>3</td>
                                                <td>20170102</td>
                                                <td>73.0</td>
                                                <td>3.8</td>
                                                <td>B+</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd03030400</td>
                                                <td>计算机组织与结构</td>
                                                <td>1</td>
                                                <td>4.5</td>
                                                <td>20170102</td>
                                                <td>85.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd03030451</td>
                                                <td>离散数学(双语2)</td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>20170102</td>
                                                <td>63.0</td>
                                                <td>3.8</td>
                                                <td>B+</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd03031191</td>
                                                <td>数据结构（双语）</td>
                                                <td>1</td>
                                                <td>5</td>
                                                <td>20170102</td>
                                                <td>73.0</td>
                                                <td>3.8</td>
                                                <td>B+</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd03031240</td>
                                                <td>高级程序设计语言项目开发实训</td>
                                                <td>0</td>
                                                <td>2</td>
                                                <td>20170102</td>
                                                <td>中等</td>
                                                <td>2.5</td>
                                                <td>C</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd03031490</td>
                                                <td>DB2认证</td>
                                                <td>0</td>
                                                <td>1</td>
                                                <td>20170102</td>
                                                <td>92.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd03031510</td>
                                                <td>IBM XML认证</td>
                                                <td>0</td>
                                                <td>1</td>
                                                <td>20170102</td>
                                                <td>67.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>sd07510090</td>
                                                <td>美学原理(艺术-尔雅)</td>
                                                <td>600</td>
                                                <td>2</td>
                                                <td>20170102</td>
                                                <td>98.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>任选</td>
                                            </tr>

                                            <tr>
                                                <td>2016-2017-1</td>
                                                <td>31016000</td>
                                                <td>国家英语四级</td>
                                                <td>820</td>
                                                <td>0</td>
                                                <td>20161212</td>
                                                <td>486.0</td>
                                                <td></td>
                                                <td></td>
                                                <td>任选</td>
                                            </tr>
                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>0311801310</td>
                                                <td>国家英语四级(通选)</td>
                                                <td>820</td>
                                                <td>0</td>
                                                <td>20160630</td>
                                                <td>419.0</td>
                                                <td></td>
                                                <td></td>
                                                <td>任选</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd00920130</td>
                                                <td>高等数学(2)</td>
                                                <td>327</td>
                                                <td>5</td>
                                                <td>20160627</td>
                                                <td>69.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd02715310</td>
                                                <td>营销策划与实践(社科)</td>
                                                <td>604</td>
                                                <td>2</td>
                                                <td>20160627</td>
                                                <td>88.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>任选</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd02810250</td>
                                                <td>中国近现代史纲要</td>
                                                <td>321</td>
                                                <td>1.5</td>
                                                <td>20160627</td>
                                                <td>82.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>
                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd02910370</td>
                                                <td>轮滑(通选)</td>
                                                <td>900</td>
                                                <td>1</td>
                                                <td>20160627</td>
                                                <td>合格</td>
                                                <td>3.5</td>
                                                <td>B</td>
                                                <td>任选</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd02910640</td>
                                                <td>体育(2)</td>
                                                <td>385</td>
                                                <td>1</td>
                                                <td>20160627</td>
                                                <td>91.0</td>
                                                <td>4.5</td>
                                                <td>A</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd03020980</td>
                                                <td>线性代数</td>
                                                <td>1</td>
                                                <td>3</td>
                                                <td>20160627</td>
                                                <td>83.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd03021140</td>
                                                <td>认识实习1</td>
                                                <td>0</td>
                                                <td>1</td>
                                                <td>20160627</td>
                                                <td>良好</td>
                                                <td>3.5</td>
                                                <td>B</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd03030271</td>
                                                <td>高级程序设计语言课程设计(双语)</td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>20160627</td>
                                                <td>93.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd03030441</td>
                                                <td>离散数学(双语1)</td>
                                                <td>1</td>
                                                <td>3</td>
                                                <td>20160627</td>
                                                <td>83.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd03110040</td>
                                                <td>大学综合英语(2)</td>
                                                <td>335</td>
                                                <td>4</td>
                                                <td>20160627</td>
                                                <td>74.0</td>
                                                <td>3.5</td>
                                                <td>B</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd06910010</td>
                                                <td>军事理论</td>
                                                <td>315</td>
                                                <td>2</td>
                                                <td>20160627</td>
                                                <td>92.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd07510080</td>
                                                <td>现代大学与科学(创新-尔雅)</td>
                                                <td>600</td>
                                                <td>2</td>
                                                <td>20160627</td>
                                                <td>100.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>任选</td>
                                            </tr>
                                            <tr>
                                                <td>2015-2016-2</td>
                                                <td>sd09010020</td>
                                                <td>形势政策与社会实践(2)</td>
                                                <td>326</td>
                                                <td>0.5</td>
                                                <td>20160627</td>
                                                <td>95.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-1</td>
                                                <td>sd00920120</td>
                                                <td>高等数学(1)</td>
                                                <td>309</td>
                                                <td>5</td>
                                                <td>20160111</td>
                                                <td>80.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-1/td>
                                                <td>sd00920120</td>
                                                <td>高等数学(1)</td>
                                                <td>309</td>
                                                <td>5</td>
                                                <td>20160111</td>
                                                <td>80.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-1</td>
                                                <td>sd02810050</td>
                                                <td>道德与法律</td>
                                                <td>312</td>
                                                <td>3</td>
                                                <td>20160111</td>
                                                <td>84.0</td>
                                                <td>4.5</td>
                                                <td>A</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-1</td>
                                                <td>sd02910630</td>
                                                <td>体育(1)</td>
                                                <td>499</td>
                                                <td>1</td>
                                                <td>20160111</td>
                                                <td>88.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>必修</td>
                                            </tr>


                                            <tr>
                                                <td>2015-2016-1</td>
                                                <td>sd03010371</td>
                                                <td>计算机引论(双语)</td>
                                                <td>1</td>
                                                <td>2</td>
                                                <td>20160111</td>
                                                <td>82.0</td>
                                                <td>4.2</td>
                                                <td>A-</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-1/td>
                                                <td>sd03031181</td>
                                                <td>高级程序设计语言（双语）</td>
                                                <td>1</td>
                                                <td>4.5</td>
                                                <td>20160111</td>
                                                <td>78.0</td>
                                                <td>4.5</td>
                                                <td>A</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-1</td>
                                                <td>sd03110030</td>
                                                <td>大学综合英语(1)</td>
                                                <td>335</td>
                                                <td>4</td>
                                                <td>20160111</td>
                                                <td>76.0</td>
                                                <td>3.5</td>
                                                <td>B</td>
                                                <td>必修</td>
                                            </tr>

                                            <tr>
                                                <td>2015-2016-1</td>
                                                <td>sd06910020</td>
                                                <td>军训</td>
                                                <td>330</td>
                                                <td>0</td>
                                                <td>20160111</td>
                                                <td>95.0</td>
                                                <td>5</td>
                                                <td>A+</td>
                                                <td>必修</td>
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
