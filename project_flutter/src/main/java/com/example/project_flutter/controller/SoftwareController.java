package com.example.project_flutter.controller;

import com.example.project_flutter.service.SoftwareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 西云研究所
 * @date 2021/10/21
 */
@RestController
public class SoftwareController {
    @Autowired
    private SoftwareService softwareService;

    @GetMapping("getAllSoftwares")
    public String getAllSoftwares(){
        return softwareService.getAllSoftwares();
    }
}
