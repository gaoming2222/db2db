package com.example.demo.db2db.mapper.target;

import java.util.List;
import com.example.demo.db2db.entity.RainR;
import com.example.demo.db2db.entity.SanilityR;
import com.example.demo.db2db.entity.StcondR;
import com.example.demo.db2db.entity.WaterR;

public interface TargetMapper {
	
    public int insertRecentRains(List<RainR> list);
	
    public int insertRecentWaters(List<WaterR> list);
    
    public int insertRecentSalinitys(List<SanilityR> list);
    
    public int insertRecentVoltages(List<StcondR> list);
}
