package com.example.project_flutter.service;

import com.alibaba.fastjson.JSON;
import com.example.project_flutter.common.Result;
import com.example.project_flutter.entity.User;
import com.example.project_flutter.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 西云研究所
 * @date 2021/10/18
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public String login(String account, String password){
            System.out.println(account+":"+password);
            User userDb = userMapper.selectByAccount(account);
            System.out.println(userDb);
            if(userDb == null || !userDb.getUser_password().equals(password)){
                Result res = new Result(false, 400, null, null);
                return  JSON.toJSONString(res);
            }else{
                userDb.setUser_password("???");
                Result res = new Result(true, 200, null, userDb);
                return JSON.toJSONString(res);
            }
    }
}
