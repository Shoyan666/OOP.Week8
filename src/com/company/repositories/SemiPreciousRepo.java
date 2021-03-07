package com.company.repositories;
import com.company.data.interfaces.IDB;
import com.company.entities.Semiprecious;
import com.company.repositories.interfaces.ISemiPreciousRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SemiPreciousRepo implements ISemiPreciousRepo {
    private final IDB db;
    public SemiPreciousRepo(IDB db) {
        this.db = db;
    }

    @Override
    public boolean addSemiPrecious(Semiprecious semiPrecious) {
        try {
            Connection con = db.getConnection();
            String sql = "insert into semi_precious(weight, name, authenticity) values(?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, semiPrecious.getWeight());
            st.setString(2, semiPrecious.getName());
            st.setBoolean(3, semiPrecious.isAuthenticity());
            boolean executed = st.execute();
            return executed;
        }
        catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Semiprecious getSemiPrecious(int id) {
        try {
            Connection con = db.getConnection();
            String sql = "select * from semi_precious where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Semiprecious semiPrecious = new Semiprecious(rs.getInt("id"),
                        rs.getInt("weight"),
                        rs.getString("name"),
                        rs.getBoolean("authenticity"));
                con.close();
                return semiPrecious;
            }
        }
        catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Semiprecious> getAllSemiPrecious() {
        try {
            Connection con = db.getConnection();
            String sql = "select * from semi_precious";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Semiprecious> semiPreciousList = new ArrayList<>();
            while (rs.next()) {
                Semiprecious semiPrecious = new Semiprecious(rs.getInt("id"),
                        rs.getInt("weight"),
                        rs.getString("name"),
                        rs.getBoolean("authenticity"));
                semiPreciousList.add(semiPrecious);
                con.close();
            }
            return semiPreciousList;
        }
        catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
