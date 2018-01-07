<%@ page import="bean.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Content-type", "text/html;charset=UTF-8");
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
                        <li>考试安排</li>
                        <li class="active">考试安排查询</li>
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
                        <li class="active panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-example"><span class="icon fa fa-slack"></span><span class="title">考试安排</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-example" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="exam.jsp">考试安排查询</a></li>
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
                                    <div class="title"><span class="fa fa-search"></span>&nbsp;查询条件</div>
                                </div>
                            </div>

                            <form class="card-body" action="/controller/CourseServlet" method="post">
                                <div class="form-inline" style="margin: 10px">
                                    <div class="form-group" style="margin: 10px">
                                        <label for="ctype" style="margin: 10px">学年学期</label>
                                        <select id="ctype" name="ctype" style="width: 200px">
                                            <option value=""> </option>
                                            <option value="第1">2017-2018学年第1</option>
                                            <option value="第2">2017-2018学年第2</option>
                                            <option value="第3">2017-2018学年第3</option>
                                        </select>
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="task" style="margin: 10px">考试任务</label>
                                        <select id="task" name="dept" style="width: 200px">
                                            <option value=""> </option>
                                            <option value="期中考试">期中考试</option>
                                        </select>
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="part" style="margin: 10px">所属校区</label>
                                        <select id="part" name="dept" style="width: 200px">
                                            <option value=""> </option>
                                            <option value="中心校区">中心校区</option>
                                            <option value="洪家楼校区">洪家楼校区</option>
                                            <option value="趵突泉校区">趵突泉校区</option>
                                            <option value="千佛山校区">千佛山校区</option>
                                            <option value="软件园校区">软件园校区</option>
                                            <option value="兴隆山校区">兴隆山校区</option>
                                            <option value="青岛校区">青岛校区</option>
                                        </select>
                                    </div>
                                    <div class="form-inline" style="margin: 10px">
                                        <div class="form-group" style="margin: 10px">
                                            <label for="cname" style="margin: 10px">课程号</label>
                                            <input type="text" class="form-control" id="cname" name="cname" placeholder="请输入课程号">
                                        </div>
                                        <div class="form-group" style="margin: 10px">
                                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                            <label for="cid" style="margin: 10px">课程名</label>
                                            <input type="text" class="form-control" id="cid" name="cid" placeholder="请输入课程名称">
                                        </div>
                                        <div class="form-group" style="margin: 10px">
                                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                            <label for="cno" style="margin: 10px">课序号</label>
                                            <input type="text" class="form-control" id="cno" name="cno" placeholder="请输入课序号">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-inline" style="margin: 10px">
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <div class="form-group" style="margin: 10px">
                                        <button id="test" type="button" class="btn btn-primary">重置</button>
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <button type="submit" class="btn btn-info">查询课程</button>
                                    </div>
                                </div>
                            </form>
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
                                <div class="title"><span class="fa fa-list"></span>&nbsp;考试列表</div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>考试名称</th>
                                        <th>课程名</th>
                                        <th>课程号</th>
                                        <th>课序号</th>
                                        <th>所属校区</th>
                                        <th>考试地点</th>
                                        <th>考试时间</th>
                                        <th>考试方式</th>
                                        <th>考试备注</th>
                                    </tr>
                                    </thead>
                                    <tr>
                                        <th>1</th>
                                        <td>Web技术</td>
                                        <td>Web技术</td>
                                        <td>sd03030090</td>
                                        <td>100</td>
                                        <td>软件学院	</td>
                                        <td>软件园5区407d</td>
                                        <td>2017-12-06</td>
                                        <td>考试</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>2</th>
                                        <td>操作系统课程设计(双语)</td>
                                        <td>操作系统课程设计(双语)</td>
                                        <td>sd03030161</td>
                                        <td>1</td>
                                        <td>软件学院	</td>
                                        <td>软件园1区405d</td>
                                        <td>2017-12-10</td>
                                        <td>考查</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>3</th>
                                        <td>计算机网络(双语)</td>
                                        <td>计算机网络(双语)</td>
                                        <td>sd03030361</td>
                                        <td>1</td>
                                        <td>软件学院	</td>
                                        <td>软件园5区407d</td>
                                        <td>2017-12-13</td>
                                        <td>考试</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>4</th>
                                        <td>软件工程(双语)</td>
                                        <td>软件工程(双语)</td>
                                        <td>sd03030561</td>
                                        <td>1</td>
                                        <td>软件学院	</td>
                                        <td>软件园5区107d</td>
                                        <td>2017-12-15</td>
                                        <td>考试</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>5</th>
                                        <td>认识实习2</td>
                                        <td>认识实习2</td>
                                        <td>sd03031250</td>
                                        <td>0</td>
                                        <td>软件学院	</td>
                                        <td>软件园5区407d</td>
                                        <td>2017-12-20</td>
                                        <td>考查</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>6</th>
                                        <td>嵌入式系统原理及应用</td>
                                        <td>嵌入式系统原理及应用</td>
                                        <td>sd03031300</td>
                                        <td>0</td>
                                        <td>软件学院	</td>
                                        <td>软件园5区407d</td>
                                        <td>2017-12-23</td>
                                        <td>考试</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>7</th>
                                        <td>移动互联网开发技术</td>
                                        <td>移动互联网开发技术</td>
                                        <td>sd03031310</td>
                                        <td>0</td>
                                        <td>软件学院	</td>
                                        <td>软件园5区408d</td>
                                        <td>2017-12-26</td>
                                        <td>考试</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>8</th>
                                        <td>多核平台上的并行计算</td>
                                        <td>多核平台上的并行计算</td>
                                        <td>sd03031680</td>
                                        <td>100</td>
                                        <td>软件学院	</td>
                                        <td>软件园1区307d</td>
                                        <td>2017-12-30</td>
                                        <td>考试</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>9</th>
                                        <td>西方文化名著导读(人文-尔雅)</td>
                                        <td>西方文化名著导读(人文-尔雅)</td>
                                        <td>sd07510170</td>
                                        <td>600</td>
                                        <td>软件学院	</td>
                                        <td>软件园5区407d</td>
                                        <td>2018-01-05</td>
                                        <td>考试</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>10</th>
                                        <td>形势政策与社会实践(5)</td>
                                        <td>形势政策与社会实践(5)</td>
                                        <td>sd09010050</td>
                                        <td>376</td>
                                        <td>软件学院	</td>
                                        <td>软件园1区201d</td>
                                        <td>2018-01-15</td>
                                        <td>考试</td>
                                        <td></td>
                                    </tr>
                                </table>
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
