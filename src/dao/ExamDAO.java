package dao;

import bean.Exam;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ExamDAO {

    public void addExam(Exam e) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " insert into exam " +
                " (cid, cno, etype, etime, duration, location) " +
                " values(?, ?, ?, ?, ?, ?) ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, e.getCid());
        ptmt.setString(2, e.getCno());
        ptmt.setString(3, e.getEtype());
        ptmt.setTimestamp(4, e.getEtime());
        ptmt.setString(5, e.getDuration());
        ptmt.setString(6, e.getLocation());

        ptmt.execute();
    }

    public void updataExam(String cid, String cno, Exam e) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " update exam " +
                " set cid=?, cno=?, etype=?, etime=?, duration=?, location=? " +
                " where cid=? and cno=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, e.getCid());
        ptmt.setString(2, e.getCno());
        ptmt.setString(3, e.getEtype());
        ptmt.setTimestamp(4, e.getEtime());
        ptmt.setString(5, e.getDuration());
        ptmt.setString(6, e.getLocation());
        ptmt.setString(7, cid);
        ptmt.setString(8, cno);

        ptmt.execute();
    }

    public void deleteExam(String cid, String cno) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " delete from exam " +
                " where cid=? and cno=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, cid);
        ptmt.setString(2, cno);

        ptmt.execute();
    }

    public List<Exam> query(List<Map<String, Object>> params) throws SQLException {
        Connection conn = DBUtil.getConnection();
        StringBuilder sb = new StringBuilder();
        sb.append("select * from exam where 1=1 ");

        if (params != null && !params.isEmpty()) {
            for (Map<String, Object> map : params) {
                sb.append(" ").append(map.get("logic")).append(" ").append(map.get("name")).append(" ").append(map.get("relation")).append(" '").append(map.get("value")).append("' ");
            }
        }

        PreparedStatement ptmt = conn.prepareStatement(sb.toString());
        ResultSet rs = ptmt.executeQuery();

        List<Exam> list = new ArrayList<Exam>();
        Exam e = null;

        while (rs.next()) {
            e = new Exam();
            e.setCid(rs.getString("cid"));
            e.setCno(rs.getString("cno"));
            e.setEtype(rs.getString("etype"));
            e.setEtime(rs.getTimestamp("etime"));
            e.setDuration(rs.getString("duration"));
            e.setLocation(rs.getString("location"));

            list.add(e);
        }

        return list;
    }

    public Exam get(String cid, String cno) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " select * from exam " +
                " where cid=? and cno=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, cid);
        ptmt.setString(2, cno);

        ResultSet rs = ptmt.executeQuery();
        Exam e = null;

        if (rs.next()) {
            e = new Exam();
            e.setCid(rs.getString("cid"));
            e.setCno(rs.getString("cno"));
            e.setEtype(rs.getString("etype"));
            e.setEtime(rs.getTimestamp("etime"));
            e.setDuration(rs.getString("duration"));
            e.setLocation(rs.getString("location"));
        }

        return e;
    }

}
