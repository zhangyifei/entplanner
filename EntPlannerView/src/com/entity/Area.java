package com.entity;

public class Area {
	private String id;
	private String code;
	private String name;
	private String lat;
	private String lon;
	private String url;
	private String type;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Area(String id, String code, String name, String lat, String lon,
			String url, String type) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.lat = lat;
		this.lon = lon;
		this.url = url;
		this.type = type;
	}
	public Area() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Area(String id, String name, String lat, String lon) {
		super();
		this.id = id;
		this.name = name;
		this.lat = lat;
		this.lon = lon;
	}
	
	
}
