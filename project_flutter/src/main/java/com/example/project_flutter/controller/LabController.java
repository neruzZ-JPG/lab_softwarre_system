package com.example.project_flutter.controller;

import com.example.project_flutter.service.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 西云研究所
 * @date 2021/10/24
 */
@RestController
public class LabController {
    @Autowired
    private LabService labService;

    @GetMapping("/getAllLabs")
    public String getAllLabs(){
        return labService.getAllLabs();
    }

    @GetMapping("/getLabByUserId")
    public String getLabByUserId(long user_id){
        return labService.getLabByUserId(user_id);
    }
}
