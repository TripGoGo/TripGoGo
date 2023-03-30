package com.tripgogo.mytrip.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class MyTripDto {
	private long userId;
	private String city;
	private Date startDate;
	private Date endDate;
	private int period;
	private String companion;
	private String tripStyle;
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
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
	public String getCompanion() {
		return companion;
	}
	public void setCompanion(String companion) {
		this.companion = companion;
	}
	public String getTripStyle() {
		return tripStyle;
	}
	public void setTripStyle(String tripStyle) {
		this.tripStyle = tripStyle;
	}
	
	
	
}
