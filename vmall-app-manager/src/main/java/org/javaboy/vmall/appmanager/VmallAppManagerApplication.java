package org.javaboy.vmall.appmanager;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "org.javaboy.vmall.appmanager.mapper")
public class VmallAppManagerApplication {

    public static void main(String[] args) {
        SpringApplication.run(VmallAppManagerApplication.class, args);
    }

}
