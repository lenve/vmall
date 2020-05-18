package org.javaboy.vmall.appmanager.mapper;

import org.apache.ibatis.annotations.Param;
import org.javaboy.vmall.common.model.AppTabs;

import java.util.List;

public interface AppTabsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AppTabs record);

    int insertSelective(AppTabs record);

    AppTabs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppTabs record);

    int updateByPrimaryKeyWithBLOBs(AppTabs record);

    int updateByPrimaryKey(AppTabs record);

    List<AppTabs> getAllAppTabsByPage(@Param("page") Integer page, @Param("size") Integer size, @Param("name") String name, @Param("state") Integer state);

    Long getTotal(@Param("name") String name, @Param("state") Integer state);
}