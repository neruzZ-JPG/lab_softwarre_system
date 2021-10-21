package com.example.project_flutter.mapper;


import com.example.project_flutter.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 西云研究所
 * @date 2021/10/18
 */
@Mapper
public interface UserMapper {
    @Select("select * from user")
    public List<User> selectAllUsers();
    @Select("select * from user where user.user_account = #{user_account}")
    public User selectByAccount(@Param("user_account")String account);
    @Select("select user_id, user_name from user where user.user_id = #{user_id}")
    public User selectByUserId(@Param("user_id")long user_id);
}
