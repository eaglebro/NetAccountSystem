package com.lanou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Nero on 18/7/16.
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @RequestMapping("/login.do")
    public String login(){
        System.out.println("login");
        return "main";
    }
}
