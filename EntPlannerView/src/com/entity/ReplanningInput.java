package com.entity;

import java.util.List;
import java.util.Map.Entry;

public class ReplanningInput {
    
	private String id;
	private Input input;
	private List<Entry<String, Integer>> activities;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Input getInput() {
		return input;
	}
	public void setInput(Input input) {
		this.input = input;
	}
	public List<Entry<String, Integer>> getActivities() {
		return activities;
	}
	public void setActivities(List<Entry<String, Integer>> activities) {
		this.activities = activities;
	}
	
	
	
	
}
