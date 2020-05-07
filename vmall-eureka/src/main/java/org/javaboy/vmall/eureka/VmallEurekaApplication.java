package org.javaboy.vmall.eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class VmallEurekaApplication {

    public static void main(String[] args) {
        SpringApplication.run(VmallEurekaApplication.class, args);
    }

}
