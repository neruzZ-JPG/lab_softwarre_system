package com.example.project_flutter.controller;

import com.example.project_flutter.service.DepartmentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 西云研究所
 * @date 2021/10/22
 */
@RestController
public class DepatmentController {
    @Autowired
    private DepartmentService departmentService;

    @GetMapping("/getDepartmentById")
    public String getDepartmentById(@Param("department_id")long department_id){
        return departmentService.getDepartmentById(department_id);
    }
}
