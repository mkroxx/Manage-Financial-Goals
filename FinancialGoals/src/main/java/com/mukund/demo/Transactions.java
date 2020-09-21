package com.mukund.demo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class Transactions {
	@Id
	@SequenceGenerator(name = "trxGenerator", sequenceName = "myDbSeq",initialValue = 1, allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "trxGenerator")
	private int Trxid;
	@Column(name="goal_id")
	private int goalID;
	@Column(name="goal_name")
	private String goalName;
	private int amount;
	private String time;
	
	
	public int getTrxid() {
		return Trxid;
	}
	public void setTrxid(int trxid) {
		Trxid = trxid;
	}
	public int getGoalID() {
		return goalID;
	}
	public void setGoalID(int goalID) {
		this.goalID = goalID;
	}
	public String getGoalName() {
		return goalName;
	}
	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
