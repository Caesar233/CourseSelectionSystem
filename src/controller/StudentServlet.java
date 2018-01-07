package controller;

import bean.Dept;
import bean.Student;
import dao.DeptDAO;
import dao.StudentDAO;

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

@WebServlet(name = "StudentServlet")
public class StudentServlet extends HttpServlet {
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

        String sid = request.getParameter("sid");
        String sname = request.getParameter("sname");
        String sex = request.getParameter("sex");
        String age = request.getParameter("age");
        String id = request.getParameter("id");
        String dept = request.getParameter("dept");
        String grade = request.getParameter("grade");
        String classes = request.getParameter("classes");

        List<Map<String, Object>> studentParams = new ArrayList<Map<String, Object>>();
        Map<String, Object> studentParam = new HashMap<String, Object>();

        if (sid != null && !sid.equals("")) {
            studentParam.put("logic", "and");
            studentParam.put("name", "sid");
            studentParam.put("relation", "=");
            studentParam.put("value", sid);
            studentParams.add(studentParam);
        }
        if (sname != null && !sname.equals("")) {
            studentParam.put("logic", "and");
            studentParam.put("name", "sname");
            studentParam.put("relation", "like");
            studentParam.put("value", "%"+sname+"%");
            studentParams.add(studentParam);
        }
        if (sex != null && !sex.equals("")) {
            studentParam.put("logic", "and");
            studentParam.put("name", "sex");
            studentParam.put("relation", "=");
            studentParam.put("value", sex);
            studentParams.add(studentParam);
        }
        if (age != null && !age.equals("")) {
            studentParam.put("logic", "and");
            studentParam.put("name", "age");
            studentParam.put("relation", "=");
            studentParam.put("value", age);
            studentParams.add(studentParam);
        }
        if (id != null && !id.equals("")) {
            studentParam.put("logic", "and");
            studentParam.put("name", "id");
            studentParam.put("relation", "=");
            studentParam.put("value", id);
            studentParams.add(studentParam);
        }
        if (dept != null && !dept.equals("")) {
            studentParam.put("name", "dept");
            studentParam.put("relation", "=");
            studentParam.put("value", dept);
            studentParam.put("logic", "and");
            studentParams.add(studentParam);
        }
        if (grade != null && !grade.equals("")) {
            studentParam.put("logic", "and");
            studentParam.put("name", "grade");
            studentParam.put("relation", "like");
            studentParam.put("value", "%"+grade+"%");
            studentParams.add(studentParam);
        }
        if (classes != null && !classes.equals("")) {
            studentParam.put("logic", "and");
            studentParam.put("name", "classes");
            studentParam.put("relation", "like");
            studentParam.put("value", "%"+classes+"%");
            studentParams.add(studentParam);
        }

        StudentDAO dao = new StudentDAO();
        List<Student> students = new ArrayList<Student>();
        try {
            students = dao.query(studentParams);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getSession().setAttribute("students", students);
        response.sendRedirect(request.getContextPath()+"/admin/manage_student.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
