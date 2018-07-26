package com.lanou.controller;

import com.lanou.bean.*;
import com.lanou.service.IModuleService;
import com.lanou.service.IRoleService;
import com.lanou.service.exception.RoleException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Nero on 18/7/24.
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Resource
    @Qualifier("roleService")
    private IRoleService roleServ;

    @Resource
    private IModuleService moduleServiceImpl;

    @RequestMapping("/main")
    public String main(Model model) {
        List<RoleVO> list = roleServ.findAllRoleVO();
//        System.out.println(list);
        model.addAttribute("list", list);
        return "/role/role_list";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        List<ModuleInfo> list = moduleServiceImpl.findAllModule();
        model.addAttribute("list", list);
        return "/role/role_add";
    }

    @RequestMapping("/addPost")
    private String addpost(AddRoleVO addRoleVO, Model model) {
        try {
            roleServ.addRole(addRoleVO);
            return main(model);
        } catch (RoleException e) {
            model.addAttribute("errorMsg", e.getMessage());
            return add(model);
        }
    }

    @RequestMapping("/modify")
    private String modify(String role_id, Model model) {
        String module_id = null;
        RoleVO roleVO = roleServ.findRoleVOById(role_id);

        // 增加了一个checked 的变量 用于前台的复选框
        List<ModuleInfo> allList = moduleServiceImpl.findAllModule();
        List<ModuleModiVO> VOList = new ArrayList<>();
        List<ModuleInfo> roleList = roleVO.getModuleInfoList();
        for (ModuleInfo moduleInfo : allList) {
            boolean flag = false;
            module_id = moduleInfo.getModule_id();
            ModuleModiVO moduleModiVO = new ModuleModiVO();
            moduleModiVO.setName(moduleInfo.getName());
            moduleModiVO.setModule_id(moduleInfo.getModule_id());
            for (ModuleInfo info : roleList) {
                if (module_id.equals(info.getModule_id())) {
                    flag = true;
                }
            }
            if (flag) {
                moduleModiVO.setChecked(true);
            }
            VOList.add(moduleModiVO);
        }
        model.addAttribute("roleVO", roleVO);
        model.addAttribute("list", VOList);
        model.addAttribute("role_id", role_id);
        return "/role/role_modi";
    }

    @RequestMapping("/modifyPost")
    @ResponseBody
    public Map modifyPost(@RequestBody AddRoleVO addRoleVO){
        System.out.println(addRoleVO);
        Map<String, String> map = new HashMap<>();
        map.put("errorMsg", "");
        map.put("success", "");
        try {
            roleServ.modifyRole(addRoleVO);
            map.put("success", "1");
        } catch (RoleException e) {
            map.put("errorMsg", e.getMessage());
//            e.printStackTrace();
        }
        return map;
    }
}