package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.TimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")//路径
public class UserController {
    @Resource//注入
    private UserService userService;

    @ResponseBody
    @RequestMapping("/queryAll")
    public List<User> queryAll(HttpServletRequest request){//查询所有
        List<User> query = userService.query();
        return query;
    }

    @ResponseBody
    @RequestMapping("/addUser")
    public void addUser(User user){//添加
        user.setId(UUID.randomUUID().toString().replace("-",""));
        userService.add(user);
    }

    @ResponseBody
    @RequestMapping("/updateUser")
    public void updateUser(User user,HttpSession session){//修改
        String id = (String)session.getAttribute("id");
        user.setId(id);
        System.out.println(user);
        userService.alter(user);
    }

    @ResponseBody
    @RequestMapping("/deleteUser")
    public void deleteUser(String id){//删除
        System.out.println(id);
        userService.remove(id);
    }

    @ResponseBody
    @RequestMapping("/selectById")
    public User selectById(String id, HttpSession session){//根据id查询
        User user = userService.queryById(id);
        session.setAttribute("id",id);
        return user;
    }

    @ResponseBody
    @RequestMapping("/queryLike")
    public List<User> queryLike(User user){//模糊查询
        List<User> users = userService.queryByLike(user);
        return users;
    }

    @ResponseBody
    @RequestMapping("/queryByPage")
    public HashMap<String, Object> queryByPage(Integer page,Integer rows){//分页查询
        /*
        * page     当前页
        * rows     数据
        * total    总页数
        * cont     总条数
        * */
        Integer start = (page-1)*rows;//起始条数
        List<User> users = userService.queryPage(start, rows);//数据
        int cont = userService.selectTotalNumber();//总条数
        int total = userService.selectTotalNumber()%rows==0?userService.selectTotalNumber()/rows:userService.selectTotalNumber()/rows+1;//总页数
        HashMap<String, Object> map = new HashMap<>();
        map.put("page",page);
        map.put("rows",users);
        map.put("total",total);
        map.put("records",cont);
        return map;
    }

    @ResponseBody
    @RequestMapping("/edit")
    public void edit(User user,String oper){
        if ("add".equals(oper)){
            try {
                int ageByBirth = TimeUtil.getAgeByBirth(user.getBirthday());
                user.setAge(ageByBirth);
            } catch (Exception e) {
                e.printStackTrace();
            }
            user.setId(UUID.randomUUID().toString().replace("-",""));
            userService.add(user);
        } else if ("edit".equals(oper)){
            try {
                int ageByBirth = TimeUtil.getAgeByBirth(user.getBirthday());
                user.setAge(ageByBirth);
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(user);
            userService.alter(user);
        } else if ("del".equals(oper)){
            String id = user.getId();
            userService.remove(id);
        }
    }

    @ResponseBody
    @RequestMapping("upload")
    public String upload(MultipartFile file, HttpSession session){
        //1. 获得 upload的路径
        String realPath = session.getServletContext().getRealPath("/upload/img");
        //2. 判断文件夹是否存在
        File file1 = new File(realPath);
        if(!file1.exists()){
            file1.mkdirs();
        }
        //3.获取文件真实名字
        String originalFilename = file.getOriginalFilename();

        //4. 为了防止同一个文件多次上传发生覆盖  拼接时间戳
        String name = new Date().getTime()+"_"+originalFilename;

        //5.文件上传
        try {
            file.transferTo(new File(realPath,name));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "上传成功";
    }
}
