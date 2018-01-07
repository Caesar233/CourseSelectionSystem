package controller;

import bean.Choose;
import bean.Student;
import dao.ChooseDAO;

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

@WebServlet(name = "ScheduleServlet")
public class ScheduleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        Student student = (Student) request.getSession().getAttribute("student");
        String sid = student.getSid();

        List<Map<String, Object>> chooseParams = new ArrayList<Map<String, Object>>();
        Map<String, Object> chooseParam = new HashMap<String, Object>();
        chooseParam.put("logic", "and");
        chooseParam.put("name", "sid");
        chooseParam.put("relation", "=");
        chooseParam.put("value", sid);
        chooseParams.add(chooseParam);

        ChooseDAO dao = new ChooseDAO();
        List<Choose> chooses = new ArrayList<Choose>();
        try {
            chooses = dao.query(chooseParams);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getSession().setAttribute("chooses", chooses);
        response.sendRedirect(request.getContextPath()+"/student/course/schedule.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
