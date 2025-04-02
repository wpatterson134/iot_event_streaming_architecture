package com.dreamsoftware.iotframesingest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableConfigurationProperties(Properties.class)
public class IotframesingestApplication {

    public static void main(String[] args) {
        SpringApplication.run(IotframesingestApplication.class, args);
    }

}
