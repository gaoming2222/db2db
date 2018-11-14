package com.example.demo.db2db.entity;

import java.util.Date;

public class Voltage {
	private String stationid;
	private Date datatime;
	private String data;
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
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
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
