package com.example.project_flutter.controller;

import com.example.project_flutter.entity.User;
import com.example.project_flutter.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 西云研究所
 * @date 2021/10/22
 */
@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/getAllUsers")
    public String getAllUsers(){
        return userService.getAllUsers();
    }
}
