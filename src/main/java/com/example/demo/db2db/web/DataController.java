package com.example.demo.db2db.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.db2db.entity.IDCD;
import com.example.demo.db2db.service.Db2dbService;

@Controller
@EnableAutoConfiguration
@EnableScheduling
@SpringBootApplication
@MapperScan("com.example.demo.db2db.mapper")
public class DataController {
	
	private static Logger logger = Logger.getLogger(Db2dbService.class);
	   
	    
	
		@Autowired
		private Db2dbService db2dbService;
		
		List<IDCD> idcdList = new ArrayList<>();
		
		Map<String,String> idcdMap = new HashMap<>();
		
		List<String> idList = new ArrayList<>();
		
		Map<String,String> transTyp = new HashMap<>();
		
		Map<String,String> messTyp = new HashMap<>();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		boolean flag = true; //用于判定是否需要查询数据库获取开始时间
		
		Date strtDte = new Date();
		
		Date endDte = new Date();
		
		@RequestMapping("/test")
		@ResponseBody
		public String Test(){
			return "success";
		}
		
		@Transactional
		@Scheduled(cron = "0 */3 * * * ?")
		@RequestMapping("/db2db")
		@ResponseBody
		public int db2Db() throws Exception {
			logger.info("开始进行数据转存");
			Map<String,Object> resMap = new HashMap<>();
			int num = 0;
			if(flag){
				idcdList = db2dbService.getIdcd();
				if(idcdList == null || idcdList.size() == 0){
					logger.error("获取ID-CD对应关系失败");
					return num;
				}
				// 初始化id-cd对应关系
				for(IDCD IDCD:idcdList){
					idcdMap.put(IDCD.getStationId(), IDCD.getSTCD());
					idList.add(IDCD.getStationId());
				}
				// 初始话transtyp
				transTyp.put("3", "2");
				
				
				//初始化messtyp
				messTyp.put("8", "1");
				messTyp.put("9", "2");
				String strtDteStr = idcdList.get(0).getLtime();
				strtDte = format.parse(strtDteStr);
			}
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.SECOND,-3);
			endDte = calendar.getTime();
			
			
			resMap = db2dbService.db2db(strtDte,endDte,idcdMap,transTyp,messTyp,idList);
			
			if(resMap.get("LDATE") != null){
				strtDte = (Date) resMap.get("LDATE");
			}
			
			db2dbService.updateIdcd(strtDte);
			
			flag = false;
			
			logger.info("数据转存完成，转存至" + format.format(strtDte));
			
			return num;
			
			
		}
		@SuppressWarnings("rawtypes")
		@RequestMapping(value = "/handwork", method = RequestMethod.POST)
		@ResponseBody
		public  Map<String, Object> HandToDb(@RequestBody JSONObject params) throws Exception{
			logger.info("开始进行数据转存");
			idcdList = db2dbService.getIdcd();
			if(idcdList == null || idcdList.size() == 0){
				logger.error("获取ID-CD对应关系失败");
				return null;
			}
			// 初始化id-cd对应关系
			for(IDCD IDCD:idcdList){
				idcdMap.put(IDCD.getStationId(), IDCD.getSTCD());
				idList.add(IDCD.getStationId());
			}
			// 初始话transtyp
			transTyp.put("3", "2");
			
			
			//初始化messtyp
			messTyp.put("8", "1");
			messTyp.put("9", "2");
			Map<String,Object> resMap = new HashMap<>();
			String strtDte = ((String)params.get("strtDte")).replace('T', ' ');
	        String endDte = ((String)params.get("endDte")).replace('T', ' ');
	        Map<String,Object> prmMap = new HashMap<>();
	        prmMap.put("StrtDte", strtDte);
	        prmMap.put("EndDte", endDte);
	        prmMap.put("lists", idList);
			db2dbService.handImport(prmMap,idcdMap,transTyp,messTyp);
			return null;
		}
		
		
		@RequestMapping("/selectIdCd")
		@ResponseBody
		public  Map<String, Object> selectIdCd(@RequestBody JSONObject params){
			Map<String,Object> resMap = new HashMap<>();
			
			return resMap;
		}
		
		@RequestMapping("/insertIdCd")
		@ResponseBody
		public  Map<String, Object> insertIdCd(@RequestBody JSONObject params){
			Map<String,Object> resMap = new HashMap<>();
			
			return resMap;
		}
		
		
		@RequestMapping("/updateIdCd")
		@ResponseBody
		public  Map<String, Object> updateIdCd(@RequestBody JSONObject params){
			Map<String,Object> resMap = new HashMap<>();
			
			return resMap;
		}
		
		
	    
	    

}
