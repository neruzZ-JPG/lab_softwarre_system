package com.example.project_flutter.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * @author 西云研究所
 * @date 2021/10/18
 */
@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private long user_id;
    private long deprtment_id;
    private String user_account;
    private String user_password;
    private String user_phone_number;
    //role为0则为admin,1是普通老师
    private int user_role;
    private String user_name;
}
