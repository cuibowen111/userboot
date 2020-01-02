package com.baizhi.service;

import com.baizhi.entity.User;

import java.util.List;

public interface UserService {
    //查询所有
    public List<User> query();
    //添加
    public void add(User user);
    //修改
    public void alter(User user);
    //删除
    public void remove(String id);
    //根据id查询
    public User queryById(String id);
    //模糊查询
    public List<User> queryByLike(User user);
    //分页查询
    public List<User> queryPage(Integer page, Integer rows);
    //查询总条数
    public int selectTotalNumber();
}
