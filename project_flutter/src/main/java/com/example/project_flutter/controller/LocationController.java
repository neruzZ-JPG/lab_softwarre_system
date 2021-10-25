package com.example.project_flutter.controller;

import com.example.project_flutter.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 西云研究所
 * @date 2021/10/24
 */
@RestController
public class LocationController {
    @Autowired
    private LocationService locationService;

    @RequestMapping("/getLocationById")
    public String getLocatonById(long location_id){
        return locationService.getLoacationById(location_id);
    }


}
