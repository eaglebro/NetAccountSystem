package com.lanou.controller;

import com.lanou.bean.Account;
import com.lanou.bean.AccountPage;
import com.lanou.service.exception.AccountException;
import com.lanou.service.impl.AccountServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by Nero on 18/7/17.
 */
@Controller
@RequestMapping("/account")
public class AccountController {
    @Resource
    AccountServiceImpl accountServ;

    @RequestMapping("/main")
    private String toAccount(Model model) {
//        List<Account> list = service.findAllAccount();
//        model.addAttribute("list", list);
//        return "/account/account_list";
        AccountPage accountPage = new AccountPage();
        accountPage.setPageNum(1);
        accountPage = accountServ.findAccountByPage(accountPage);
        model.addAttribute("page", accountPage);
        return "/account/account_list";
    }

    @RequestMapping(value = "/search")
    private String search(AccountPage accountPage, Model model) {
//        List<Account> list = service.search(account);
//        model.addAttribute("list", list);
//        model.addAttribute("condition", account);
        AccountPage page = accountServ.findAccountByPage(accountPage);
        model.addAttribute("page", page);
        model.addAttribute("condition", accountPage);
        return "/account/account_list";
    }

    @RequestMapping(value = "/changeState")
    @ResponseBody
    private void changeState(@RequestParam int account_id, @RequestParam String status) {
        accountServ.changeStatusById(account_id, status);
    }

    @RequestMapping("/add")
    private String add() {
        return "/account/account_add";
    }

    @RequestMapping("/addPost")
    private String addPost(Account account, Model model) {
        try {
            accountServ.insertAccount(account);
            model.addAttribute("msg", "添加成功");
            return toAccount(model);
        } catch (AccountException e) {
            model.addAttribute("errorMsg", e.getMessage());
            model.addAttribute("account", account);
            model.addAttribute("flag", true);
            return "/account/account_add";
        }
    }

    @RequestMapping("/detail")
    private String detail(String account_id, Model model) {
        Account account = new Account();
        account.setAccount_id(account_id);
        account = accountServ.findById(account);
        model.addAttribute("account", account);
        return "/account/account_detail";
    }
}