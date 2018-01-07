package dao;

import bean.Dept;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DeptDAO {

    public void addDept(Dept d) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " insert into dept " +
                " (dname) " +
                " values(?) ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, d.getDname());

        ptmt.execute();
    }

    public void updataDept(String dname, Dept d) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " update dept " +
                " set dname=? " +
                " where dname=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, d.getDname());
        ptmt.setString(2, dname);

        ptmt.execute();
    }

    public void deleteDept(String dname) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " delete from dept " +
                " where dname=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, dname);

        ptmt.execute();
    }

    public List<Dept> query(List<Map<String, Object>> params) throws SQLException {
        Connection conn = DBUtil.getConnection();
        StringBuilder sb = new StringBuilder();
        sb.append("select * from dept where 1=1 ");

        if (params != null && !params.isEmpty()) {
            for (Map<String, Object> map : params) {
                sb.append(" ").append(map.get("logic")).append(" ").append(map.get("name")).append(" ").append(map.get("relation")).append(" '").append(map.get("value")).append("' ");
            }
        }

        PreparedStatement ptmt = conn.prepareStatement(sb.toString());
        ResultSet rs = ptmt.executeQuery();

        List<Dept> list = new ArrayList<Dept>();
        Dept d = null;

        while (rs.next()) {
            d = new Dept();
            d.setDname(rs.getString("dname"));

            list.add(d);
        }

        return list;
    }

    public Dept get(String dname) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " select * from dept " +
                " where dname=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, dname);

        ResultSet rs = ptmt.executeQuery();
        Dept d = null;

        if (rs.next()) {
            d = new Dept();
            d.setDname(rs.getString("dname"));
        }

        return d;
    }

    public List<Dept> getAll() throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " select * from dept ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ResultSet rs = ptmt.executeQuery();
        List<Dept> list = new ArrayList<Dept>();
        Dept d = null;

        while (rs.next()) {
            d = new Dept();
            d.setDname(rs.getString("dname"));

            list.add(d);
        }

        return list;
    }

}
