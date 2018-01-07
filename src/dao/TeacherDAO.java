package dao;

import bean.Teacher;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TeacherDAO {

    public void addTeacher(Teacher t) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " insert into teacher " +
                " (tid, tname, sex, dept, id, age) " +
                " values(?, ?, ?, ?, ?, ?) ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, t.getTid());
        ptmt.setString(2, t.getTname());
        ptmt.setString(3, t.getSex());
        ptmt.setString(4, t.getDept());
        ptmt.setString(5, t.getId());
        ptmt.setString(6, t.getAge());


        ptmt.execute();
    }

    public void updataTeacher(String tid, Teacher t) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " update teacher " +
                " set tid=?, tname=?, sex=?, dept=?, id=?, age=? " +
                " where tid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, t.getTid());
        ptmt.setString(2, t.getTname());
        ptmt.setString(3, t.getSex());
        ptmt.setString(4, t.getDept());
        ptmt.setString(5, t.getId());
        ptmt.setString(6, t.getAge());
        ptmt.setString(7, tid);

        ptmt.execute();
    }

    public void deleteTeacher(String tid) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " delete from teacher " +
                " where tid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, tid);

        ptmt.execute();
    }

    public List<Teacher> query(List<Map<String, Object>> params) throws SQLException {
        Connection conn = DBUtil.getConnection();
        StringBuilder sb = new StringBuilder();
        sb.append("select * from teacher where 1=1 ");

        if (params != null && !params.isEmpty()) {
            for (Map<String, Object> map : params) {
                sb.append(" ").append(map.get("logic")).append(" ").append(map.get("name")).append(" ").append(map.get("relation")).append(" '").append(map.get("value")).append("' ");
            }
        }

        PreparedStatement ptmt = conn.prepareStatement(sb.toString());
        ResultSet rs = ptmt.executeQuery();

        List<Teacher> list = new ArrayList<Teacher>();
        Teacher t = null;

        while (rs.next()) {
            t = new Teacher();
            t.setTid(rs.getString("tid"));
            t.setTname(rs.getString("tname"));
            t.setSex(rs.getString("sex"));
            t.setDept(rs.getString("dept"));
            t.setId(rs.getString("id"));
            t.setAge(rs.getString("age"));

            list.add(t);
        }

        return list;
    }

    public Teacher get(String tid) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " select * from teacher " +
                " where tid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, tid);

        ResultSet rs = ptmt.executeQuery();
        Teacher t = null;

        if (rs.next()) {
            t = new Teacher();
            t.setTid(rs.getString("tid"));
            t.setTname(rs.getString("tname"));
            t.setSex(rs.getString("sex"));
            t.setDept(rs.getString("dept"));
            t.setId(rs.getString("id"));
            t.setAge(rs.getString("age"));
        }

        return t;
    }

}
