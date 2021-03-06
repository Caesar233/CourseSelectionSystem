<%@ page import="bean.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Content-type", "text/html;charset=UTF-8");
    Users users = (Users)request.getSession().getAttribute("user");
    String name = "";
    Student student = (Student) request.getSession().getAttribute("student");
    name = student.getSname();

    List<Course> courses = (List<Course>) request.getSession().getAttribute("courses");
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
                        <li>选课</li>
                        <li class="active">课程查询</li>
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
                            <li class="active panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-form"><span class="icon fa fa-file-text-o"></span><span class="title">选课</span></a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-form" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="select.jsp">课程查询</a></li>
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
                                    <div class="title"><span class="fa fa-search"></span>&nbsp;课程查询</div>
                                </div>
                            </div>
                            <form class="card-body" action="/controller/CourseServlet" method="post">
                                <div class="form-inline" style="margin: 10px">
                                    <div class="form-group" style="margin: 10px">
                                        <label for="cname" style="margin: 10px">课程名称</label>
                                        <input type="text" class="form-control" id="cname" name="cname" placeholder="请输入课程名称">
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="cid" style="margin: 10px">课程号</label>
                                        <input type="text" class="form-control" id="cid" name="cid" placeholder="请输入课程号">
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="cno" style="margin: 10px">课序号</label>
                                        <input type="text" class="form-control" id="cno" name="cno" placeholder="请输入课序号">
                                    </div>
                                </div>
                                <div class="form-inline" style="margin: 10px">
                                    <div class="form-group" style="margin: 10px">
                                        <label for="ctype" style="margin: 10px">课程属性</label>
                                        <select id="ctype" name="ctype" style="width: 80px">
                                            <option value=""> </option>
                                            <option value="必修">必修</option>
                                            <option value="限选">限选</option>
                                            <option value="任选">任选</option>
                                        </select>
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="dept" style="margin: 10px">开课学院</label>
                                        <select id="dept" name="dept" style="width: 200px">
                                            <option value=""> </option>
                                            <%--<%--%>
                                                <%--for (Dept dept : depts) {--%>
                                            <%--%>--%>
                                            <%--<option value=<%=dept.getDname()%>><%=dept.getDname()%></option>--%>
                                            <%--<%--%>
                                                <%--}--%>
                                            <%--%>--%>
                                        </select>
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="tname" style="margin: 10px">任课教师</label>
                                        <input type="text" class="form-control" id="tname" name="tname" placeholder="请输入任课教师">
                                    </div>
                                </div>
                                <div class="form-inline" style="margin: 10px">
                                    <div class="form-group" style="margin: 10px">
                                        <label for="location" style="margin: 10px">上课地点</label>
                                        <input type="text" class="form-control" id="location" name="location" placeholder="请输入上课地点">
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
                                <div class="title"><span class="fa fa-list"></span>&nbsp;课程列表</div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>课程号</th>
                                        <th>课程名称</th>
                                        <th>课序号</th>
                                        <th>学分</th>
                                        <th>学时</th>
                                        <th>课程属性</th>
                                        <th>开课学院</th>
                                        <th>任课教师</th>
                                        <th>课容量</th>
                                        <th>上课周次</th>
                                        <th>上课节次</th>
                                        <th>上课地点</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if (courses != null) {
                                            for (int i=0, size=courses.size(); i<size; ++i) {
                                    %>
                                    <tr>
                                        <th scope="row"><%=i+1%></th>
                                        <td><%=courses.get(i).getCid()%></td>
                                        <td><%=courses.get(i).getCname()%></td>
                                        <td><%=courses.get(i).getCno()%></td>
                                        <td><%=courses.get(i).getCredit()%></td>
                                        <td><%=courses.get(i).getPeriod()%></td>
                                        <td><%=courses.get(i).getCtype()%></td>
                                        <td><%=courses.get(i).getDept()%></td>
                                        <td><%=courses.get(i).getTname()%></td>
                                        <td><%=courses.get(i).getCapacity()%></td>
                                        <td><%=courses.get(i).getWeek()%></td>
                                        <td><%=courses.get(i).getCsection()%></td>
                                        <td><%=courses.get(i).getLocation()%></td>
                                        <td><button id="select" onclick="select_course(<%=i%>)">选课</button></td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="selectConfirm" style="display:none; overflow: hidden;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" id="close" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">选课确认</h4>
                </div>
                <div class="modal-body">
                    <p id="confirmText">确定要选择该课吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="cancel">取消</button>
                    <button type="button" class="btn btn-primary" id="confirm">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal info-->
    <div class="modal modal-info" id="success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" id="close1" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">选课成功</h4>
                </div>
                <div class="modal-body">
                    恭喜，选课成功
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" id="confirm1">确定</button>
                </div>
            </div>
        </div>
    </div>
    <%--<!-- Modal primary-->--%>
    <div class="modal modal-primary" id="failure" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" id="close2" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">选课失败</h4>
                    </div>
                    <div class="modal-body">
                        很抱歉，选课失败
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="confirm2">确定</button>
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

        <script>
            var cid, cname, cno, credit, period, ctype, dept, tname,
                capacity, week, csection, clocation;
            var sid = '<%=student.getSid()%>';
            //点击选课，弹框确认选课
            var select_course = function (i) {
                var entity = $("#select").parent().parent().parent().children();
                var tri = entity.eq(i);
                var td0 = tri.find("td").eq(0);
                var td1 = tri.find("td").eq(1);
                var td2 = tri.find("td").eq(2);
                var td3 = tri.find("td").eq(3);
                var td4 = tri.find("td").eq(4);
                var td5 = tri.find("td").eq(5);
                var td6 = tri.find("td").eq(6);
                var td7 = tri.find("td").eq(7);
                var td8 = tri.find("td").eq(8);
                var td9 = tri.find("td").eq(9);
                var td10 = tri.find("td").eq(10);
                var td11 = tri.find("td").eq(11);
                cid = td0.html();
                cname = td1.html();
                cno = td2.html();
                credit = td3.html();
                period = td4.html();
                ctype = td5.html();
                dept = td6.html();
                tname = td7.html();
                capacity = td8.html();
                week = td9.html();
                csection = td10.html();
                clocation = td11.html();

                $("#confirmText").text("确定要选择   "+cname+"（"+cid+"）  课吗");
                $("#selectConfirm").show();
            };
            $("#close").click(function () {
                $("#selectConfirm").hide();
            });
            //确认后发送POST请求，访问数据库选课
            $("#confirm").click(function () {
                $("#selectConfirm").hide();
                $.ajax({
                    type:"POST",
                    url:"/controller/AddCourseServlet",
                    data:{sid:sid, cid:cid, cname:cname, cno:cno, credit:credit, period:period, ctype:ctype,
                    dept:dept, tname:tname, capacity:capacity, week:week, csection:csection, location:clocation},
                    dataType:"json",
                    success:function (result) {
                        if (result.success) {
                            $("#success").show();
                        } else {
                            $("#failure").show();
                        }
                    },
                    error:function (jqXHR) {
                        alert(jqXHR.status);
                    }
                });
            });
            $("#close1").click(function () {
                $("#success").hide();
            });
            $("#close2").click(function () {
                $("#failure").hide();
            });
            $("#cancel").click(function () {
                $("#selectConfirm").hide();
            });
            $("#confirm1").click(function () {
                $("#success").hide();
            });
            $("#confirm2").click(function () {
                $("#failure").hide();
            });
        </script>

        <script>
            <%--页面加载完自动执行--%>
            window.onload = function () {
                $.ajax({
                    type:"GET",
                    url:"/controller/DeptServlet",
                    dataType:"json",
                    success:function (result) {
                        var count = 0;
                        var dept_select = document.getElementById("dept");
                        $.each(result.msg, function () {
                            dept_select.add(new Option(result.msg[count],result.msg[count++]));
                        });
                    },
                    error:function (jqXHR) {
                        alert(jqXHR.status);
                    }
                });
            };
        </script>

    </div>
</div>
</body>

</html>
