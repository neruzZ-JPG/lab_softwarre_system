package com.example.project_flutter.mapper;

import com.example.project_flutter.entity.Department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author 西云研究所
 * @date 2021/10/22
 */
@Mapper
public interface DepartmentMapper {
    @Select("select * from department where department_id = #{department_id}")
    public Department selectDepartmentById(@Param("department_id")long department_id);
}
