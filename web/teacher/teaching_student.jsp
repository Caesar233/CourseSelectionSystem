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
                        <li>开课课程</li>
                        <li class="active">查看选课学生</li>
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
                        <%--教师--%>
                        <li><a href="../main.jsp"><span class="icon fa fa-tachometer"></span><span class="title">选课公告</span></a></li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-element1"><span class="icon fa fa-desktop"></span><span class="title">个人信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-element1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="teacher_info1.jsp">教师信息</a></li>
                                        <li><a href="teacher_info2.jsp">联系方式</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="active panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-table1"><span class="icon fa fa-table"></span><span class="title">开课课程</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-table1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="teaching_course.jsp">查看开课课程</a></li>
                                        <li><a href="teaching_student.jsp">查看选课学生</a></li>
                                        <li><a href="TODO">录入成绩</a></li>
                                    </ul>
                                </div>
                            </div>
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
                                    <div class="title"><span class="fa fa-search"></span>&nbsp;学生查询</div>
                                </div>
                            </div>
                            <form class="card-body" method="post">
                                <div class="form-inline" style="margin: 10px">
                                    <div class="form-group" style="margin: 10px">
                                        <label for="cname" style="margin: 10px">课程名称</label>
                                        <input type="text" class="form-control" id="cname" name="cname" placeholder="请输入课程名称">
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="cid" style="margin: 10px">课&nbsp;&nbsp;程&nbsp;&nbsp;号</label>
                                        <input type="text" class="form-control" id="cid" name="cid" placeholder="请输入课程号">
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="cno" style="margin: 10px">课&nbsp;&nbsp;序&nbsp;&nbsp;号</label>
                                        <input type="text" class="form-control" id="cno" name="cno" placeholder="请输入课序号">
                                    </div>
                                </div>
                                <div class="form-inline" style="margin: 10px">
                                    <div class="form-group" style="margin: 10px">
                                        <label for="cname" style="margin: 10px">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
                                        <input type="text" class="form-control" id="sid" name="cname" placeholder="请输入学号">
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="cid" style="margin: 10px">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
                                        <input type="text" class="form-control" id="sname" name="cid" placeholder="请输入姓名">
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="cno" style="margin: 10px">上课年级</label>
                                        <input type="text" class="form-control" id="grade" name="cno" placeholder="请输入上课年级">
                                    </div>
                                </div>
                                <div class="form-inline" style="margin: 10px">
                                    <div class="form-group" style="margin: 10px">
                                        <label for="tname" style="margin: 10px">上课班级</label>
                                        <input type="text" class="form-control" id="tname" name="tname" placeholder="请输入上课班级">
                                    </div>
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
                                <div class="title"><span class="fa fa-list"></span>&nbsp;学生列表</div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>学号</th>
                                        <th>姓名</th>
                                        <th>学院</th>
                                        <th>专业</th>
                                        <th>年级</th>
                                        <th>班级</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>201500301001</td>
                                        <td>陈皓丹</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>201500301009</td>
                                        <td>冼啟棉</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>201500301016</td>
                                        <td>陈冠恒</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>201500301025</td>
                                        <td>林进英</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>201500301038</td>
                                        <td>刘泽华</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">6</th>
                                        <td>201500301040</td>
                                        <td>黄威琛</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">7</th>
                                        <td>201500301052</td>
                                        <td>王兆盟</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">8</th>
                                        <td>201500301075</td>
                                        <td>罗伟</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">9</th>
                                        <td>201500301077</td>
                                        <td>陈怡</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">10</th>
                                        <td>201500301185</td>
                                        <td>赵硕</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">11</th>
                                        <td>201500301111</td>
                                        <td>刘晓川</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">12</th>
                                        <td>201500301112</td>
                                        <td>邵长旭</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">13</th>
                                        <td>201500301120</td>
                                        <td>龚树志</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">14</th>
                                        <td>201500301135</td>
                                        <td>梁文珂</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">15</th>
                                        <td>201500301140</td>
                                        <td>宋丽珺</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">16</th>
                                        <td>201500301158</td>
                                        <td>李嘉伟</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">17</th>
                                        <td>201500301159</td>
                                        <td>槐敏涵</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">18</th>
                                        <td>201500301171</td>
                                        <td>王子悦</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">19</th>
                                        <td>201500301182</td>
                                        <td>邵明山</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">20</th>
                                        <td>201500301190</td>
                                        <td>李云飞</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">21</th>
                                        <td>201500301200</td>
                                        <td>潘明鑫</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">22</th>
                                        <td>201500301202</td>
                                        <td>崔光泰</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">23</th>
                                        <td>201500301204</td>
                                        <td>顾雪珊</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">24</th>
                                        <td>201500301212</td>
                                        <td>刘犇</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">25</th>
                                        <td>201500301230</td>
                                        <td>常秀娟</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">26</th>
                                        <td>201500301238</td>
                                        <td>朱志鑫</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">27</th>
                                        <td>201500301256</td>
                                        <td>王广臣</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">28</th>
                                        <td>201500301260</td>
                                        <td>张帆</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">29</th>
                                        <td>201500301274</td>
                                        <td>胡昊</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">30</th>
                                        <td>201500301277</td>
                                        <td>董芷丹</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">31</th>
                                        <td>201500301281</td>
                                        <td>赵亮</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">32</th>
                                        <td>201500301283</td>
                                        <td>王拓</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">33</th>
                                        <td>201500301305</td>
                                        <td>刘波</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">34</th>
                                        <td>201500301322</td>
                                        <td>杨雨晨</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">35</th>
                                        <td>201500301332</td>
                                        <td>彭祚源</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">36</th>
                                        <td>201500301166</td>
                                        <td>梁惠欣</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">37</th>
                                        <td>201501301340</td>
                                        <td>赵彦博</td>
                                        <td>软件学院</td>
                                        <td>软件工程</td>
                                        <td>2015</td>
                                        <td>4</td>
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
</body>

</html>
