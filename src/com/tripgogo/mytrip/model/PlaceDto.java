package com.tripgogo.mytrip.model;

import java.sql.Date;

public class PlaceDto {
	private long placeId;
	private long myTripId;
	private Date date;
	private String placeName;
	private String category;
	private String x;
	private String y;

	public long getPlaceId() {
		return placeId;
	}

	public void setPlaceId(long placeId) {
		this.placeId = placeId;
	}

	public long getMyTripId() {
		return myTripId;
	}

	public void setMyTripId(long myTripId) {
		this.myTripId = myTripId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

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
}
