package com.tripgogo.mytrip.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class MyTripDto {
	private long myTripId;
	private String userId;
	private String city;
	private Date startDate;
	private Date endDate;
	private int period;
	private int companion;
	private int tripStyle;
	
	public long getMyTripId() {
		return myTripId;
	}
	public void setMyTripId(long myTripId) {
		this.myTripId = myTripId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public int getCompanion() {
		return companion;
	}
	public void setCompanion(int companion) {
		this.companion = companion;
	}
	public int getTripStyle() {
		return tripStyle;
	}
	public void setTripStyle(int tripStyle) {
		this.tripStyle = tripStyle;
	}
	
	
	
}
