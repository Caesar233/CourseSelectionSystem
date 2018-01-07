package controller;

import bean.Dept;
import bean.Teacher;
import dao.DeptDAO;
import dao.TeacherDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "TeacherServlet")
public class TeacherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        DeptDAO deptDAO = new DeptDAO();
        List<Dept> depts = new ArrayList<Dept>();
        try {
            depts = deptDAO.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getSession().setAttribute("depts", depts);

        String tid = request.getParameter("tid");
        String tname = request.getParameter("tname");
        String sex = request.getParameter("sex");
        String age = request.getParameter("age");
        String id = request.getParameter("id");
        String dept = request.getParameter("dept");

        List<Map<String, Object>> teacherParams = new ArrayList<Map<String, Object>>();
        Map<String, Object> teacherParam = new HashMap<String, Object>();

        if (tid != null && !tid.equals("")) {
            teacherParam.put("logic", "and");
            teacherParam.put("name", "tid");
            teacherParam.put("relation", "=");
            teacherParam.put("value", tid);
            teacherParams.add(teacherParam);
        }
        if (tname != null && !tname.equals("")) {
            teacherParam.put("name", "tname");
            teacherParam.put("relation", "like");
            teacherParam.put("value", "%"+tname+"%");
            teacherParam.put("logic", "and");
            teacherParams.add(teacherParam);
        }
        if (sex != null && !sex.equals("")) {
            teacherParam.put("name", "sex");
            teacherParam.put("relation", "=");
            teacherParam.put("value", sex);
            teacherParam.put("logic", "and");
            teacherParams.add(teacherParam);
        }
        if (age != null && !age.equals("")) {
            teacherParam.put("name", "age");
            teacherParam.put("relation", "=");
            teacherParam.put("value", age);
            teacherParam.put("logic", "and");
            teacherParams.add(teacherParam);
        }
        if (id != null && !id.equals("")) {
            teacherParam.put("value", id);
            teacherParam.put("logic", "and");
            teacherParam.put("name", "id");
            teacherParam.put("relation", "=");
            teacherParams.add(teacherParam);
        }
        if (dept != null && !dept.equals("")) {
            teacherParam.put("name", "dept");
            teacherParam.put("relation", "=");
            teacherParam.put("logic", "and");
            teacherParam.put("value", dept);
            teacherParams.add(teacherParam);
        }

        TeacherDAO dao = new TeacherDAO();
        List<Teacher> teachers = new ArrayList<Teacher>();
        try {
            teachers = dao.query(teacherParams);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getSession().setAttribute("teachers", teachers);
        response.sendRedirect(request.getContextPath()+"/admin/manage_teacher.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
