package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.*;

public class SlotDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/cemrms";
    private String jdbcUsername = "root";
    private String jdbcPassword = "@Mysql13";
    private static final String INSERT_SLOT_SQL = "INSERT INTO slots (userId, date, time, stationId, status) VALUES (?, ?, ?, ?, ?)";
    private static final String GET_SLOTS_BY_USER_ID = "SELECT * FROM slots WHERE userId = ? ORDER BY slotRequestId DESC";
    private static final String GET_SLOTS_BY_STATION_ID = "SELECT * FROM slots WHERE stationId = ? ORDER BY slotRequestId DESC";
    private static final String UPDATE_SLOT_STATUS_BY_SLOT_ID = "UPDATE slots SET status = ? WHERE slotRequestId = ?";
    
    public SlotDao() {
    	
    }
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    
    public boolean registerSlot(Slot slot) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SLOT_SQL)) {
            preparedStatement.setInt(1, slot.getUserId());
            preparedStatement.setString(2, slot.getDate());
            preparedStatement.setString(3, slot.getTime());
            preparedStatement.setInt(4, slot.getStationId());
            preparedStatement.setString(5, slot.getStatus());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Slot> getSlotsByUserId(int userId) {
        List<Slot> slots = new ArrayList<>();
        try (Connection conn = getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(GET_SLOTS_BY_USER_ID);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Slot slot = new Slot();
                slot.setStationId(rs.getInt("stationId"));
                slot.setDate(rs.getString("date"));
                slot.setTime(rs.getString("time"));
                slot.setStatus(rs.getString("status"));
                slots.add(slot);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return slots;
    }
    
    public List<Slot> getSlotsByStationId(int stationId){
    	List<Slot> slots = new ArrayList<>();
        try (Connection conn = getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(GET_SLOTS_BY_STATION_ID);
            stmt.setInt(1, stationId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Slot slot = new Slot();
                slot.setStationId(rs.getInt("stationId"));
                slot.setDate(rs.getString("date"));
                slot.setTime(rs.getString("time"));
                slot.setStatus(rs.getString("status"));
                slot.setUserId(rs.getInt("userId"));
                slot.setSlotRequestId(rs.getInt("slotRequestId"));
                slots.add(slot);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return slots;
    }
    
    public void updateSlotStatus(int slotId, String status) {
    	try (Connection conn = getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(UPDATE_SLOT_STATUS_BY_SLOT_ID);
            stmt.setString(1, status);
            stmt.setInt(2, slotId);
            stmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
