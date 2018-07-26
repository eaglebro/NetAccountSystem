package com.lanou.controller;

import com.github.pagehelper.PageInfo;
import com.lanou.bean.*;
import com.lanou.service.ServizeService;
import com.lanou.service.impl.AccountServiceImpl;
import com.lanou.service.impl.CostServiceImpl;
import com.lanou.service.impl.HostServiceImpl;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Nero on 18/7/21.
 */
@Controller
@RequestMapping("/service")
public class ServizeController {
    @Resource
    @Qualifier("service")
    ServizeService servizeServ;

    @Resource
    AccountServiceImpl accountServ;

    @Resource
    CostServiceImpl costServ;

    @Resource
    HostServiceImpl hostServ;


    @RequestMapping("/main")
    public String main(Model model) {
//        List<ServiceVO> list = servizeServ.findAllServiceVO();
        PageInfo<ServiceVO> list = servizeServ.findAllServiceVOByPage(1);
        ServiceVO serviceVO = new ServiceVO();
        model.addAttribute("condition", serviceVO);
        model.addAttribute("pageInfo", list);
        return "/service/service_list";
    }

    @RequestMapping("/search")
    private String search(ServiceVOPage serviceVOPage, Model model) {
//        System.out.println("serviceVO: " + serviceVOPage + "\n page" + serviceVOPage.getPageNum());
        model.addAttribute("condition", serviceVOPage);
//        PageInfo<ServiceVO> list = servizeServ.findAllServiceVOByPage(pageNum);
        PageInfo<ServiceVO> list = servizeServ.criteriaQueryByPage(serviceVOPage, serviceVOPage.getPageNum());
        model.addAttribute("pageInfo", list);
        return "/service/service_list";
    }

    @RequestMapping("/add")
    private String add(Model model) {
        model.addAttribute("list", costServ.findAllCost());
        model.addAttribute("host", hostServ.findAllHost());
        return "/service/service_add";
    }

    @RequestMapping("/identify")
    @ResponseBody
    private Map<String, String> indentify(String idcard_no) {
//        System.out.println(idcard_no);
        Map<String, String> map = new HashMap<>();
        map.put("errorMsg", "");
        map.put("login_name", "");
        map.put("account_id", "");
        Account account = new Account();
        account.setIdcard_no(idcard_no);
        Account found = accountServ.findByIdcard_no(account);
        System.out.println(found);
        if (found != null) {
            map.put("login_name", found.getLogin_name());
            map.put("account_id", found.getAccount_id());
        } else {
            map.put("errorMsg", "身份证未找到");
        }
        return map;
    }

    @RequestMapping("/addPost")
    @ResponseBody
    private Map<String, String> addPost(@RequestBody ServicePO servicePO) {
//        System.out.println("servicePO: "+ servicePO);
        servizeServ.insertService(servicePO);
//        System.out.println("插入成功");
        Map<String, String> map = new HashMap<>();
        map.put("success", "1");
        return map;
    }

    @RequestMapping(value = "/changeStatus")
    @ResponseBody
    private void changeStatus(@RequestParam int service_id, @RequestParam String status) {
//        System.out.println("service_id: " + service_id + "status: " + status);
        servizeServ.setStatusById(service_id, status);
    }

    @RequestMapping("/modify")
    private String modify(String service_id, Model model){
        List<Cost> costList = costServ.findAllCost();
        ServiceVO serviceVO = servizeServ.findServiceById(service_id);
        model.addAttribute("service", serviceVO);
        model.addAttribute("costList", costList);
        return "/service/service_modi";
    }

    @RequestMapping("modifyPost")
    public String modifyPost(ServiceModifyVO serviceModifyVO, Model model){
//        System.out.println(serviceModifyVO);
        servizeServ.updateCostById(serviceModifyVO);
        return main(model);
    }
}
