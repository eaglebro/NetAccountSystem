package com.lanou.controller;

import com.google.gson.Gson;
import com.lanou.bean.Cost;
import com.lanou.service.impl.CostServiceException;
import com.lanou.service.impl.CostServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nero on 18/7/16.
 */
@Controller
@RequestMapping("/cost")
public class CostController {
    @Resource
    private CostServiceImpl costServ;

    @RequestMapping("/list.do")
    public String list(Model model) {
        List<Cost> list = costServ.findAllCost();
        model.addAttribute("list", list);
        return "fee/fee_list";
    }

    @RequestMapping("/toAdd.do")
    public String toAdd() {
        return "fee/fee_add";
    }

    @RequestMapping("/add.do")
    @ResponseBody
    public String add(@RequestParam("cost") String str, Model model) {
        Gson gson = new Gson();
        Cost cost = gson.fromJson(str, Cost.class);
        try {
            costServ.insertCost(cost);
            List<Cost> list = costServ.findAllCost();
            model.addAttribute("list", list);
            return "";
        } catch (CostServiceException e) {
            model.addAttribute("errorMsg", e.getMessage());
            return e.getMessage();
        }
    }

    @RequestMapping("/delete.do")
    public String delete(@Param("cost_id") String cost_id, Model model) {
        costServ.deleteById(cost_id);
        List<Cost> list = costServ.findAllCost();
        model.addAttribute("list", list);
        return "fee/fee_list";
    }

    @RequestMapping("/toModi.do")
    public String toModi(@Param("cost_id") String cost_id, Model model) {
        Cost cost = costServ.findById(cost_id);
        model.addAttribute("cost", cost);
        return "fee/fee_modi";
    }

    @RequestMapping("/modi.do")
    public String modi(Cost cost, Model model) {
        System.out.println(cost);
        try {
            costServ.modifyById(cost);
        } catch (CostServiceException e) {
            model.addAttribute("errorMsg", e.getMessage());
            e.printStackTrace();
            return "fee/fee_modi";
        }
        List<Cost> list = costServ.findAllCost();
        model.addAttribute("list", list);
        return "fee/fee_list";
    }
}
