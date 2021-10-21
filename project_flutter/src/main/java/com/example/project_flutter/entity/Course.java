package com.example.project_flutter.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * @author 西云研究所
 * @date 2021/10/18
 */
@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Course {
    private long course_id;
    private long major_id;
    private String course_name;
    private String course_term;
    private int course_hours;
    private int course_class_hold;
    private int course_hold;
}
