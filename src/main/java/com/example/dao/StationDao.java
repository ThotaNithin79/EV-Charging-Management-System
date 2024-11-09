package com.example.dao;

import com.example.model.Station;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StationDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/cemrms";
    private String jdbcUsername = "root";
    private String jdbcPassword = "@Mysql13";

    private static final String SELECT_STATION_BY_ID = "SELECT * FROM stations WHERE station_id = ?";
    private static final String SELECT_STATIONS_BY_USER_ID = "SELECT * FROM stations WHERE user_id = ?";
    private static final String INSERT_STATION_SQL = "INSERT INTO stations (station_id, station_name, stands, price, area_name, alt_area1, alt_area2, alt_area3, alt_area4,user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
    private static final String SELECT_STATIONS_BY_AREA = "SELECT * FROM stations WHERE area_name LIKE ? OR alt_area1 LIKE ? OR alt_area2 LIKE ? OR alt_area3 LIKE ? OR alt_area4 LIKE ?";

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

    public Station getStationById(int id) {
        Station station = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STATION_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("station_name");
                int stands = rs.getInt("stands");
                double price = rs.getDouble("price");
                String areaName = rs.getString("area_name");
                String alt1 = rs.getString("alt_area1");
                String alt2 = rs.getString("alt_area2");
                String alt3 = rs.getString("alt_area3");
                String alt4 = rs.getString("alt_area4");
                int userId = rs.getInt("user_id");
                station = new Station(id, name, stands, price, areaName, alt1, alt2, alt3, alt4,userId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return station;
    }

    public void registerStation(Station station) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STATION_SQL)) {
            preparedStatement.setInt(1, station.getId());
            preparedStatement.setString(2, station.getName());
            preparedStatement.setInt(3, station.getStands());
            preparedStatement.setDouble(4, station.getPrice());
            preparedStatement.setString(5, station.getAreaName());
            preparedStatement.setString(6, station.getAlt1());
            preparedStatement.setString(7, station.getAlt2());
            preparedStatement.setString(8, station.getAlt3());
            preparedStatement.setString(9, station.getAlt4());
            preparedStatement.setInt(10,station.getUserId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Station> searchStationsByArea(String area) {
        List<Station> stations = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STATIONS_BY_AREA)) {
            String searchPattern = "%" + area + "%";
            preparedStatement.setString(1, searchPattern);
            preparedStatement.setString(2, searchPattern);
            preparedStatement.setString(3, searchPattern);
            preparedStatement.setString(4, searchPattern);
            preparedStatement.setString(5, searchPattern);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("station_id");
                String name = rs.getString("station_name");
                int stands = rs.getInt("stands");
                double price = rs.getDouble("price");
                String areaName = rs.getString("area_name");
                String alt1 = rs.getString("alt_area1");
                String alt2 = rs.getString("alt_area2");
                String alt3 = rs.getString("alt_area3");
                String alt4 = rs.getString("alt_area4");
                int userId = rs.getInt("user_id");
                stations.add(new Station(id, name, stands, price, areaName,alt1, alt2, alt3, alt4,userId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stations;
    }
    
    public List<Station> searchStationByUserId(int userId){
    	List<Station> stations = new ArrayList<>();
    	try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STATIONS_BY_USER_ID)) {
    			preparedStatement.setInt(1, userId);
    			ResultSet rs = preparedStatement.executeQuery();
    			
    			while (rs.next()) {
                    int id = rs.getInt("station_id");
                    String name = rs.getString("station_name");
                    int stands = rs.getInt("stands");
                    double price = rs.getDouble("price");
                    String areaName = rs.getString("area_name");
                    String alt1 = rs.getString("alt_area1");
                    String alt2 = rs.getString("alt_area2");
                    String alt3 = rs.getString("alt_area3");
                    String alt4 = rs.getString("alt_area4");
                    stations.add(new Station(id, name, stands, price, areaName,alt1, alt2, alt3, alt4,userId));
                }
    			
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    	return stations;
    }
    
    public void updateStation(Station station) {
        String query = "UPDATE stations SET station_name = ?, area_name = ?, price = ?, stands = ?, alt_area1 = ?, alt_area2 = ?, alt_area3 = ?, alt_area4 = ? WHERE station_id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, station.getName());
            preparedStatement.setString(2, station.getAreaName());
            preparedStatement.setDouble(3, station.getPrice());
            preparedStatement.setInt(4, station.getStands());
            preparedStatement.setString(5, station.getAlt1());
            preparedStatement.setString(6, station.getAlt2());
            preparedStatement.setString(7, station.getAlt3());
            preparedStatement.setString(8, station.getAlt4());
            preparedStatement.setInt(9, station.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteStation(int stationId) {
        String sql = "DELETE FROM stations WHERE station_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, stationId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
