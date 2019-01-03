package com.dai.controller;

import com.dai.entity.HotelInfo;
import com.dai.service.HotelInfoService;
import com.dai.service.impl.HotelInfoServiceImpl;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author hero 2018/12/29
 */
@Controller
@RequestMapping("/hotel")
public class HotelInfoController {

    private final HotelInfoService hotelInfoService;

    @Autowired
    public HotelInfoController(HotelInfoService hotelInfoService) {
        this.hotelInfoService = hotelInfoService;
    }

    /**
     * 获取全部旅馆
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/hotelinfos/{pageIndex}", method =
            RequestMethod.GET)
    public String queryAllHotelInfo(@PathVariable(name = "pageIndex") int pageIndex, Model model) {
        int count = hotelInfoService.queryCount();
        List<HotelInfo> hotelInfos = hotelInfoService.queryByIndex(pageIndex);
        // 每页数据量
        int pageRow = HotelInfoServiceImpl.getPageRow();
        model.addAttribute("hotelInfos", hotelInfos);
        // 数据总数
        model.addAttribute("rowNumber", count);
        // 当前页码
        model.addAttribute("pageIndex", pageIndex);
        // 计算总页数
        int pageNumber = (count % pageRow == 0) ? (count / pageRow) :
                (count / pageRow + 1);
        model.addAttribute("pageNumber", pageNumber);
        // 搜索类型
        Map<String, String> searchType = new HashMap<>();
        searchType.put("ownername", "房东姓名");
        searchType.put("ownerphone", "房东手机号");
        searchType.put("hoteladdress", "地址");

        model.addAttribute("searchType", searchType);
        return "/admin/showHotelInfo";
    }

    /**
     * Get请求, 跳转到新增房源信息界面
     * @return
     */
    @RequestMapping(value = "/hotelinfos", method = RequestMethod.GET)
    public String jumpToAddHotel() {
        return "/admin/addHotelInfo";
    }

    /**
     * 创建一个新房间
     * @param hotelInfo 包含创建一个房间所需的信息
     * @return
     */
    @RequestMapping(value = "/hotelinfos", method = RequestMethod.POST)
    public String addHotelInfo(HotelInfo hotelInfo,
                               @RequestParam("hotelImageName") MultipartFile filePath) {
        uploadImage(hotelInfo, filePath);
        int res = hotelInfoService.addHotelInfo(hotelInfo);
        return "redirect:/hotel/hotelinfos/1";
    }

    /**
     * 房源信息的删除
     * @param hotelInfoId 待删除的id
     * @return
     */
    @RequestMapping(value = "/hotelinfos/del/{hotelInfoId}", method =
            RequestMethod.GET)
    public String deleteHotelInfo(@PathVariable("hotelInfoId") int hotelInfoId) {
        int res = hotelInfoService.deleteHotelInfo(hotelInfoId);
        return "redirect:/hotel/hotelinfos/1";
    }

    /**
     * GET 请求跳转到编辑房源信息页面
     * @param hotelInfoId
     * @return
     */
    @RequestMapping(value = "/hotelinfos/edit/{hotelInfoId}", method = RequestMethod.GET)
    public String editHotelInfo(@PathVariable("hotelInfoId") int hotelInfoId,
                                Model model) {
        // 首先把待修改的房源信息取到, 用作初始化编辑页面
        HotelInfo hotelInfo = hotelInfoService.queryById(hotelInfoId);
        model.addAttribute("hotelInfo", hotelInfo);
        return "admin/editHotelInfo";
    }

    /**
     * POST 请求, 修改房源信息
     * @param hotelInfo
     * @return
     */
    @RequestMapping(value = "/hotelinfos/edit", method = RequestMethod.POST)
    public String editHotelInfo(HotelInfo hotelInfo, @RequestParam("hotelImageName") MultipartFile filePath) {
        uploadImage(hotelInfo, filePath);
        int res = hotelInfoService.updateHotelInfo(hotelInfo);
        return "redirect:/hotel/hotelinfos/1";
    }

    /**
     * 根据关键字查询数据
     * @param type
     * @param keyword
     * @return
     */
    @RequestMapping(value = "/hotelinfos/search/{type}/{keyword}/{index}",
            method =
            RequestMethod.GET)
    public String searchByTypeAndKeyword(@PathVariable("type") String type,
                                         @PathVariable("keyword") String keyword,
                                         @PathVariable("index") int index,
                                            Model model) {
        List<HotelInfo> hotelInfo = hotelInfoService.queryByKeyword(type,
                keyword);
        // 每页数据量
        int pageRow = HotelInfoServiceImpl.getPageRow();
        // 总数据量
        int count = hotelInfo.size();
        // 分页数据
        List<HotelInfo> hotelInfos = new ArrayList<>();
        for (int i = (index-1)*pageRow; i < pageRow; i ++) {
            if ((index-1)*pageRow < count) {
                hotelInfos.add(hotelInfo.get(i));
            }
            else {
                break;
            }
        }
        model.addAttribute("hotelInfos", hotelInfos);
        // 数据总数
        model.addAttribute("rowNumber", count);
        // 当前页码
        model.addAttribute("pageIndex", index);
        // 计算总页数
        int pageNumber;
        if (count == 0 ) {
            pageNumber = 1;
        }
        else {
            pageNumber = (count % pageRow == 0) ? (count / pageRow) :
                    ((count / pageRow) + 1);
        }
        model.addAttribute("pageNumber", pageNumber);
        // 搜索后页面保持搜索内容
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);

        Map<String, String> searchType = new HashMap<>();
        searchType.put("ownername", "房东姓名");
        searchType.put("ownerphone", "房东手机号");
        searchType.put("hoteladdress", "地址");

        model.addAttribute("searchType", searchType);
        return "/admin/searchResult";
    }
    /**
     * 查询推荐信息
     * @return
     */
    @RequestMapping(value = "/recommend", method = RequestMethod.GET)
    public String querySixHotelInfo(Model model) {
        List<HotelInfo> hotelSixInfos = hotelInfoService.querySix();
        model.addAttribute("hotelSixInfos", hotelSixInfos);
        return "jsp/recommend";
    }

    public void uploadImage(HotelInfo hotelInfo, MultipartFile filePath) {
        hotelInfo.setHotelImage("../../image/" + filePath.getOriginalFilename());
        System.out.println(hotelInfo);
        String filename = filePath.getOriginalFilename();
        String path1 = "E:\\JetBrains\\IdeaProjects\\minsu\\src\\main\\webapp" +
                "\\WEB-INF\\image\\" + filename;
        String path2 = "E:\\JetBrains\\IdeaProjects\\minsu\\out\\artifacts" +
                "\\minsu_war_exploded\\WEB-INF\\image\\" + filename;
        try {
            File file1 = new File(path1);
            File file2 = new File(path2);

            if (file1.exists()) {
                file1.delete();
                file2.delete();
            }
            filePath.transferTo(file1);
            FileUtils.copyFile(file1, new File(path2));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
