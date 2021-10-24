package com.example.project_flutter.mapper;

import com.example.project_flutter.entity.Course;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 西云研究所
 * @date 2021/10/23
 */
@Mapper
public interface CourseMapper {

    @Select("select * from course")
    public List<Course> selectAllCourses();
}
