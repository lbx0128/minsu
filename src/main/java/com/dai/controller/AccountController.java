package com.dai.controller;

import com.dai.entity.UserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 关于账号的登陆、注册等
 * @author hero 2018/12/31
 */
@Controller
@RequestMapping("account")
public class AccountController {

    /**
     * 处理登陆请求, 需要用到用户管理的接口
     * @return
     */
    @RequestMapping("login")
    @ResponseBody
    public Map<String, String> doLogin(HttpServletRequest request,
                          HttpServletResponse response, String name,
                          String password) {
        Map<String, String> json = new HashMap<>();
        if ("admin".equals(name) && "123456".equals(password)) {
            request.getSession(true).setAttribute("userInfo", new UserInfo());
//            return "redirect:/hotel/hotelinfos/1";
            json.put("status", "success");
            json.put("admin", "0");

        }
        else {
            json.put("status", "fail");
            json.put("admin", "0");
        }
        return json;
    }
}
