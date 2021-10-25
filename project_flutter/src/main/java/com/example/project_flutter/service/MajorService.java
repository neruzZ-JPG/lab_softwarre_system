package com.example.project_flutter.service;

import com.alibaba.fastjson.JSON;
import com.example.project_flutter.common.Result;
import com.example.project_flutter.entity.Major;
import com.example.project_flutter.mapper.MajorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 西云研究所
 * @date 2021/10/23
 */
@Service
public class MajorService {
    @Autowired
    private MajorMapper majorMapper;

    public String getMajorById(long major_id){
        Major major = majorMapper.selectMajorById(major_id);
        Result res = new Result(true, 200, null, major);
        System.out.println(res);
        return JSON.toJSONString(res);
    }

    public String selectAllMajors(){
        List<Major> majors = majorMapper.selectAllMajors();
        Result res = new Result(true, 200, null, majors);
        System.out.println(res);
        return JSON.toJSONString(res);
    }
}
