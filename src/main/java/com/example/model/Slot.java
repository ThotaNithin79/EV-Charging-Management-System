package com.example.model;

public class Slot {
	
	private int slotRequestId, userId, stationId;
	private String date, time, status;
	public Slot() {
		
	}
	
	public Slot(int slotRequestId,int userId, int stationId,String date,String time,String status) {
		this.slotRequestId = slotRequestId;
		this.userId= userId;
		this.stationId =stationId;
		this.date = date;
		this.time = time;
		this.status = status;
	}

	@Override
	public String toString() {
		return "Slot [date=" + date + ", slotRequestId=" + slotRequestId + ", stationId=" + stationId + ", status="
				+ status + ", time=" + time + ", userId=" + userId + "]";
	}

	public int getSlotRequestId() {
		return slotRequestId;
	}

	public void setSlotRequestId(int slotRequestId) {
		this.slotRequestId = slotRequestId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getStationId() {
		return stationId;
	}

	public void setStationId(int stationId) {
		this.stationId = stationId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
