package org.javaboy.vmall.appmanager.service;

import org.javaboy.vmall.appmanager.mapper.AppTabsMapper;
import org.javaboy.vmall.common.model.AppTabs;
import org.javaboy.vmall.common.model.RespPageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author 江南一点雨
 * @微信公众号 江南一点雨
 * @网站 http://www.itboyhub.com
 * @国际站 http://www.javaboy.org
 * @微信 a_java_boy
 * @GitHub https://github.com/lenve
 * @Gitee https://gitee.com/lenve
 */
@Service
public class AppTabsService {
    @Autowired
    AppTabsMapper appTabsMapper;

    public RespPageBean getAllAppTabsByPage(Integer page, Integer size, String name, Integer state) {
        page = (page - 1) * size;
        List<AppTabs> appTabsList = appTabsMapper.getAllAppTabsByPage(page, size, name, state);
        Long total = appTabsMapper.getTotal(name, state);
        RespPageBean pageBean = RespPageBean.ok(total, appTabsList);
        return pageBean;
    }

    public Integer addAppTabs(AppTabs appTabs) {
        appTabs.setLastUpdateTime(new Date());
        appTabs.setLastUpdate(SecurityContextHolder.getContext().getAuthentication().getName());
        //默认状态
        appTabs.setState(0);
        if (appTabs.getType() == 0) {
            appTabs.setStartTime(null);
            appTabs.setEndTime(null);
        }
        return appTabsMapper.insertSelective(appTabs);
    }
}
