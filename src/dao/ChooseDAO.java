package dao;

import bean.Choose;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ChooseDAO {

    public void addChoose(Choose c) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " insert into choose " +
                " (sid, cid, cno, cname, credit, period, tname, dept, capacity, csection, week, location, ctype) " +
                " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, c.getSid());
        ptmt.setString(2, c.getCid());
        ptmt.setString(3, c.getCno());
        ptmt.setString(4, c.getCname());
        ptmt.setString(5, c.getCredit());
        ptmt.setString(6, c.getPeriod());
        ptmt.setString(7, c.getTname());
        ptmt.setString(8, c.getDept());
        ptmt.setString(9, c.getCapacity());
        ptmt.setString(10, c.getCsection());
        ptmt.setString(11, c.getWeek());
        ptmt.setString(12, c.getLocation());
        ptmt.setString(13, c.getCtype());

        ptmt.execute();
    }

    public void updataChoose(String cid, String cno, String sid, Choose c) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " update choose " +
                " set sid=?, score=? cid=?, cno=?, cname=?, credit=?, period=?, tid=?, tname=?, dept=?, capacity=?, csection=?, week=?, location=?, class=?, grade=?, ctype=? " +
                " where cid=? and cno=? and sid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, c.getSid());
        ptmt.setInt(2, c.getScore());
        ptmt.setString(3, c.getCid());
        ptmt.setString(4, c.getCno());
        ptmt.setString(5, c.getCname());
        ptmt.setString(6, c.getCredit());
        ptmt.setString(7, c.getPeriod());
        ptmt.setString(8, c.getTid());
        ptmt.setString(9, c.getTname());
        ptmt.setString(10, c.getDept());
        ptmt.setString(11, c.getCapacity());
        ptmt.setString(12, c.getCsection());
        ptmt.setString(13, c.getWeek());
        ptmt.setString(14, c.getLocation());
        ptmt.setString(15, c.getClasses());
        ptmt.setString(16, c.getGrade());
        ptmt.setString(17, c.getCtype());
        ptmt.setString(18, cid);
        ptmt.setString(19, cno);
        ptmt.setString(20, sid);

        ptmt.execute();
    }

    public void deleteChoose(String cid, String cno, String sid) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " delete from choose " +
                " where cid=? and cno=? and sid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, cid);
        ptmt.setString(2, cno);
        ptmt.setString(3, sid);

        ptmt.execute();
    }

    public List<Choose> query(List<Map<String, Object>> params) throws SQLException {
        Connection conn = DBUtil.getConnection();
        StringBuilder sb = new StringBuilder();
        sb.append("select * from choose where 1=1 ");

        if (params != null && !params.isEmpty()) {
            for (Map<String, Object> map : params) {
                sb.append(" ").append(map.get("logic")).append(" ").append(map.get("name")).append(" ").append(map.get("relation")).append(" '").append(map.get("value")).append("' ");
            }
        }

        PreparedStatement ptmt = conn.prepareStatement(sb.toString());
        ResultSet rs = ptmt.executeQuery();

        List<Choose> list = new ArrayList<Choose>();
        Choose c = null;

        while (rs.next()) {
            c = new Choose();
            c.setSid(rs.getString("sid"));
            c.setScore(rs.getInt("score"));
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

    public Choose get(String cid, String cno, String sid) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " select * from choose " +
                " where cid=? and cno=? and sid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, cid);
        ptmt.setString(2, cno);
        ptmt.setString(3, sid);

        ResultSet rs = ptmt.executeQuery();
        Choose c = null;

        while (rs.next()) {
            c = new Choose();
            c.setSid(rs.getString("sid"));
            c.setScore(rs.getInt("score"));
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
