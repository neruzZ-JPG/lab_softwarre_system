package com.example.project_flutter.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author 西云研究所
 * @date 2021/10/18
 */
@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Class {
    private long user_id;
    private long lab_id;
    private long course_id;
    private Date class_time;
    private int class_hold;
}
