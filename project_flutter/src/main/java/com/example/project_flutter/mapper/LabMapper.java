package com.example.project_flutter.mapper;


import com.example.project_flutter.entity.Lab;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 西云研究所
 * @date 2021/10/18
 */
@Mapper
public interface LabMapper {
    @Select("select * from lab")
    public List<Lab> selectAllLabs();

    @Select("select * from lab where lab.user_id = #{user_id}")
    public List<Lab> selectLabByUserId(@Param("user_id")long user_id);
}
