package com.lanou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Nero on 18/7/17.
 */
@Controller
@RequestMapping("")
public class IndexController {
    @RequestMapping("/main.do")
    public String toMain(){
        return "/main";
    }
}