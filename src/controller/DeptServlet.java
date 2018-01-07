package controller;

import bean.Dept;
import dao.DeptDAO;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DeptServlet")
public class DeptServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request, response);

        response.setContentType("application/json;charset=UTF-8");

        DeptDAO dao = new DeptDAO();
        List<Dept> depts = new ArrayList<Dept>();
        try {
            depts = dao.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        JSONArray jsonArray = new JSONArray();
        for (int i=0, size=depts.size(); i<size; ++i) {
            jsonArray.put(depts.get(i).getDname());
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("test", "test");
        jsonObject.put("msg", jsonArray);

        PrintWriter out = response.getWriter();
        out.write(jsonObject.toString());
        out.flush();
        out.close();

    }
}
