<%@ page import="bean.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Content-type", "text/html;charset=UTF-8");
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
    List<Student> students = (List<Student>) request.getSession().getAttribute("students");
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
                        <li>管理</li>
                        <li class="active">管理学生信息</li>
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
                                        <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i><a href="../../src/view/login.jsp">登出</a></button>
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
                        <%--管理员--%>
                        <li><a href="../../src/view/main.jsp"><span class="icon fa fa-tachometer"></span><span class="title">选课公告</span></a></li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-element3"><span class="icon fa fa-desktop"></span><span class="title">个人信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-element3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="ui-kits/theming.html">学籍信息</a></li>
                                        <li><a href="ui-kits/grid.html">联系方式</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="active panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-table3"><span class="icon fa fa-table"></span><span class="title">管理用户信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-table3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="manage_student.jsp">管理学生信息</a></li>
                                        <li><a href="manage_teacher.jsp">管理教师信息</a></li>
                                        <li><a href="table/datatable.html">管理教务信息</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown"><a data-toggle="collapse" href="#dropdown-form3"><span class="icon fa fa-file-text-o"></span><span class="title">管理院系信息</span></a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-form3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="form/ui-kits.html">管理院系信息</a></li>
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
                                        <li><a href="components/pricing-table.html">管理选课系统</a></li>
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
                                    <div class="title"><span class="fa fa-search"></span>学生查询</div>
                                </div>
                            </div>
                            <form class="card-body" action="/controller/StudentServlet" method="post">
                                <div class="form-inline" style="margin: 10px">
                                    <div class="form-group" style="margin: 10px">
                                        <label for="sid" style="margin: 10px">学号</label>
                                        <input type="text" class="form-control" id="sid" name="sid" placeholder="请输入学号">
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="sname" style="margin: 10px">姓名</label>
                                        <input type="text" class="form-control" id="sname" name="sname" placeholder="请输入姓名">
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="id" style="margin: 10px">身份证号</label>
                                        <input type="text" class="form-control" id="id" name="id" placeholder="请输入身份证号">
                                    </div>
                                </div>
                                <div class="form-inline" style="margin: 10px">
                                    <div class="form-group" style="margin: 10px">
                                        <label for="age" style="margin: 10px">年龄</label>
                                        <input type="text" class="form-control" id="age" name="age" placeholder="请输入年龄">
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="sex" style="margin: 10px">性别</label>
                                        <select id="sex" name="sex" style="width: 50px">
                                            <option value=""> </option>
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="grade" style="margin: 10px">年级</label>
                                        <input type="text" class="form-control" id="grade" name="grade" placeholder="请输入年级">
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <label for="classes" style="margin: 10px">班级</label>
                                        <input type="text" class="form-control" id="classes" name="classes" placeholder="请输入班级">
                                    </div>
                                </div>
                                <div class="form-inline" style="margin: 10px">
                                    <div class="form-group" style="margin: 10px">
                                        <label for="dept" style="margin: 10px">院系</label>
                                        <select id="dept" name="dept" style="width: 200px">
                                            <option value=""> </option>
                                        </select>
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <button type="button" class="btn btn-primary" data-target="#selectConfirm">重置</button>
                                    </div>
                                    <div class="form-group" style="margin: 10px">
                                        <button type="submit" class="btn btn-info">查询学生</button>
                                    </div>
                                </div>
                            </form>
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title"><span class="glyphicon glyphicon-user"></span>学生信息</div>
                                </div>
                            </div>
                            <div class="card-body" action="/controller/CourseServlet" method="post">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>学号</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>年龄</th>
                                        <th>身份证号</th>
                                        <th>院系</th>
                                        <th>年级</th>
                                        <th>班级</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if (students != null) {
                                            for (int i=0, size=students.size(); i<size; ++i) {
                                    %>
                                    <tr>
                                        <th scope="row"><%=i+1%></th>
                                        <td><%=students.get(i).getSid()%></td>
                                        <td><%=students.get(i).getSname()%></td>
                                        <td><%if (students.get(i).getSex() != null) {%>
                                                <%=students.get(i).getSex()%>
                                            <%}%>
                                        </td>
                                        <td><%if (students.get(i).getAge() != null) {%>
                                                <%=students.get(i).getAge()%>
                                            <%}%>
                                        </td>
                                        <td><%if (students.get(i).getId() != null) {%>
                                                <%=students.get(i).getId()%>
                                            <%}%>
                                        </td>
                                        <td><%if (students.get(i).getDept() != null) {%>
                                                <%=students.get(i).getDept()%>
                                            <%}%>
                                        </td>
                                        <td><%if (students.get(i).getGrade() != null) {%>
                                                <%=students.get(i).getGrade()%>
                                            <%}%>
                                        </td>
                                        <td><%if (students.get(i).getClasses() != null) {%>
                                                <%=students.get(i).getClasses()%>
                                            <%}%>
                                        </td>
                                        <%--<td><button href="javascript：void(0)" onClick="window.open()">修改</button></td>--%>
                                        <td><button id="select" onclick="display(selectConfirm)">修改</button></td>
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

        <div class="modal hidden fade" id="selectConfirm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">Modal title</h4>
                    </div>
                    <div class="modal-body">
                        <p>确定要选择()课吗？</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary">确定</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal info-->
        <%--<div class="modal fade modal-info" id="modalInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
        <%--<div class="modal-dialog">--%>
        <%--<div class="modal-content">--%>
        <%--<div class="modal-header">--%>
        <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
        <%--<h4 class="modal-title" id="myModalLabel">Modal Info</h4>--%>
        <%--</div>--%>
        <%--<div class="modal-body">--%>
        <%--选课成功--%>
        <%--</div>--%>
        <%--<div class="modal-footer">--%>
        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
        <%--<button type="button" class="btn btn-info">确定</button>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <!-- Modal primary-->
        <%--<div class="modal fade modal-primary" id="modalPrimary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
        <%--<div class="modal-dialog">--%>
        <%--<div class="modal-content">--%>
        <%--<div class="modal-header">--%>
        <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
        <%--<h4 class="modal-title" id="myModalLabel">Modal Primary</h4>--%>
        <%--</div>--%>
        <%--<div class="modal-body">--%>
        <%--选课失败--%>
        <%--</div>--%>
        <%--<div class="modal-footer">--%>
        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
        <%--<button type="button" class="btn btn-primary">确定</button>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>



        <footer class="app-footer">
            <div class="wrapper">
                <span class="pull-right">回到顶部 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2015 Copyright.
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

            <%--点击选课显示确认框--%>
            <script type="text/javascript">
                $(document).ready(function(){
                    $("#select").click(function(){
                        $("#selectConfirm").show();
                    });
                });
            </script>

            <script type="text/javascript">
                function display(id){
                    var target=document.getElementById(id);
                    if(target.style.display=="none"){
                        target.style.display="";
                    }else{
                        target.style.display="none";
                    }
                }
            </script>

            <script>
                var add_cid;
                var add_cno;
                var select_tr;
                $(document).ready(function() {
                    $(".btn-add").click(function (e) {
                        var entity;
                        if ($(e.target).attr("index") == 1)
                            entity = $(e.target).parent().parent().parent().children();
                        else
                            entity = $(e.target).parent().parent().children();

                        var tr0 = entity.eq(0);
                        var tr1 = entity.eq(1);
                        select_tr = tr0.parent();
                        add_cid = (tr0.html());
                        add_cno = (tr1.html());

                        $('#selectModal').modal('show');
                    });

                    $("#confirm_select_btn").click(function (e) {
                        $.post("servlet/SelectCourse",
                            {cid: add_cid, cno: add_cno},
                            function (data, status) {
                                if (data == "success") {
                                    select_tr.remove();
                                    $("#selectModal").modal("hide");
                                    $("#selectSuccessModal").modal("show");
                                } else if(data == "exists"){
                                    $("#ssm_p").text("选课失败！该课程已经被选中！");
                                    $("#selectModal").modal("hide");
                                    $("#selectSuccessModal").modal("show");
                                } else if(data == "notexists"){
                                    $("#ssm_p").text("选课失败！该课程不存在！");
                                    $("#selectModal").modal("hide");
                                    $("#selectSuccessModal").modal("show");
                                } else if(data == "noroom"){
                                    $("#ssm_p").text("选课失败！该课程选课人数过多！");
                                    $("#selectModal").modal("hide");
                                    $("#selectSuccessModal").modal("show");
                                } else{
                                    $("#ssm_p").text("选课失败！未知错误，请联系管理员！");
                                    $("#selectModal").modal("hide");
                                    $("#selectSuccessModal").modal("show");
                                }
                            });
                    });
                })
            </script>

        </div>
</body>

</html>
