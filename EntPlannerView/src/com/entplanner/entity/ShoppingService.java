package com.entplanner.entity;




public class ShoppingService implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8701355386192728736L;
	private Integer id;
	private String serviceName;
	private String startLocation;
	private String destination;
	private String startLocationAddress;
	private String destinationAddress;
	private Integer duration;
	private Double cost;
	private String types;
	private String referenece;
	private String rating;
	private String priceLevel;
	private String website;
	private String url;

	private String snsUrl;
	private String postCode;
	private String telephone;
	private String name;


	
	
	
	
	
	public ShoppingService() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public ShoppingService(Integer id, String serviceName,
			String startLocation, String destination,
			String startLocationAddress, String destinationAddress,
			Integer duration, Double cost, String types, String referenece,
			String rating, String priceLevel, String website, String url,
			String snsUrl, String postCode, String telephone, String name) {
		super();
		this.id = id;
		this.serviceName = serviceName;
		this.startLocation = startLocation;
		this.destination = destination;
		this.startLocationAddress = startLocationAddress;
		this.destinationAddress = destinationAddress;
		this.duration = duration;
		this.cost = cost;
		this.types = types;
		this.referenece = referenece;
		this.rating = rating;
		this.priceLevel = priceLevel;
		this.website = website;
		this.url = url;
		this.snsUrl = snsUrl;
		this.postCode = postCode;
		this.telephone = telephone;
		this.name = name;
	}




	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public String getReferenece() {
		return referenece;
	}
	public void setReferenece(String referenece) {
		this.referenece = referenece;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getPriceLevel() {
		return priceLevel;
	}
	public void setPriceLevel(String priceLevel) {
		this.priceLevel = priceLevel;
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
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	public void setTimeCost() {
		if (this.priceLevel != null) {
			this.setDuration(60);
		} else {
			this.setDuration(30);
		}
	}
	
	



	@Override
	public String toString() {
		return "ShoppingService [id=" + id + ", serviceName=" + serviceName
				+ ", startLocation=" + startLocation + ", destination="
				+ destination + ", startLocationAddress="
				+ startLocationAddress + ", destinationAddress="
				+ destinationAddress + ", duration=" + duration + ", cost="
				+ cost + ", types=" + types + ", rating=" + rating
				+ ", priceLevel=" + priceLevel + ", website=" + website
				+ ", telephone=" + telephone + ", name=" + name + "]";
	}
	
	
	
}
