package com.example.project_flutter.controller;

import com.example.project_flutter.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 西云研究所
 * @date 2021/10/23
 */
@RestController
public class MajorController {
    @Autowired
    private MajorService majorService;

    @GetMapping("/getMajorById")
    public String getMajorById(long major_id){
        return majorService.getMajorById(major_id);
    }
}
