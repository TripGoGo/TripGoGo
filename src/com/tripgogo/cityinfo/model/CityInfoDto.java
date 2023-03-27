package com.tripgogo.cityinfo.model;

public class CityInfoDto {
	private int cityInfoCode;
	private int cityCode;
	private String cityName;
	private String districtName;
	
	public int getCityCode() {
		return cityCode;
	}
	public void setCityCode(int cityCode) {
		this.cityCode = cityCode;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	
	
}
