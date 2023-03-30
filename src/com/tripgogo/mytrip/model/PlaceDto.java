package com.tripgogo.mytrip.model;

public class PlaceDto {
	
	private long myTripId;
	private long dateIdx;
	private String placeName;
	private String category;
	private String x;
	private String y;
	
	public String getPlaceName() {
		return placeName;
	}
	
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}

	public long getMyTripId() {
		return myTripId;
	}

	public void setMyTripId(long myTripId) {
		this.myTripId = myTripId;
	}

	public long getDateIdx() {
		return dateIdx;
	}

	public void setDateIdx(long dateIdx) {
		this.dateIdx = dateIdx;
	}
	
}
