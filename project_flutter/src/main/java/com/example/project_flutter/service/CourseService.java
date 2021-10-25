package com.example.project_flutter.service;

import com.alibaba.fastjson.JSON;
import com.example.project_flutter.common.Result;
import com.example.project_flutter.entity.Course;
import com.example.project_flutter.entity.Software;
import com.example.project_flutter.mapper.CourseMapper;
import com.example.project_flutter.mapper.SoftwareMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 西云研究所
 * @date 2021/10/23
 */
@Service
public class CourseService {
    @Autowired
    private CourseMapper courseMapper;

    @Autowired
    private SoftwareMapper softwareMapper;

    public String getAllCourses() {
        List<Course> courses = courseMapper.selectAllCourses();
        Result res = new Result(true, 200, null, courses);
        return JSON.toJSONString(res);
    }

    public void deleteCourseById(long course_id) {
        System.out.println(course_id);
        System.out.println("deleted:" + courseMapper.deleteCourse(course_id));
    }

    public void updateCourse(long course_id,
                             long major_id,
                             String course_name,
                             String course_term,
                             int course_hours,
                             int course_class_hold,
                             int course_hold) {
        courseMapper.updateCourse(
                course_id,
                major_id,
                course_name,
                course_term,
                course_hours,
                course_class_hold,
                course_hold
        );
    }

    public String getSoftwaresNeededByCourse(long course_id){
        List<Integer> integers = courseMapper.selectSoftwaresByCourseId(course_id);
        ArrayList<Software> softwares = new ArrayList<Software>();
        for(Integer i : integers){
            Software software = softwareMapper.selectSoftwareById(i);
            softwares.add(software);
        }
        Result res = new Result(true, 200, null, softwares);
        return JSON.toJSONString(res);
    }

    public void addCourse(@Param("major_id")long major_id,
                          @Param("course_name") String course_name,
                          @Param("course_term")String course_term,
                          @Param("course_hours")int course_hours,
                          @Param("course_class_hold")int course_class_hold,
                          @Param("course_hold")int course_hold)
    {
        List<Course> courses = courseMapper.selectAllCourses();
        long index = courses.get(courses.size()-1).getCourse_id();
        System.out.println(index);
        System.out.println(major_id);
        System.out.println(course_name);
        System.out.println(course_term);
        courseMapper.insertCourse(index+1, major_id, course_name, course_term, course_hours, course_class_hold, course_hold);
    }
}
