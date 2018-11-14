package com.example.demo.db2db.entity;

import java.util.Date;

public class Rain {
	
	private String stationid;
	private Date datatime;
	private String periodrain;
	private String differencerain;
	private String totalrain;
	private String dayrain;
	private String transtype;
	private String messagetype;
	private Date recvdatatime;
	private String state;
	public String getStationid() {
		return stationid;
	}
	public void setStationid(String stationid) {
		this.stationid = stationid;
	}
	public Date getDatatime() {
		return datatime;
	}
	public void setDatatime(Date datatime) {
		this.datatime = datatime;
	}
	public String getPeriodrain() {
		return periodrain;
	}
	public void setPeriodrain(String periodrain) {
		this.periodrain = periodrain;
	}
	public String getDifferencerain() {
		return differencerain;
	}
	public void setDifferencerain(String differencerain) {
		this.differencerain = differencerain;
	}
	public String getTotalrain() {
		return totalrain;
	}
	public void setTotalrain(String totalrain) {
		this.totalrain = totalrain;
	}
	public String getDayrain() {
		return dayrain;
	}
	public void setDayrain(String dayrain) {
		this.dayrain = dayrain;
	}
	public String getTranstype() {
		return transtype;
	}
	public void setTranstype(String transtype) {
		this.transtype = transtype;
	}
	public String getMessagetype() {
		return messagetype;
	}
	public void setMessagetype(String messagetype) {
		this.messagetype = messagetype;
	}
	public Date getRecvdatatime() {
		return recvdatatime;
	}
	public void setRecvdatatime(Date recvdatatime) {
		this.recvdatatime = recvdatatime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	
	
	

}
