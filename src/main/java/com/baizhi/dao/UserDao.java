package com.baizhi.dao;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    //查询所有
    public List<User> selectAll();
    //添加
    public void insert(User user);
    //修改
    public void update(User user);
    //删除
    public void delete(@Param("id") String id);
    //根据id查询
    public User selectById(@Param("id") String id);
    //模糊查询
    public List<User> selectByLike(User user);
    //分页查询
    public List<User> selectPage(@Param("page") Integer page, @Param("rows") Integer rows);
    //查询总条数
    public int userTotalNumber();
}
