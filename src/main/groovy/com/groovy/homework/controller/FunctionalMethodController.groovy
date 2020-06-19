package com.groovy.homework.controller

import com.groovy.homework.domain.StockRecord
import com.groovy.homework.service.StockRecordService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.*

@Controller
class FunctionalMethodController {

    @Autowired
    StockRecordService stockRecordService

    @GetMapping("all")
    String findAll(Model model){
        List<StockRecord> stockRecords = stockRecordService.findAll()
        model.addAttribute("all",stockRecords)
        "stockrecords/index"
    }

    @GetMapping("findByName")
    String findByName(Model model,@RequestParam(value = "goodsName", required = false) String goodsName){
        List<StockRecord> stockRecords = stockRecordService.findByName("%"+goodsName+"%")
        model.addAttribute("all",stockRecords)
        "stockrecords/index"
    }

    @GetMapping("add")
    String addRecord(){
        "stockrecords/add"
    }

    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    String insert(@ModelAttribute StockRecord record){
        record.setInDate(new Date())
        stockRecordService.insertStockRecord(record)
        "redirect:/all"
    }

    @RequestMapping(value = "/distribute",method = RequestMethod.GET)
    String distributeAdd(@RequestParam(value = "recordId", required = false) Long recordId,
                         @RequestParam(value = "number", required = false) Integer number){
        stockRecordService.distributeAdd(recordId,number)
        "redirect:/all"
    }

    @RequestMapping(value = "/finished",method = RequestMethod.GET)
    String finished(@RequestParam(value = "recordId", required = false) Long recordId,
                         @RequestParam(value = "number", required = false) Integer number){
        stockRecordService.finished(recordId,number)
        "redirect:/all"
    }

    @RequestMapping(value = "/stockChange",method = RequestMethod.GET)
    String stockChange(@RequestParam(value = "recordId", required = false) Long recordId,
                         @RequestParam(value = "number", required = false) Integer number){
        stockRecordService.stockChange(recordId,number)
        "redirect:/all"
    }
}
