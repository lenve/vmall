package org.javaboy.vmall.appmanager.service;

import org.javaboy.vmall.appmanager.mapper.AppCategoriesMapper;
import org.javaboy.vmall.common.model.AppCategories;
import org.javaboy.vmall.common.model.RespPageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @作者 江南一点雨
 * @微信公众号 江南一点雨
 * @网站 http://www.itboyhub.com
 * @国际站 http://www.javaboy.org
 * @微信 a_java_boy
 * @GitHub https://github.com/lenve
 * @Gitee https://gitee.com/lenve
 */
@Service
public class AppCategoriesService {
    @Autowired
    AppCategoriesMapper appCategoriesMapper;

    public Integer addAppCategories(AppCategories appCategories) {
        appCategories.setLastUpdateTime(new Date());
        appCategories.setLastUpdate(SecurityContextHolder.getContext().getAuthentication().getName());
        return appCategoriesMapper.insertSelective(appCategories);
    }

    public RespPageBean getAllAppcategoriesByPage(Integer page, Integer size, Integer state, Integer type, String name) {
        page = (page - 1) * size;
        List<AppCategories> data = appCategoriesMapper.getAllAppcategoriesByPage(page, size, state, type, name);
        Long total = appCategoriesMapper.getTotal(state, type, name);
        return RespPageBean.ok(total, data);
    }
}
