package dao;

import bean.Course;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CourseDAO {

    public void addCourse(Course c) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " insert into course " +
                " (cid, cno, cname, credit, period, tid, tname, dept, capacity, csection, week, location, class, grade, ctype) " +
                " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, c.getCid());
        ptmt.setString(2, c.getCno());
        ptmt.setString(3, c.getCname());
        ptmt.setString(4, c.getCredit());
        ptmt.setString(5, c.getPeriod());
        ptmt.setString(6, c.getTid());
        ptmt.setString(7, c.getTname());
        ptmt.setString(8, c.getDept());
        ptmt.setString(9, c.getCapacity());
        ptmt.setString(10, c.getCsection());
        ptmt.setString(11, c.getWeek());
        ptmt.setString(12, c.getLocation());
        ptmt.setString(13, c.getClasses());
        ptmt.setString(14, c.getGrade());
        ptmt.setString(15, c.getCtype());

        ptmt.execute();
    }

    public void updataCourse(String cid, String cno, Course c) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " update course " +
                " set cid=?, cno=?, cname=?, credit=?, period=?, tid=?, tname=?, dept=?, capacity=?, csection=?, week=?, location=?, class=?, grade=?, ctype=? " +
                " where cid=? and cno=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, c.getCid());
        ptmt.setString(2, c.getCno());
        ptmt.setString(3, c.getCname());
        ptmt.setString(4, c.getCredit());
        ptmt.setString(5, c.getPeriod());
        ptmt.setString(6, c.getTid());
        ptmt.setString(7, c.getTname());
        ptmt.setString(8, c.getDept());
        ptmt.setString(9, c.getCapacity());
        ptmt.setString(10, c.getCsection());
        ptmt.setString(11, c.getWeek());
        ptmt.setString(12, c.getLocation());
        ptmt.setString(13, c.getClasses());
        ptmt.setString(14, c.getGrade());
        ptmt.setString(15, c.getCtype());
        ptmt.setString(16, cid);
        ptmt.setString(17, cno);

        ptmt.execute();
    }

    public void deleteCourse(String cid, String cno) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " delete from course " +
                " where cid=? and cno=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, cid);
        ptmt.setString(2, cno);

        ptmt.execute();
    }

    public List<Course> query(List<Map<String, Object>> params) throws SQLException {
        Connection conn = DBUtil.getConnection();
        StringBuilder sb = new StringBuilder();
        sb.append("select * from course where 1=1 ");

        if (params != null && !params.isEmpty()) {
            for (Map<String, Object> map : params) {
                sb.append(" ").append(map.get("logic")).append(" ").append(map.get("name")).append(" ").append(map.get("relation")).append(" '").append(map.get("value")).append("' ");
            }
        }

        PreparedStatement ptmt = conn.prepareStatement(sb.toString());
//        System.out.println("PreparedStatement: "+ptmt.toString());
        ResultSet rs = ptmt.executeQuery();

        List<Course> list = new ArrayList<Course>();
        Course c = null;

        while (rs.next()) {
            c = new Course();
            c.setCid(rs.getString("cid"));
            c.setCno(rs.getString("cno"));
            c.setCname(rs.getString("cname"));
            c.setCredit(rs.getString("credit"));
            c.setPeriod(rs.getString("period"));
            c.setTid(rs.getString("tid"));
            c.setTname(rs.getString("tname"));
            c.setDept(rs.getString("dept"));
            c.setCapacity(rs.getString("capacity"));
            c.setCsection(rs.getString("csection"));
            c.setWeek(rs.getString("week"));
            c.setLocation(rs.getString("location"));
            c.setClasses(rs.getString("classes"));
            c.setGrade(rs.getString("grade"));
            c.setCtype(rs.getString("ctype"));

            list.add(c);
        }

        return list;
    }

    public Course get(String cid, String cno) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " select * from course " +
                " where cid=? and cno=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, cid);
        ptmt.setString(2, cno);

        ResultSet rs = ptmt.executeQuery();
        Course c = null;

        if (rs.next()) {
            c = new Course();
            c.setCid(rs.getString("cid"));
            c.setCno(rs.getString("cno"));
            c.setCname(rs.getString("cname"));
            c.setCredit(rs.getString("credit"));
            c.setPeriod(rs.getString("period"));
            c.setTid(rs.getString("tid"));
            c.setTname(rs.getString("tname"));
            c.setDept(rs.getString("dept"));
            c.setCapacity(rs.getString("capacity"));
            c.setCsection(rs.getString("csection"));
            c.setWeek(rs.getString("week"));
            c.setLocation(rs.getString("location"));
            c.setClasses(rs.getString("classes"));
            c.setGrade(rs.getString("grade"));
            c.setCtype(rs.getString("ctype"));
        }

        return c;
    }

}
