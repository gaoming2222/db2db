package com.example.demo.db2db.entity;

import java.util.Date;

public class WaterR {
	
	private String STCD;
	private Date YMDHM;
	private String DATA;
	private String WATERPROOF;
	private Date RTIME;
	private String TRANTYPE;
	private String CHKTYPE;
	private String SOURCETYPE;
	private String DEVICEID;
	
	public String getSOURCETYPE() {
		return SOURCETYPE;
	}
	public void setSOURCETYPE(String sOURCETYPE) {
		SOURCETYPE = sOURCETYPE;
	}
	public String getSTCD() {
		return STCD;
	}
	public void setSTCD(String sTCD) {
		STCD = sTCD;
	}
	public Date getYMDHM() {
		return YMDHM;
	}
	public void setYMDHM(Date yMDHM) {
		YMDHM = yMDHM;
	}
	public String getDATA() {
		return DATA;
	}
	public void setDATA(String dATA) {
		DATA = dATA;
	}
	public String getWATERPROOF() {
		return WATERPROOF;
	}
	public void setWATERPROOF(String wATERPROOF) {
		WATERPROOF = wATERPROOF;
	}
	public Date getRTIME() {
		return RTIME;
	}
	public void setRTIME(Date rTIME) {
		RTIME = rTIME;
	}
	public String getTRANTYPE() {
		return TRANTYPE;
	}
	public void setTRANTYPE(String tRANTYPE) {
		TRANTYPE = tRANTYPE;
	}
	public String getCHKTYPE() {
		return CHKTYPE;
	}
	public void setCHKTYPE(String cHKTYPE) {
		CHKTYPE = cHKTYPE;
	}
	public String getDEVICEID() {
		return DEVICEID;
	}
	public void setDEVICEID(String dEVICEID) {
		DEVICEID = dEVICEID;
	}
	
	

}
