package com.baizhi;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class) //在容器下测试(测试时启动容器)
@SpringBootTest(classes = UserbootApplication.class)
public class UserbootApplicationTests {
    @Autowired
    private UserDao userDao;
    @Autowired
    private UserService userService;

    @Test
    public void test1(){
        for (int i =0;i<5;i++) {
            User user = userService.queryById("10");
            System.out.println(user);
        }
    }
}

