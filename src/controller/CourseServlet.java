package controller;

import bean.Course;
import bean.Teacher;
import dao.CourseDAO;
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

@WebServlet(name = "CourseServlet")
public class CourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String cname = request.getParameter("cname");
        String cid = request.getParameter("cid");
        String cno = request.getParameter("cno");
        String ctype = request.getParameter("ctype");
        String dept = request.getParameter("dept");
        String tname = request.getParameter("tname");
        String location = request.getParameter("location");

        List<Map<String, Object>> courseParams = new ArrayList<Map<String, Object>>();
        Map<String, Object> courseParam = new HashMap<String, Object>();

        if (cname != null && !cname.equals("")) {
            courseParam.put("logic", "and");
            courseParam.put("name", "cname");
            courseParam.put("relation", "like");
            courseParam.put("value", "%"+cname+"%");
            courseParams.add(courseParam);
        }
        if (cid != null && !cid.equals("")) {
            courseParam.put("logic", "and");
            courseParam.put("name", "cid");
            courseParam.put("relation", "=");
            courseParam.put("value", cid);
            courseParams.add(courseParam);
        }
        if (cno != null && !cno.equals("")) {
            courseParam.put("logic", "and");
            courseParam.put("name", "cno");
            courseParam.put("relation", "=");
            courseParam.put("value", cno);
            courseParams.add(courseParam);
        }
        if (dept != null && !dept.equals("")) {
            courseParam.put("logic", "and");
            courseParam.put("name", "dept");
            courseParam.put("relation", "=");
            courseParam.put("value", dept);
            courseParams.add(courseParam);
        }
        if (tname != null && !tname.equals("")) {
            courseParam.put("logic", "and");
            courseParam.put("name", "tname");
            courseParam.put("relation", "like");
            courseParam.put("value", "%"+tname+"%");
            courseParams.add(courseParam);
        }
        if (ctype != null && !ctype.equals("")) {
            courseParam.put("logic", "and");
            courseParam.put("name", "ctype");
            courseParam.put("relation", "=");
            courseParam.put("value", ctype);
            courseParams.add(courseParam);
        }
        if (location != null && !location.equals("")) {
            courseParam.put("logic", "and");
            courseParam.put("name", "location");
            courseParam.put("relation", "like");
            courseParam.put("value", "%"+location+"%");
            courseParams.add(courseParam);
        }

        CourseDAO courseDAO = new CourseDAO();
        List<Course> courses = null;

        try {
             if (courseParams.size() != 0) {
                 courses = courseDAO.query(courseParams);
             }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (courses != null) {
            request.getSession().setAttribute("courses", courses);
        }
        response.sendRedirect(request.getContextPath()+"/student/course/select.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
