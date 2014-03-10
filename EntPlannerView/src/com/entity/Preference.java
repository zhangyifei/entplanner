package com.entity;

public class Preference {

	private boolean timeFirst;
	private boolean costFirst;
	private boolean connectFirst;

	public Preference(boolean timeFirst, boolean costFirst) {
		super();
		this.timeFirst = timeFirst;
		this.costFirst = costFirst;
	}
	
	public Preference(boolean timeFirst, boolean costFirst, boolean connectFirst) {
		super();
		this.timeFirst = timeFirst;
		this.costFirst = costFirst;
		this.connectFirst = connectFirst;
	}

	public Preference() {
		super();
	}

	public boolean isTimeFirst() {
		return timeFirst;
	}

	public void setTimeFirst(boolean timeFirst) {
		this.timeFirst = timeFirst;
	}

	public boolean isCostFirst() {
		return costFirst;
	}

	public void setCostFirst(boolean costFirst) {
		this.costFirst = costFirst;
	}

	public boolean isConnectFirst() {
		return connectFirst;
	}

	public void setConnectFirst(boolean connectFirst) {
		this.connectFirst = connectFirst;
	}



	

}
