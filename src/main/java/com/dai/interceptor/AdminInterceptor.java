package com.dai.interceptor;

import com.dai.entity.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author hero 2018/12/31
 */
public class AdminInterceptor implements HandlerInterceptor {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        //检查当前sessions是否有登录用户
        UserInfo user = (UserInfo) request.getSession().getAttribute(
                "userInfo");
        if(user != null) {
            return true;
        } else {
            response.sendRedirect(request.getContextPath()+"/login" +
                    ".jsp");
        }
        return false;
    }

    @Override
    public void postHandle(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        logger.info("postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e) throws  Exception{
        logger.info("spring拦截结束执行");
    }
}