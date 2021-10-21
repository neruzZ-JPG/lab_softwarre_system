package com.example.project_flutter.service;

import com.alibaba.fastjson.JSON;
import com.example.project_flutter.common.Result;
import com.example.project_flutter.entity.Software;
import com.example.project_flutter.mapper.SoftwareMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 西云研究所
 * @date 2021/10/21
 */
@Service
public class SoftwareService {

    @Autowired
    private SoftwareMapper softwareMapper;

    public String getAllSoftwares(){
        List<Software> list= softwareMapper.selectAllsoftwares();
        Result res = new Result(true, 200, null, list);
        return JSON.toJSONString(res);
    }
}
