package com.entplanner.entity;



public class Direction implements java.io.Serializable{
	private int id;
	private String serviceName;
	private String startLocation;
	private String destination;
	private String startLocationAddress;
	private String destinationAddress;
	private Double cost;
	private Integer duration;
	private String website;
	private String url;
	private String snsUrl;
	private String postCode;
	private String distance;
	

	public Direction() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Direction(int id, String serviceName, String startlocation,
			String destination, String startLocationAddress,
			String destinationaddress, Double cost, Integer duration,
			String website, String url, String snsUrl, String postCode) {
		super();
		this.id = id;
		this.serviceName = serviceName;
		this.startLocation = startlocation;
		this.destination = destination;
		this.startLocationAddress = startLocationAddress;
		this.destinationAddress = destinationaddress;
		this.cost = cost;
		this.duration = duration;
		this.website = website;
		this.url = url;
		this.snsUrl = snsUrl;
		this.postCode = postCode;

	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getStartLocation() {
		return startLocation;
	}

	public void setStartLocation(String startLocation) {
		this.startLocation = startLocation;
	}

	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getStartLocationAddress() {
		return startLocationAddress;
	}
	public void setStartLocationAddress(String startLocationAddress) {
		this.startLocationAddress = startLocationAddress;
	}

	public String getDestinationAddress() {
		return destinationAddress;
	}

	public void setDestinationAddress(String destinationAddress) {
		this.destinationAddress = destinationAddress;
	}

	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public String getSnsUrl() {
		return snsUrl;
	}
	public void setSnsUrl(String snsUrl) {
		this.snsUrl = snsUrl;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}


	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((destination == null) ? 0 : destination.hashCode());
		result = prime * result
				+ ((startLocation == null) ? 0 : startLocation.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Direction other = (Direction) obj;
		if (destination == null) {
			if (other.destination != null)
				return false;
		} else if (!destination.equals(other.destination))
			return false;
		if (startLocation == null) {
			if (other.startLocation != null)
				return false;
		} else if (!startLocation.equals(other.startLocation))
			return false;
		return true;
	}
	
	
}
