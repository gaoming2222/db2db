package com.example.demo.db2db.mapper.source;

import java.util.Date;
import java.util.List;
import java.util.Map;
import com.example.demo.db2db.entity.IDCD;
import com.example.demo.db2db.entity.Rain;
import com.example.demo.db2db.entity.Sanility;
import com.example.demo.db2db.entity.Voltage;
import com.example.demo.db2db.entity.Water;



public interface SourceMapper {
	
	public List<Rain> getRecentRains(Map<String,Object> map);
	
	public List<Water> getRecentWaters(Map<String,Object> map);
	
	public List<Sanility> getRecentSanilitys(Map<String,Object> map);
	
	public List<Voltage> getRecentVoltage(Map<String,Object> map);
	
	public List<IDCD> getIDCDs();
	
	public void updateIDCDs(Date date);
	
	public void insertIDCDs(Date date);
	
	
	public List<Rain> getSelectedRains(Map<String,Object> map);
	
	public List<Water> getSelectedWaters(Map<String,Object> map);
	
	public List<Sanility> getSelectedSanilitys(Map<String,Object> map);
	
	public List<Voltage> getSelectedVoltage(Map<String,Object> map);
}
