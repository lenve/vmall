package org.javaboy.vmall.appmanager.controller;

import org.javaboy.vmall.appmanager.service.AppTabsService;
import org.javaboy.vmall.common.model.AppTabs;
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
@RequestMapping("/app/apptabs")
public class AppTabsController {
    @Autowired
    AppTabsService appTabsService;
    @GetMapping("/")
    public RespPageBean getAllAppTabsByPage(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, String name, Integer state) {
        return appTabsService.getAllAppTabsByPage(page, size, name, state);
    }

    @PostMapping("/")
    public RespBean addAppTabs(@RequestBody AppTabs appTabs) {
        if (appTabsService.addAppTabs(appTabs) == 1) {
            return RespBean.ok("添加成功");
        }
        return RespBean.error("添加失败");
    }
}
