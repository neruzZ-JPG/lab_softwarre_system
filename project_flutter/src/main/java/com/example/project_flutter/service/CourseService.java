package com.example.project_flutter.service;

import com.alibaba.fastjson.JSON;
import com.example.project_flutter.common.Result;
import com.example.project_flutter.entity.Course;
import com.example.project_flutter.mapper.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 西云研究所
 * @date 2021/10/23
 */
@Service
public class CourseService {
    @Autowired
    private CourseMapper courseMapper;

    public String getAllCourses(){
        List<Course> courses = courseMapper.selectAllCourses();
        Result res = new Result(true, 200, null, courses);
        return JSON.toJSONString(res);
    }
}
