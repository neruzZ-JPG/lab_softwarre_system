package com.example.project_flutter.controller;

import com.example.project_flutter.service.CourseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 西云研究所
 * @date 2021/10/23
 */
@RestController
public class CourseController {
    @Autowired
    private CourseService courseService;

    @GetMapping("/getAllCourses")
    public String getAllCourses(){
        return courseService.getAllCourses();
    }

    @PostMapping("/deleteCourseById")
    public void deleteCourseById(long course_id){
        courseService.deleteCourseById(course_id);
    }

    @PostMapping("updateCourse")
    public void updateCourse(long course_id,
                             long major_id,
                             String course_name,
                             String course_term,
                             int course_hours,
                             int course_class_hold,
                             int course_hold) {
        courseService.updateCourse(
                course_id,
                major_id,
                course_name,
                course_term,
                course_hours,
                course_class_hold,
                course_hold
        );
    }

    @GetMapping("/getSoftwaresNeededByCourse")
    public String getSoftwaresNeededByCourse(long course_id){
        return courseService.getSoftwaresNeededByCourse(course_id);
    }

    @PostMapping("/addCourse")
    public void addCourse(@Param("major_id")long major_id,
                          @Param("course_name") String course_name,
                          @Param("course_term")String course_term,
                          @Param("course_hours")int course_hours,
                          @Param("course_class_hold")int course_class_hold,
                          @Param("course_hold")int course_hold)
    {
        courseService.addCourse(major_id, course_name, course_term, course_hours, course_class_hold, course_hold);
    }
}
