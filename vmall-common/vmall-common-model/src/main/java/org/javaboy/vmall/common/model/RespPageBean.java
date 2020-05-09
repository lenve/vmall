package org.javaboy.vmall.common.model;

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
public class RespPageBean {
    private Long total;
    private List<?> data;
    private Integer status;

    public static RespPageBean ok(Long total, List<?> data) {
        return new RespPageBean(total, data, 200);
    }

    private RespPageBean() {
    }

    private RespPageBean(Long total, List<?> data, Integer status) {
        this.total = total;
        this.data = data;
        this.status = status;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
