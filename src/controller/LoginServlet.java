package controller;

import bean.Student;
import bean.Teacher;
import bean.Users;
import dao.StudentDAO;
import dao.TeacherDAO;
import dao.UsersDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username == null) {
            //用户名为空
            response.sendRedirect(request.getContextPath()+"/login.jsp?");
            return;
        }
        if (password == null) {
            //密码为空
            return;
        }

        UsersDAO usersDAO = new UsersDAO();
        Users user = null;
        try {
            user = usersDAO.get(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (user==null) {
            //用户不存在
        } else {
            if (user.getPassword().equals(password)) {
                //密码正确，登录成功
                System.out.println("登录成功");
                request.getSession().setAttribute("user", user);
                switch (user.getAuthority()) {
                    case "student":
                        Student student = null;
                        StudentDAO studentDAO = new StudentDAO();
                        try {
                            student = studentDAO.get(username);
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        request.getSession().setAttribute("student", student);
                        break;
                    case "teacher":
                    case "edu":
                        Teacher teacher = null;
                        TeacherDAO teacherDAO = new TeacherDAO();
                        try {
                            teacher = teacherDAO.get(username);
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        request.getSession().setAttribute("teacher", teacher);
                        break;
                    case "admin":
                        break;
                }
                response.sendRedirect(request.getContextPath()+"/main.jsp");
            } else {
                //密码错误，登录失败
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
