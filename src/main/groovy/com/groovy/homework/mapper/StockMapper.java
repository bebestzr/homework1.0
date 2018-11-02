package com.groovy.homework.mapper;

import com.groovy.homework.domain.StockRecord;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface StockMapper {

    @Select("select * from stock_record")
    List<StockRecord> findAll();

    @Select("select * from stock_record where goods_name like #{goodsName}")
    List<StockRecord> findByName(@Param("goodsName") String goodsName);

    @Insert("insert into stock_record " +
            "set goods_name=#{stockRecord.goodsName}," +
            "goods_code = #{stockRecord.goodsCode}," +
            "goods_color= #{stockRecord.goodsColor}," +
            "in_date = #{stockRecord.inDate}," +
            "expiry_date = #{stockRecord.expiryDate}," +
            "number = #{stockRecord.number}," +
            "distribute_number = #{stockRecord.distributeNumber}")
    void insertStockRecord(@Param("stockRecord") StockRecord stockRecord);

    @Update("update stock_record set distribute_number=distribute_number+#{number} where id=#{recordId}")
    void distributeAdd(@Param("recordId")long recordId,@Param("number") int number);

    @Update("update stock_record set distribute_number=distribute_number-#{number},number=number-#{number} where id=#{recordId}")
    void finished(@Param("recordId")long recordId,@Param("number") int number);

    @Update("update stock_record set number=number+#{number} where id=#{recordId}")
    void stockChange(@Param("recordId")long recordId,@Param("number") int number);
}
