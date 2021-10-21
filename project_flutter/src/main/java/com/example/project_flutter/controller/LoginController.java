package com.example.project_flutter.controller;

import com.example.project_flutter.common.Result;
import com.example.project_flutter.entity.User;
import com.example.project_flutter.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * @author 西云研究所
 * @date 2021/10/20
 */
@RestController
public class LoginController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login(@RequestParam("account") String account,
                        @RequestParam("password") String password){
        System.out.println(account);
        System.out.println(password);
        return userService.login(account, password);
    }
}
