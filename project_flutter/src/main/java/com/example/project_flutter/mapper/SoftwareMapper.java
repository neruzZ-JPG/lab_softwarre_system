package com.example.project_flutter.mapper;


import com.example.project_flutter.entity.Software;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 西云研究所
 * @date 2021/10/18
 */
@Mapper
public interface SoftwareMapper {
    @Select("select * from software")
    public List<Software> selectAllsoftwares();
}
