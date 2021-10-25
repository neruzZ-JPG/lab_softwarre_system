package com.example.project_flutter.service;

import com.alibaba.fastjson.JSON;
import com.example.project_flutter.common.Result;
import com.example.project_flutter.entity.Location;
import com.example.project_flutter.mapper.LocationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 西云研究所
 * @date 2021/10/24
 */
@Service
public class LocationService {
    @Autowired
    private LocationMapper locationMapper;

    public String getLoacationById(long location_id){
        Location location = locationMapper.selectByLocationId(location_id);
        Result res = new Result(true, 200, null, location);
        System.out.println(res);
        return JSON.toJSONString(res);
    }
}
