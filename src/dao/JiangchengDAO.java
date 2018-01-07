package dao;

import bean.Jiangcheng;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class JiangchengDAO {

    public void addJiangcheng(Jiangcheng j) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " insert into jiangcheng " +
                " (sid, jiangcheng) " +
                " values(?, ?) ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, j.getSid());
        ptmt.setString(2, j.getJiangcheng());

        ptmt.execute();
    }

    public void updataJiangcheng(String sid, Jiangcheng j) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " update jiangcheng " +
                " set sid=?, jiangcheng=? " +
                " where sid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, j.getSid());
        ptmt.setString(2, j.getJiangcheng());
        ptmt.setString(3, sid);

        ptmt.execute();
    }

    public void deleteJiangcheng(String sid) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " delete from jiangcheng " +
                " where sid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, sid);

        ptmt.execute();
    }

    public List<Jiangcheng> query(List<Map<String, Object>> params) throws SQLException {
        Connection conn = DBUtil.getConnection();
        StringBuilder sb = new StringBuilder();
        sb.append("select * from jiangcheng where 1=1 ");

        if (params != null && !params.isEmpty()) {
            for (Map<String, Object> map : params) {
                sb.append(" ").append(map.get("logic")).append(" ").append(map.get("name")).append(" ").append(map.get("relation")).append(" '").append(map.get("value")).append("' ");
            }
        }

        PreparedStatement ptmt = conn.prepareStatement(sb.toString());
        ResultSet rs = ptmt.executeQuery();

        List<Jiangcheng> list = new ArrayList<Jiangcheng>();
        Jiangcheng j = null;

        while (rs.next()) {
            j = new Jiangcheng();
            j.setSid(rs.getString("sid"));
            j.setJiangcheng(rs.getString("jiangcheng"));

            list.add(j);
        }

        return list;
    }

    public Jiangcheng get(String sid) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " select * from jiangcheng " +
                " where sid=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, sid);

        ResultSet rs = ptmt.executeQuery();
        Jiangcheng j = null;

        if (rs.next()) {
            j = new Jiangcheng();
            j.setSid(rs.getString("sid"));
            j.setJiangcheng(rs.getString("jiangcheng"));
        }

        return j;
    }

}
