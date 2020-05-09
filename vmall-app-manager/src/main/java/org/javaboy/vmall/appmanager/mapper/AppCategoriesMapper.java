package org.javaboy.vmall.appmanager.mapper;

import org.apache.ibatis.annotations.Param;
import org.javaboy.vmall.common.model.AppCategories;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface AppCategoriesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AppCategories record);

    int insertSelective(AppCategories record);

    AppCategories selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppCategories record);

    int updateByPrimaryKey(AppCategories record);

    List<AppCategories> getAllAppcategoriesByPage(@Param("page") Integer page, @Param("size") Integer size, @Param("state") Integer state, @Param("type") Integer type, @Param("name") String name);

    Long getTotal(@Param("state") Integer state, @Param("type") Integer type, @Param("name") String name);
}