package controller;

import bean.Choose;
import dao.ChooseDAO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        String sid = request.getParameter("sid");
        String cid = request.getParameter("cid");
        String cno = request.getParameter("cno");
        String cname = request.getParameter("cname");
        String credit = request.getParameter("credit");
        String period = request.getParameter("period");
        String ctype = request.getParameter("ctype");
        String dept = request.getParameter("dept");
        String tname = request.getParameter("tname");
        String capacity = request.getParameter("capacity");
        String week = request.getParameter("week");
        String csection = request.getParameter("csection");
        String location = request.getParameter("location");
        System.out.println(sid);

        ChooseDAO dao = new ChooseDAO();
        Choose choose = new Choose();
        choose.setSid(sid);
        choose.setCid(cid);
        choose.setCno(cno);
        choose.setCname(cname);
        choose.setCredit(credit);
        choose.setPeriod(period);
        choose.setCtype(ctype);
        choose.setDept(dept);
        choose.setTname(tname);
        choose.setCapacity(capacity);
        choose.setWeek(week);
        choose.setCsection(csection);
        choose.setLocation(location);

        try {
            dao.addChoose(choose);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", "true");

        PrintWriter out = response.getWriter();
        out.write(jsonObject.toString());
        out.flush();
        out.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
