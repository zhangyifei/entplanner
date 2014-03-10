package com.entity;



public class Input {
	private String address;
	private String money;
	private String originDistance; // distance of origin location to area
	private String distance;
	private String maxTime;
	private String time;
	private String mv;
	private String dv;
	private String sv;
	private String travelMode;
	private String timeOrigin;
	private String timeService;
	private String originLocation;


	private String area;
	
	private String areaId;
    private String areaType;
	private String stationLocation;  //area Location
	private String stationAddress;   //area Location ADDRESS
	
	private String postcode; 
	
	private String preference;
	private Preference userPreference;

	public Input(String address, String money, String distance, String maxTime,
			String time) {
		super();
		this.address = address;
		this.money = money;
		this.distance = distance;
		this.maxTime = maxTime;
		this.time = time;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getMaxTime() {
		return maxTime;
	}

	public void setMaxTime(String maxTime) {
		this.maxTime = maxTime;
	}

	public String getTime() {
		return time;
	}

	public String getTravelMode() {
		return travelMode;
	}

	public void setTravelMode(String travelMode) {
		this.travelMode = travelMode;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getMv() {
		return mv;
	}

	public void setMv(String mv) {
		this.mv = mv;
	}

	public String getDv() {
		return dv;
	}

	public void setDv(String dv) {
		this.dv = dv;
	}

	public Input() {
		// TODO Auto-generated constructor stub
	}

	public String getTimeOrigin() {
		return timeOrigin;
	}

	public void setTimeOrigin(String timeOrigin) {
		this.timeOrigin = timeOrigin;
	}

	public String getTimeService() {
		return timeService;
	}

	public void setTimeService(String timeService) {
		this.timeService = timeService;
	}

	public String getOriginLocation() {
		return originLocation;
	}

	public void setOriginLocation(String originLocation) {
		this.originLocation = originLocation;
	}

	public String getStationLocation() {
		return stationLocation;
	}

	public void setStationLocation(String stationLocation) {
		this.stationLocation = stationLocation;
	}

	public String getStationAddress() {
		return stationAddress;
	}

	public void setStationAddress(String stationAddress) {
		this.stationAddress = stationAddress;
	}

	@Override
	public String toString() {
		return "Input [address=" + address + ", money=" + money + ", distance="
				+ distance + ", maxTime=" + maxTime + ", time=" + time
				+ ", timeOrigin=" + timeOrigin + ", timeService=" + timeService
				+ ", originLocation=" + originLocation + ", stationLocation="
				+ stationLocation + ", stationAddress=" + stationAddress + "]";
	}

	public String getOriginDistance() {
		return originDistance;
	}

	public void setOriginDistance(String originDistance) {
		this.originDistance = originDistance;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getAreaType() {
		return areaType;
	}

	public void setAreaType(String areaType) {
		this.areaType = areaType;
	}

	public Preference getUserPreference() {
		return userPreference;
	}

	public void setUserPreference(Preference userPreference) {
		this.userPreference = userPreference;
	}

	public String getPreference() {
		return preference;
	}

	public void setPreference(String preference) {
		this.preference = preference;
	}

	public String getSv() {
		return sv;
	}

	public void setSv(String sv) {
		this.sv = sv;
	}








}
