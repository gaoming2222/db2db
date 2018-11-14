package com.example.demo.db2db.entity;

import java.util.Date;

public class Sanility {

	private String stationid;
	private Date datatime;
	private String temperature;
	private String conductivity;
	private String sanility;
	private Date recvdatatime;
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
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getConductivity() {
		return conductivity;
	}
	public void setConductivity(String conductivity) {
		this.conductivity = conductivity;
	}
	public String getSanility() {
		return sanility;
	}
	public void setSanility(String sanility) {
		this.sanility = sanility;
	}
	public Date getRecvdatatime() {
		return recvdatatime;
	}
	public void setRecvdatatime(Date recvdatatime) {
		this.recvdatatime = recvdatatime;
	}

}
