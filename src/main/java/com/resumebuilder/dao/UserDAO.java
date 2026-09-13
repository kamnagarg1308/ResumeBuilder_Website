package com.resumebuilder.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.resumebuilder.model.User;
import com.resumebuilder.util.DBConnection;

public class UserDAO {

    // Register User
    public boolean registerUser(User user) {

        String sql = "INSERT INTO users(name, email, password) VALUES (?, ?, ?)";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            int result = ps.executeUpdate();

            if (result > 0) {
                System.out.println("User Registered Successfully!");
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Login User
    public boolean loginUser(String email, String password) {

        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("Login Successful!");
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get User ID after successful login
    public int getUserId(String email, String password) {

        String sql = "SELECT id FROM users WHERE email = ? AND password = ?";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }
}