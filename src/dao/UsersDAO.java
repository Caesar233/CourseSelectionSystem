package dao;

import bean.Users;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UsersDAO {

    public void addUsers(Users u) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " insert into users " +
                " (id, password, authority) " +
                " values(?, ?, ?) ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, u.getId());
        ptmt.setString(2, u.getPassword());
        ptmt.setString(3, u.getAuthority());

        ptmt.execute();
    }

    public void updataUsers(String id, Users u) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " update users " +
                " set id=?, password=?, authority=? " +
                " where id=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, u.getId());
        ptmt.setString(2, u.getPassword());
        ptmt.setString(3, u.getAuthority());
        ptmt.setString(4, id);

        ptmt.execute();
    }

    public void deleteUsers(String id) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " delete from users " +
                " where id=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);

        ptmt.setString(1, id);

        ptmt.execute();
    }

    public List<Users> query(List<Map<String, Object>> params) throws SQLException {
        Connection conn = DBUtil.getConnection();
        StringBuilder sb = new StringBuilder();
        sb.append("select * from users where 1=1 ");

        if (params != null && !params.isEmpty()) {
            for (Map<String, Object> map : params) {
                sb.append(" ").append(map.get("logic")).append(" ").append(map.get("name")).append(" ").append(map.get("relation")).append(" '").append(map.get("value")).append("' ");
            }
        }

        PreparedStatement ptmt = conn.prepareStatement(sb.toString());
        ResultSet rs = ptmt.executeQuery();

        List<Users> list = new ArrayList<Users>();
        Users u = null;

        while (rs.next()) {
            u = new Users();
            u.setId(rs.getString("id"));
            u.setPassword(rs.getString("password"));
            u.setAuthority(rs.getString("authority"));

            list.add(u);
        }

        return list;
    }

    public Users get(String id) throws SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "" +
                " select * from users " +
                " where id=? ";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, id);

        ResultSet rs = ptmt.executeQuery();
        Users u = null;

        if (rs.next()) {
            u = new Users();
            u.setId(rs.getString("id"));
            u.setPassword(rs.getString("password"));
            u.setAuthority(rs.getString("authority"));
        }

        return u;
    }

}
