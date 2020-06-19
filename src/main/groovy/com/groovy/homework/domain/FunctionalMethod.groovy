package com.groovy.homework.domain

import java.time.LocalDateTime

/**
 * 描述
 *
 * @author 张忍* @since 0.0.1* @date 2020/6/20
 */
class FunctionalMethod {
    Long id
    LocalDateTime date //日期
    String week        //星期
    Integer getUpEarly //早起(6：30)
    Integer sleepEarly //早睡(23:00)
    Integer cookBySelf //自己做饭(一餐)
    Integer speakFluentlyAndLoudly //流利大声的说话
    Integer asexual    //无性
    Integer studyForAnHour //学习一小时
    Integer studyForTwoHour //学习两小时
    Integer studyForThreeHour //学习三小时
    Integer studyForFourHour //学习四小时
    Integer exerciseForFourHour //运动一小时
    Integer totalOfThisWeek  //本周总和
    Integer totalOfThisMonth //本月总和
    Integer totalOfThisYear  //本年总和
    Integer totalOfAll  //所有总和

}
