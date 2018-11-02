package com.groovy.homework.service

import com.groovy.homework.domain.StockRecord
import com.groovy.homework.mapper.StockMapper
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.redis.core.RedisTemplate
import org.springframework.stereotype.Service

@Service
class StockRecordServiceImpl implements StockRecordService{
    @Autowired
    StockMapper stockMapper

    @Autowired
    RedisTemplate redisTemplate

    List<StockRecord> findAll(){
        List<StockRecord> list
        list = (List<StockRecord>)redisTemplate.opsForValue().get("all")
        if(!list){
            list = stockMapper.findAll()
            redisTemplate.opsForValue().set("redis","success")
        }
        return list
    }

    @Override
    List<StockRecord> findByName(String goodsName) {
        stockMapper.findByName(goodsName)
    }

    @Override
    void insertStockRecord(StockRecord stockRecord) {
        stockMapper.insertStockRecord(stockRecord)
    }

    @Override
    void distributeAdd(long recordId, int number) {
        stockMapper.distributeAdd(recordId,number)
    }

    @Override
    void finished(long recordId, int number) {
        stockMapper.finished(recordId,number)
    }

    @Override
    void stockChange(long recordId, int number) {
        stockMapper.stockChange(recordId,number)
    }
}
