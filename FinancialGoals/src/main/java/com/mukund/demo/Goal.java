package com.mukund.demo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
@Entity
public class Goal {
	@Id
	@GeneratedValue
	private int id;
	private String name;
	@Column(name="target_amount")
	private int targetAmount;
	private int contribute;
	private String time; 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTargetAmount() {
		return targetAmount;
	}
	public void setTargetAmount(int targetAmount) {
		this.targetAmount = targetAmount;
	}
	public int getContribute() {
		return contribute;
	}
	public void setContribute(int contribute) {
		this.contribute = contribute;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Goal [id=" + id + ", name=" + name + ", targetAmount=" + targetAmount + ", contribute=" + contribute
				+ ", time=" + time + "]";
	}
	
	
}
