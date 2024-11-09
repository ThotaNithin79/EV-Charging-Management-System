package com.example.dao;

import com.example.model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/cemrms";
    private String jdbcUsername = "root";
    private String jdbcPassword = "@Mysql13";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (email, password) VALUES (?, ?)";
    private static final String SELECT_USER_BY_EMAIL_AND_PASSWORD = "SELECT * FROM users WHERE email = ? AND password = ?";
    private static final String SELECT_USER_ID_BY_EMAIL_AND_PASSWORD = "SELECT user_id FROM users WHERE email = ? AND password = ?";
    private static final String SELECT_USER_ID_BY_EMAIL = "SELECT user_id FROM users WHERE email = ?";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM users WHERE user_id = ?";
    
    public UserDao() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void registerUser(User user) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User validateUser(String email, String password) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL_AND_PASSWORD)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user = new User(email, password);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public int getUserId(String email, String password) {
    	int userId=0;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_ID_BY_EMAIL_AND_PASSWORD)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                userId = rs.getInt("user_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userId;
    }
    
    public User getUserById(int userId) {
    	User user = null;
    	try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
               preparedStatement.setInt(1, userId);
               ResultSet rs = preparedStatement.executeQuery();
               
               if (rs.next()) {
                   String userEmail = rs.getString("email");
                   String userPassword = rs.getString("password");
                   user = new User(userEmail, userPassword);
               }
           } catch (Exception e) {
               e.printStackTrace();
           }
           return user;
    }
    
    public boolean isUserRegistered(String email) {
    
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_ID_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
