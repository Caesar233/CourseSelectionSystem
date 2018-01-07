package dao;

import bean.Student;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class StudentDAO {

    public void addStudent(Student s) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " insert into student " +
                " (sid, sname, sex, age, id, dept, grade, classes) " +
                " values(?, ?, ?, ?, ?, ?, ?, ?) ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, s.getSid());
        ptmt.setString(2, s.getSname());
        ptmt.setString(3, s.getSex());
        ptmt.setString(4, s.getAge());
        ptmt.setString(5, s.getId());
        ptmt.setString(6, s.getDept());
        ptmt.setString(7, s.getGrade());
        ptmt.setString(8, s.getClasses());

        ptmt.execute();
    }

    public void updataStudent(String sid, Student s) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " update student " +
                " set sid=?, sname=?, sex=?, age=?, id=?, dept=?, grade, classes=? " +
                " where sid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, s.getSid());
        ptmt.setString(2, s.getSname());
        ptmt.setString(3, s.getSex());
        ptmt.setString(4, s.getAge());
        ptmt.setString(5, s.getId());
        ptmt.setString(6, s.getDept());
        ptmt.setString(7, s.getGrade());
        ptmt.setString(8, s.getClasses());
        ptmt.setString(9, sid);

        ptmt.execute();
    }

    public void deleteStudent(String sid) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " delete from student " +
                " where sid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, sid);

        ptmt.execute();
    }

    public List<Student> query(List<Map<String, Object>> params) throws SQLException {
        Connection conn = DBUtil.getConnection();
        StringBuilder sb = new StringBuilder();
        sb.append("select * from student where 1=1 ");

        if (params != null && !params.isEmpty()) {
            for (Map<String, Object> map : params) {
                sb.append(" ").append(map.get("logic")).append(" ").append(map.get("name")).append(" ").append(map.get("relation")).append(" '").append(map.get("value")).append("' ");
            }
        }

        PreparedStatement ptmt = conn.prepareStatement(sb.toString());
        ResultSet rs = ptmt.executeQuery();

        List<Student> list = new ArrayList<Student>();
        Student s = null;

        while (rs.next()) {
            s = new Student();
            s.setSid(rs.getString("sid"));
            s.setSname(rs.getString("sname"));
            s.setSex(rs.getString("sex"));
            s.setAge(rs.getString("age"));
            s.setId(rs.getString("id"));
            s.setDept(rs.getString("dept"));
            s.setGrade(rs.getString("grade"));
            s.setClasses(rs.getString("classes"));

            list.add(s);
        }

        return list;
    }

    public Student get(String sid) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " select * from student " +
                " where sid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, sid);

        ResultSet rs = ptmt.executeQuery();
        Student s = null;

        if (rs.next()) {
            s = new Student();
            s.setSid(rs.getString("sid"));
            s.setSname(rs.getString("sname"));
            s.setSex(rs.getString("sex"));
            s.setAge(rs.getString("age"));
            s.setId(rs.getString("id"));
            s.setDept(rs.getString("dept"));
            s.setGrade(rs.getString("grade"));
            s.setClasses(rs.getString("classes"));
        }

        return s;
    }

}
