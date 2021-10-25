package com.example.project_flutter.service;

import com.alibaba.fastjson.JSON;
import com.example.project_flutter.common.Result;
import com.example.project_flutter.entity.Lab;
import com.example.project_flutter.mapper.LabMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 西云研究所
 * @date 2021/10/24
 */
@Service
public class LabService {
    @Autowired
    private LabMapper labMapper;

    public String getAllLabs(){
        List<Lab> labs = labMapper.selectAllLabs();
        Result res = new Result(true, 200, null, labs);
        return JSON.toJSONString(res);
    }

}
