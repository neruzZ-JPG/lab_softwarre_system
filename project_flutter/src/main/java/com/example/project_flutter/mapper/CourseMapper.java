package com.example.project_flutter.mapper;

import com.example.project_flutter.entity.Course;
import com.example.project_flutter.entity.Software;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 西云研究所
 * @date 2021/10/23
 */
@Mapper
public interface CourseMapper {

    @Select("select * from course")
    public List<Course> selectAllCourses();

    @Delete("delete from course where course_id = #{course_id}")
    public int deleteCourse(@Param("course_id") long course_id);

    @Update("update course " +
            "set " +
            "major_id = #{major_id}, " +
            "course_name = #{course_name}," +
            "course_term = #{course_term}," +
            "course_hours = #{course_hours}," +
            "course_class_hold = #{course_class_hold}," +
            "course_hold = #{course_hold} " +
            "where course_id = #{course_id}")
    public int updateCourse(@Param("course_id") long course_id,
                            @Param("major_id")long major_id,
                            @Param("course_name") String course_name,
                            @Param("course_term")String course_term,
                            @Param("course_hours")int course_hours,
                            @Param("course_class_hold")int course_class_hold,
                            @Param("course_hold")int course_hold);

    @Update("insert into course" +
            "(course_id, major_id, course_name, course_term, course_hours, course_class_hold, course_hold)" +
            "values" +
            "(#{course_id}, #{major_id}, #{course_name}, #{course_term}, #{course_hours}, " +
            "#{course_class_hold}, #{course_hold})")
    public int insertCourse(@Param("course_id") long course_id,
                            @Param("major_id")long major_id,
                            @Param("course_name") String course_name,
                            @Param("course_term")String course_term,
                            @Param("course_hours")int course_hours,
                            @Param("course_class_hold")int course_class_hold,
                            @Param("course_hold")int course_hold);

    @Select("select software_id from course_need_software where course_id = #{course_id}")
    public List<Integer> selectSoftwaresByCourseId(@Param("course_id")long course_id);

    @Select("select * from course, user_course " +
            "where course.course_id = user_course.course_id " +
            "and user_course.user_id = #{user_id}")
    public List<Course> selectCourseByUserId(@Param("user_id")long user_id);
}
