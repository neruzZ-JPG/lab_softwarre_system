package com.example.project_flutter.service;

import com.alibaba.fastjson.JSON;
import com.example.project_flutter.common.Result;
import com.example.project_flutter.entity.Department;
import com.example.project_flutter.mapper.DepartmentMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 西云研究所
 * @date 2021/10/22
 */
@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public String getDepartmentById(long department_id){
        System.out.println(department_id);
        Department department = departmentMapper.selectDepartmentById(department_id);
        Result result = new Result(true, 200, null, department);
        System.out.println(result);
        return JSON.toJSONString(result);
    }

}
