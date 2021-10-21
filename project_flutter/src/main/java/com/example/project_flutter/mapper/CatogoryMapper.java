package com.example.project_flutter.mapper;


import com.example.project_flutter.entity.Catogory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author 西云研究所
 * @date 2021/10/18
 */
@Mapper
public interface CatogoryMapper {
    @Select("select * from catogory where catogory_id = #{catogory_id}")
    public Catogory selectByCatogoryId(@Param("catogory_id")long id);
}
