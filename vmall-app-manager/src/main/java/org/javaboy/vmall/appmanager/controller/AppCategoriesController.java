package org.javaboy.vmall.appmanager.controller;

import org.javaboy.vmall.appmanager.service.AppCategoriesService;
import org.javaboy.vmall.common.model.AppCategories;
import org.javaboy.vmall.common.model.RespBean;
import org.javaboy.vmall.common.model.RespPageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 江南一点雨
 * @微信公众号 江南一点雨
 * @网站 http://www.itboyhub.com
 * @国际站 http://www.javaboy.org
 * @微信 a_java_boy
 * @GitHub https://github.com/lenve
 * @Gitee https://gitee.com/lenve
 */
@RestController
@RequestMapping("/app/categories")
public class AppCategoriesController {
    @Autowired
    AppCategoriesService appCategoriesService;

    @PostMapping("/")
    public RespBean addAppCategories(@RequestBody AppCategories appCategories) {
        if (appCategoriesService.addAppCategories(appCategories) == 1) {
            return RespBean.ok("添加成功");
        } else {
            return RespBean.error("添加失败");
        }
    }

    @GetMapping("/")
    public RespPageBean getAllAppcategoriesByPage(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, Integer state, Integer type, String name) {
        RespPageBean respPageBean = appCategoriesService.getAllAppcategoriesByPage(page, size, state, type, name);
        return respPageBean;
    }

}
