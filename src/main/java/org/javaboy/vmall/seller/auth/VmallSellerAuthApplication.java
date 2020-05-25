package org.javaboy.vmall.seller.auth;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "org.javaboy.vmall.seller.auth.mapper")
public class VmallSellerAuthApplication {

    public static void main(String[] args) {
        SpringApplication.run(VmallSellerAuthApplication.class, args);
    }

}
