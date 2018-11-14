package com.example.demo.db2db.service;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.demo.db2db.entity.*;
import com.example.demo.db2db.mapper.source.SourceMapper;
import com.example.demo.db2db.mapper.target.TargetMapper;
import org.apache.log4j.Logger;


@Service
public class Db2dbService {
	
	    private static Logger logger = Logger.getLogger(Db2dbService.class);
	    
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    @Autowired
	    private SourceMapper sourceMapper;

		@Autowired
		private TargetMapper targetMapper;
		

		
		public  Map<String,Object>  db2db(Date strtDte,Date enDate,Map<String,String> idcdMap,Map<String,String> transTypMap,Map<String,String> messTypMap,List<String> idList) throws Exception{
			Map<String,Object> resMap = new HashMap<>();
			int rainFlag = 0;
			int waterFlag = 0;			
			int sanFlag = 0;
			int volFlag = 0;
			
			int rainNum = 0;
			int waterNum = 0;
			int sanilityNum = 0;
			int volNum = 0;
		    String dteStr = "1900-01-01 00:00:00";
		    Date dteFlag = format.parse(dteStr);
		    if(strtDte != null){
		    	if(dteFlag.before(strtDte)){
		    		dteFlag = strtDte;
		    	}
		    }
			List<Rain> rainList = new ArrayList<>();
			List<Water> waterList = new ArrayList<>();
			List<Sanility> sanilityList = new ArrayList<>();
			List<Voltage> voltageList = new ArrayList<>();
			Map<String,Object> param = new HashMap<>();
			String strt = format.format(strtDte);
			String end = format.format(enDate);
			param.put("StrtDte", strt);
			param.put("EndDte", end);
			param.put("lists", idList);
			
			try{
				logger.info("获取新的雨量数据开始" + param);
				rainList = sourceMapper.getRecentRains(param);
				logger.info("获取新的雨量数据完成");
				logger.info("获取水位数据开始");
				waterList = sourceMapper.getRecentWaters(param);
				logger.info("获取水位数据完成");
				logger.info("获取盐度数据开始");
				sanilityList = sourceMapper.getRecentSanilitys(param);
				logger.info("获取盐度数据完成");
				logger.info("获取电压数据开始");
				voltageList = sourceMapper.getRecentVoltage(param);
				logger.info("获取电压数据完成");
			}catch(Exception e){
				logger.error("获取最新数据失败");
				return null;
			}
			List<RainR> rainRList = new ArrayList<>();
			List<WaterR> waterRList = new ArrayList<>();
			List<SanilityR> sanilityRList = new ArrayList<>();
			List<StcondR> stcondRList = new ArrayList<>();
			if(rainList != null){
				rainFlag = rainList.size();
				for(Rain rain : rainList){
					RainR rainR = new RainR();
					rainR.setSTCD(idcdMap.get(rain.getStationid()));
					rainR.setYMDHM(rain.getDatatime());
					rainR.setDATAPLUS(rain.getDifferencerain());
					rainR.setDATA(rain.getTotalrain());
					rainR.setRTIME(rain.getRecvdatatime());
					rainR.setWEATHER("");
					rainR.setTRANTYPE(transTypMap.get(rain.getTranstype().trim()));
					rainR.setSOURCETYPE(messTypMap.get(rain.getMessagetype()));
					rainR.setDEVICEID(rain.getStationid());
					Date date = rainR.getRTIME();
					if(dteFlag.before(date)){
						dteFlag = date;
					}
					rainRList.add(rainR);
				}
			}
			
			if(waterList != null){
				waterFlag = waterList.size();
				for(Water water : waterList){
					WaterR  waterR = new WaterR();
					waterR.setSTCD(idcdMap.get(water.getStationid()));
					waterR.setYMDHM(water.getDatatime());
					waterR.setDATA(water.getWaterstage());
					waterR.setWATERPROOF("");
					waterR.setRTIME(water.getRecvdatatime());
					String transType = water.getTranstype();
					waterR.setTRANTYPE(transTypMap.get(transType.trim()));
					waterR.setCHKTYPE("");
					waterR.setSOURCETYPE(messTypMap.get(water.getMessagetype()));
					waterR.setDEVICEID(water.getStationid());
					Date date = waterR.getRTIME();
					if(dteFlag.before(date)){
						dteFlag = date;
					}
					waterRList.add(waterR);
				}
			}
			
			if(sanilityList != null){
				sanFlag = sanilityList.size();
				for(Sanility sanility : sanilityList){
					SanilityR  sanilityR = new SanilityR();
					sanilityR.setSTCD(idcdMap.get(sanility.getStationid()));
					sanilityR.setYMDHM(sanility.getDatatime());
					sanilityR.setWT(sanility.getTemperature());
					sanilityR.setEC(sanility.getConductivity());
					sanilityR.setSanility(sanility.getSanility());
					Date date = sanility.getRecvdatatime();
					if(dteFlag.before(date)){
						dteFlag = date;
					}
					sanilityRList.add(sanilityR);
				}
			}
			
			if(voltageList != null){
				volFlag = voltageList.size();
				for(Voltage voltage : voltageList){
					StcondR  stcondR = new StcondR();
					stcondR.setSTCD(idcdMap.get(voltage.getStationid()));
					stcondR.setYMDHM(voltage.getDatatime());
					stcondR.setVOL(voltage.getData());
					stcondR.setDEV(voltage.getStationid());
					Date date = voltage.getRecvdatatime();
					if(dteFlag.before(date)){
						dteFlag = date;
					}
					stcondRList.add(stcondR);
				}
			}
			//resMap.put("LDATE", dteFlag);
			try{
					//List r = targetMapper.test();
					if(rainRList != null && rainRList.size() > 0){
						logger.info("插入最新的雨量数据开始");
						int flag = rainRList.size()/100;
						if(flag < 1){
							targetMapper.insertRecentRains(rainRList);
						}else{
							List<RainR> tmp = new ArrayList<>();
							for(int i = 0;i<rainRList.size();i++){
								tmp.add(rainRList.get(i));
								if(i%100 == 99){
									targetMapper.insertRecentRains(tmp);
									tmp.clear();
								}
								if(i == rainRList.size() -1){
									targetMapper.insertRecentRains(tmp);
									tmp.clear();
								}
								
							}
						}
						//rainNum = targetMapper.insertRecentRains(rainRList);
						logger.info("插入最新的雨量数据完成");
					}
					if(waterRList != null && waterRList.size() > 0){
						logger.info("插入最新的水位数据开始");
						int flag = waterRList.size()/100;
						if(flag < 1){
							targetMapper.insertRecentWaters(waterRList);
						}else{
							List<WaterR> tmp = new ArrayList<>();
							for(int i = 0;i<waterRList.size();i++){
								tmp.add(waterRList.get(i));
								if(i%100 == 99){
									targetMapper.insertRecentWaters(tmp);
									tmp.clear();
								}
								if(i == rainRList.size() -1){
									targetMapper.insertRecentWaters(tmp);
									tmp.clear();
								}
								
							}
							
						}
						//waterNum = targetMapper.insertRecentWaters(waterRList);
						logger.info("插入最新的雨量数据完成");
					}
					if(sanilityRList != null && sanilityRList.size() > 0){
						logger.info("插入最新的盐度数据开始");
						int flag = sanilityRList.size()/100;
						if(flag < 1){
							targetMapper.insertRecentSalinitys(sanilityRList);
						}
						else{
							List<SanilityR> tmp = new ArrayList<>();
							for(int i = 0;i<sanilityRList.size();i++){
								tmp.add(sanilityRList.get(i));
								if(i%100 == 99){
									targetMapper.insertRecentSalinitys(tmp);
									tmp.clear();
								}
								if(i == rainRList.size() -1){
									targetMapper.insertRecentSalinitys(tmp);
									tmp.clear();
								}
								
							}
							
						}
						//sanilityNum = targetMapper.insertRecentSalinitys(sanilityRList);
						logger.info("插入最新的盐度数据完成");
					}
					
					
					if(stcondRList != null && stcondRList.size() > 0){
						logger.info("插入最新的电压数据开始");
						int flag = stcondRList.size()/100;
						if(flag < 1){
							targetMapper.insertRecentVoltages(stcondRList);
						}
						else{
							List<StcondR> tmp = new ArrayList<>();
							for(int i = 0;i<stcondRList.size();i++){
								tmp.add(stcondRList.get(i));
								if(i%100 == 99){
									targetMapper.insertRecentVoltages(tmp);
									tmp.clear();
								}
								if(i == rainRList.size() -1){
									targetMapper.insertRecentVoltages(tmp);
									tmp.clear();
								}
								
							}
							
						}
						
						logger.info("插入最新的盐度数据完成");
					}
			}catch(Exception e){
				logger.error("插入最新数据失败");
				return resMap;
			}
//			if(rainNum != rainFlag || waterNum != waterFlag || sanilityNum != sanFlag){
//				logger.error("从源库中获得的数据的条数和插入新库的条数不一致，rainNum:" + rainNum + " " + rainFlag + ",waterNum:" + waterNum + " " + waterFlag + 
//						",sanilityNum:" + sanilityNum + " " + sanFlag);
//			}
			resMap.put("rainNum", rainNum);
			resMap.put("waterNum", waterNum);
			resMap.put("sanilityNum", sanilityNum);
			resMap.put("LDATE", dteFlag);
			return resMap;
		}
		/*
		 * db2dbService.handImport(params,idList,idcdMap,transTyp,messTyp);
		 */
		@Transactional
		public Map<String,Object> handImport(Map<String,Object> params,Map<String,String> idcdMap,Map<String,String> transTypMap,Map<String,String> messTypMap){
		    Map<String,Object> resMap = new HashMap<>();
		    List<Rain> rainList = new ArrayList<>();
			List<Water> waterList = new ArrayList<>();
			List<Sanility> sanilityList = new ArrayList<>();
			List<Voltage> voltageList = new ArrayList<>();
			try{
				logger.info("获取新的雨量数据开始" + params);
				rainList = sourceMapper.getSelectedRains(params);
				logger.info("获取新的雨量数据完成");
				logger.info("获取水位数据开始");
				waterList = sourceMapper.getSelectedWaters(params);
				logger.info("获取水位数据完成");
				logger.info("获取盐度数据开始");
				sanilityList = sourceMapper.getSelectedSanilitys(params);
				logger.info("获取盐度数据完成");
				logger.info("获取电压数据开始");
				voltageList = sourceMapper.getSelectedVoltage(params);
				logger.info("获取电压数据完成");
			}catch(Exception e){
				logger.error("获取最新数据失败");
				return null;
			}
			List<RainR> rainRList = new ArrayList<>();
			List<WaterR> waterRList = new ArrayList<>();
			List<SanilityR> sanilityRList = new ArrayList<>();
			List<StcondR> stcondRList = new ArrayList<>();
			if(rainList != null){
				for(Rain rain : rainList){
					RainR rainR = new RainR();
					rainR.setSTCD(idcdMap.get(rain.getStationid()));
					rainR.setYMDHM(rain.getDatatime());
					rainR.setDATAPLUS(rain.getDifferencerain());
					rainR.setDATA(rain.getTotalrain());
					rainR.setRTIME(rain.getRecvdatatime());
					rainR.setWEATHER("");
					rainR.setTRANTYPE(transTypMap.get(rain.getTranstype().trim()));
					rainR.setSOURCETYPE(messTypMap.get(rain.getMessagetype()));
					rainR.setDEVICEID(rain.getStationid());
					rainRList.add(rainR);
				}
			}
			
			if(waterList != null){
				for(Water water : waterList){
					WaterR  waterR = new WaterR();
					waterR.setSTCD(idcdMap.get(water.getStationid()));
					waterR.setYMDHM(water.getDatatime());
					waterR.setDATA(water.getWaterstage());
					waterR.setWATERPROOF("");
					waterR.setRTIME(water.getRecvdatatime());
					String transType = water.getTranstype();
					waterR.setTRANTYPE(transTypMap.get(transType.trim()));
					waterR.setCHKTYPE("");
					waterR.setSOURCETYPE(messTypMap.get(water.getMessagetype()));
					waterR.setDEVICEID(water.getStationid());
					waterRList.add(waterR);
				}
			}
			
			if(sanilityList != null){
				for(Sanility sanility : sanilityList){
					SanilityR  sanilityR = new SanilityR();
					sanilityR.setSTCD(idcdMap.get(sanility.getStationid()));
					sanilityR.setYMDHM(sanility.getDatatime());
					sanilityR.setWT(sanility.getTemperature());
					sanilityR.setEC(sanility.getConductivity());
					sanilityR.setSanility(sanility.getSanility());
					sanilityRList.add(sanilityR);
				}
			}
			if(voltageList != null){
				for(Voltage voltage : voltageList){
					StcondR  stcondR = new StcondR();
					stcondR.setSTCD(idcdMap.get(voltage.getStationid()));
					stcondR.setYMDHM(voltage.getDatatime());
					stcondR.setVOL(voltage.getData());
					stcondR.setDEV(voltage.getStationid());
					stcondRList.add(stcondR);
				}
			}
			//resMap.put("LDATE", dteFlag);
			try{
					//List r = targetMapper.test();
					if(rainRList != null && rainRList.size() > 0){
						logger.info("插入最新的雨量数据开始");
						int flag = rainRList.size()/100;
						if(flag < 1){
							targetMapper.insertRecentRains(rainRList);
						}else{
							List<RainR> tmp = new ArrayList<>();
							for(int i = 0;i<rainRList.size();i++){
								tmp.add(rainRList.get(i));
								if(i%100 == 99){
									targetMapper.insertRecentRains(tmp);
									
									tmp.clear();
								}
								if(i == rainRList.size() -1){
									targetMapper.insertRecentRains(tmp);
									tmp.clear();
								}
								
							}
						}
						
						logger.info("插入最新的雨量数据完成");
					}
					if(waterRList != null && waterRList.size() > 0){
						logger.info("插入最新的水位数据开始");
						int flag = waterRList.size()/100;
						if(flag < 1){
							targetMapper.insertRecentWaters(waterRList);
						}else{
							List<WaterR> tmp = new ArrayList<>();
							for(int i = 0;i<waterRList.size();i++){
								tmp.add(waterRList.get(i));
								if(i%100 == 99){
									targetMapper.insertRecentWaters(tmp);
									tmp.clear();
								}
								if(i == rainRList.size() -1){
									targetMapper.insertRecentWaters(tmp);
									tmp.clear();
								}
								
							}
							
						}
						
						logger.info("插入最新的雨量数据完成");
					}
					if(sanilityRList != null && sanilityRList.size() > 0){
						logger.info("插入最新的盐度数据开始");
						int flag = sanilityRList.size()/100;
						if(flag < 1){
							targetMapper.insertRecentSalinitys(sanilityRList);
						}
						else{
							List<SanilityR> tmp = new ArrayList<>();
							for(int i = 0;i<sanilityRList.size();i++){
								tmp.add(sanilityRList.get(i));
								if(i%100 == 99){
									targetMapper.insertRecentSalinitys(tmp);
									tmp.clear();
								}
								if(i == rainRList.size() -1){
									targetMapper.insertRecentSalinitys(tmp);
									tmp.clear();
								}
								
							}
							
						}
						logger.info("插入最新的盐度数据完成");
					}
					
					if(stcondRList != null && stcondRList.size() > 0){
						logger.info("插入最新的电压数据开始");
						int flag = stcondRList.size()/100;
						if(flag < 1){
							targetMapper.insertRecentVoltages(stcondRList);
						}
						else{
							List<StcondR> tmp = new ArrayList<>();
							for(int i = 0;i<stcondRList.size();i++){
								tmp.add(stcondRList.get(i));
								if(i%100 == 99){
									targetMapper.insertRecentVoltages(tmp);
									tmp.clear();
								}
								if(i == rainRList.size() -1){
									targetMapper.insertRecentVoltages(tmp);
									tmp.clear();
								}
								
							}
							
						}
						
						logger.info("插入最新的盐度数据完成");
					}
			}catch(Exception e){
				logger.error("插入最新数据失败");
				return resMap;
			}
		    return resMap;
		}
		
		public List<IDCD> getIdcd() throws Exception{
			logger.info("开始获取ID-CD对应关系");
			List<IDCD> idcdList = new ArrayList<>();
			try{
				idcdList = sourceMapper.getIDCDs();
			}catch(Exception e){
				logger.error("获取IDCD对应关系错误" + e.getMessage());
				throw new  Exception(e);
			}
			logger.info("获取ID-CD对应关系完成");
			return idcdList;
 		}
		
		public int updateIdcd(Date date) throws Exception{
			logger.info("更新最新时间副本开始");
			int res = 0;
			try{
				sourceMapper.updateIDCDs(date);
			}catch(Exception e){
				logger.error("更新ID_CD表ltime失败");
				return -1;
			}
			logger.info("更新最新时间副本完成");
			return res;
		}
}
