package org.javaboy.vmall.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@SpringBootApplication
@EnableZuulProxy
public class VmallGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(VmallGatewayApplication.class, args);
    }

}
