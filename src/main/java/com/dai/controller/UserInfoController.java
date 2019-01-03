package com.dai.controller;

import com.dai.entity.UserInfo;
import com.dai.service.impl.UserInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")

public class UserInfoController {

    @Autowired
    UserInfoServiceImpl userInfoService;

    /**
     * 获取全部的用户信息
     *
     * @param pageIndex
     * @param model
     * @return
     */
    @RequestMapping(value = "/userinfos/{pageIndex}", method = RequestMethod.GET)
    public String queryAllUserInfo(@PathVariable(name = "pageIndex") int pageIndex, Model model) {
        int count = userInfoService.userAmount();
        List<UserInfo> userInfos = userInfoService.queryByIndex(pageIndex);
        //每页显示的用户信息数量
        int pageRow = userInfoService.getPageRow();
        model.addAttribute("userInfos", userInfos);
        //总的用户数量
        model.addAttribute("rowNumber", count);
        //当前页码
        model.addAttribute("pageIndex", pageIndex);
        //计算总页数
        int pageNumber = (count % pageRow == 0) ? (count / pageRow) : (count / pageRow + 1);
        model.addAttribute("pageNumber", pageNumber);
        return "/admin/showUserInfo";

    }

    /**
     * 跳转到添加用户界面
     *
     * @return
     */
    @RequestMapping(value = "/userinfos", method = RequestMethod.GET)
    public String jumpToAddUser() {
        return "/admin/addUserInfo";
    }

    /**
     * 添加用户信息
     *
     * @param userInfo
     * @return
     */
    @RequestMapping(value = "/userinfos", method = RequestMethod.POST)
    public String addUserInfo(UserInfo userInfo) {
        System.out.println(userInfo);
        userInfoService.addUser(userInfo);
        return "redirect:/user/userinfos/1";
    }

    /**
     * 根据用户的账号删除用户
     *
     * @param useraccount
     * @return
     */
    @RequestMapping(value = "/userinfos/del/{useraccount}", method = RequestMethod.GET)
    public String deleteUserInfo(@PathVariable("useraccount") String useraccount) {
        userInfoService.deleteUser(useraccount);
        return "redirect:/user/userinfos/1";
    }

    /**
     * 跳转到用户信息编辑界面
     *
     * @param useraccount
     * @param model
     * @return
     */
    @RequestMapping(value = "/userinfos/edit/{uaeraccount}", method = RequestMethod.GET)
    public String jumpToEditUser(@PathVariable("useraccount") String useraccount, Model model) {
        UserInfo userInfo = userInfoService.queryUser(useraccount);
        model.addAttribute("userInfo", userInfo);
        return "admin/editUserInfo";
    }

    /**
     * 修改用户信息
     *
     * @param userInfo
     * @return
     */
    @RequestMapping(value = "/userinfos/edit", method = RequestMethod.POST)
    public String editUserInfo(UserInfo userInfo) {
        userInfoService.updateUser(userInfo);
        return "redirect:/user/userinfos/1";
    }


    @RequestMapping(value = "/userinfos/search/{type}/{keyword}", method = RequestMethod.GET)
    public String searchByKeyWord(@PathVariable("type") String type,
                                  @PathVariable("keyword") String keyword, Model model) {
        List<UserInfo> userInfos = userInfoService.queryByKeyWord(type, keyword);
        model.addAttribute("userInfos", userInfos);
        return "redirect:/user/userinfos/1";
    }

    @RequestMapping("/userExist")
    public void checkExist(HttpServletResponse response, @RequestBody Map<String,String> map) {
        //查数据库
        String useraccount=map.get("useraccount");

        UserInfo userInfo = userInfoService.queryUser(useraccount);

        try {
            if (userInfo == null) {
                response.getWriter().print("false");
            }else{
                response.getWriter().print("true");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
