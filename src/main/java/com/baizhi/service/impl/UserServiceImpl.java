package com.baizhi.service.impl;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
@Service(value = "userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<User> query() {//查询所有
        return userDao.selectAll();
    }

    @Override
    public void add(User user) {//添加
        System.out.println(user);
        userDao.insert(user);
    }

    @Override
    public void alter(User user) {//修改
        userDao.update(user);
    }

    @Override
    public void remove(String id) {//删除
        userDao.delete(id);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public User queryById(String id) {//根据id查询
        return userDao.selectById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<User> queryByLike(User user) {//模糊查询
        return userDao.selectByLike(user);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<User> queryPage(Integer page, Integer rows) {//分页查询
        return userDao.selectPage(page, rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public int selectTotalNumber() {//查询总条数
        return userDao.userTotalNumber();
    }
}
