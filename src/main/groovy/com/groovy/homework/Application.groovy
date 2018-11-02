package com.groovy.homework

import org.mybatis.spring.annotation.MapperScan
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.builder.SpringApplicationBuilder
import org.springframework.boot.web.support.SpringBootServletInitializer

/**
 * Created by jack on 2017/4/15.
 */
@SpringBootApplication
@MapperScan('com.groovy.homework.mapper')
class Application extends SpringBootServletInitializer{
    static void main(String[] args) {
        SpringApplication.run(Application.class, args)
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Application.class)
    }
}
