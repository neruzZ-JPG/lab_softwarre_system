package com.example.project_flutter.mapper;

import com.example.project_flutter.entity.Major;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author 西云研究所
 * @date 2021/10/23
 */
@Mapper
public interface MajorMapper {

    @Select("select * from major where major_id = #{major_id}")
    public Major selectMajorById(@Param("major_id") long major_id);
}
