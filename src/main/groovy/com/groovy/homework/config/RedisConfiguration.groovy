package com.groovy.homework.config

import groovy.transform.CompileStatic
import org.springframework.cache.annotation.CachingConfigurerSupport
import org.springframework.cache.annotation.EnableCaching
import org.springframework.context.annotation.Configuration


/**
 * 描述
 *
 * @author 张忍
 * @since 0.0.1
 * @date 2018/10/26
 */
@CompileStatic
@Configuration
@EnableCaching
class RedisConfiguration extends CachingConfigurerSupport{


}

