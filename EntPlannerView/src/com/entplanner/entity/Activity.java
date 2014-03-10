package com.entplanner.entity;



// default package
// Generated 2013-7-19 16:38:26 by Hibernate Tools 4.0.0


/**
 * Activity generated by hbm2java
 */
public class Activity implements java.io.Serializable {

	private int id;
	private String serviceType;
	private Integer serviceId;
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
	

	private String start_time;
	private String end_time;
	
	
	public Activity() {
	}

	public Activity(int id) {
		this.id = id;
	}

	public Activity(int id, String serviceType, Integer serviceId,
			String startlocation, String destination, String startaddress,
			String destinationaddress, Double cost, Integer duration,
			String website, String url) {
		this.id = id;
		this.serviceType = serviceType;
		this.serviceId = serviceId;
		this.startLocation = startlocation;
		this.destination = destination;
		this.startLocationAddress = startaddress;
		this.destinationAddress = destinationaddress;
		this.cost = cost;
		this.duration = duration;
		this.website = website;
		this.url = url;
		
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getServiceType() {
		return this.serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public Integer getServiceId() {
		return this.serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public String getStartLocation() {
		return this.startLocation;
	}

	public void setStartLocation(String startlocation) {
		this.startLocation = startlocation;
	}

	public String getDestination() {
		return this.destination;
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
		return this.cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	public Integer getDuration() {
		return this.duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getUrl() {
		return this.url;
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

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	@Override
	public String toString() {
		return "Activity [id=" + id + ", serviceType=" + serviceType
				+ ", serviceId=" + serviceId + ", startLocation="
				+ startLocation + ", destination=" + destination
				+ ", startLocationAddress=" + startLocationAddress
				+ ", destinationAddress=" + destinationAddress + ", cost="
				+ cost + ", duration=" + duration + ", postCode=" + postCode
				+ ", start_time=" + start_time + ", end_time=" + end_time + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result
				+ ((serviceId == null) ? 0 : serviceId.hashCode());
		result = prime * result
				+ ((serviceType == null) ? 0 : serviceType.hashCode());
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
		Activity other = (Activity) obj;
		if (id != other.id)
			return false;
		if (serviceId == null) {
			if (other.serviceId != null)
				return false;
		} else if (!serviceId.equals(other.serviceId))
			return false;
		if (serviceType == null) {
			if (other.serviceType != null)
				return false;
		} else if (!serviceType.equals(other.serviceType))
			return false;
		return true;
	}




}
