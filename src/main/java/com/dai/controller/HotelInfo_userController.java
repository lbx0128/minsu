package com.dai.controller;

import com.dai.entity.Comment;
import com.dai.service.CommentService;
import com.dai.entity.HotelInfo;
import com.dai.service.HotelInfo_userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
@Controller
@RequestMapping("/user")
public class HotelInfo_userController {

    private final HotelInfo_userService hotelInfo_userService;
    private final CommentService commentService;
    @Autowired
    public HotelInfo_userController(HotelInfo_userService hotelInfo_userService,CommentService commentService) {
        this.hotelInfo_userService = hotelInfo_userService;
        this.commentService = commentService;
    }
    /**
     * 根据城市查询数据
     * @param hotelcity
     * @return
     */
    @RequestMapping(value = "/search_city/{hotelcity}", method =
            RequestMethod.GET)
    public String searchBYcity(@PathVariable("hotelcity") String hotelcity,
                                         Model model) {
        List<HotelInfo> hotelInfos = hotelInfo_userService.queryByCity(hotelcity);
        model.addAttribute("hotelInfos", hotelInfos);
        return "jsp/searchresult";
    }
    /**
     * 根据hotelId查询数据
     * @param hotelId
     * @return
     */
    @RequestMapping(value = "/particulars/{hotelId}", method =
            RequestMethod.GET)
    public String searchById(@PathVariable(name = "hotelId") int hotelId,
                                         Model model) {
        HotelInfo hotelInfos = hotelInfo_userService.queryById(hotelId);
        model.addAttribute("hotelInfos", hotelInfos);
        List<Comment> commentInfos = commentService.queryAllComment(hotelId);
        model.addAttribute("commentInfos", commentInfos);
        return "jsp/particulars";
    }

}
