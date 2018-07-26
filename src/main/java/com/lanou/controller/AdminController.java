package com.lanou.controller;

import com.lanou.bean.AdminListVO;
import com.lanou.service.IAdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nero on 18/7/26.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    IAdminService adminServiceImpl;

    @RequestMapping("/main")
    public String main(Model model){
        List<AdminListVO> list = adminServiceImpl.findAllAdminListVO();
        model.addAttribute("list", list);
        return "admin/admin_list";
    }

    @RequestMapping("add")
    public String add(){
        return "admin/admin_add";
    }


    @RequestMapping("/modi")
    public String modi(){
        return "admin/admin_modi";
    }
}
