package com.groovy.homework.service;

import com.groovy.homework.domain.StockRecord;

import java.util.List;

public interface StockRecordService {
    List<StockRecord> findAll();

    List<StockRecord> findByName(String goodsName);

    void insertStockRecord(StockRecord stockRecord);

    void distributeAdd(long recordId, int number);

    void finished(long recordId, int number);

    void stockChange(long recordId, int number);
}
