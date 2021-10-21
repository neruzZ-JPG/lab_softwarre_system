package com.example.project_flutter.mapper;


import com.example.project_flutter.entity.Location;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author 西云研究所
 * @date 2021/10/18
 */
@Mapper
public interface LocationMapper {
    @Select("select * from location where location_id = #{location_id}")
    public Location selectByLocationId(@Param("location_id")long location_id);
}
