package com.lanou.service.impl;

import com.lanou.bean.Account;
import com.lanou.bean.AccountPage;
import com.lanou.dao.AccountMapper;
import com.lanou.service.AccountService;
import com.lanou.service.exception.AccountException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Nero on 18/7/18.
 */
@Service
public class AccountServiceImpl implements AccountService {
    @Resource
    AccountMapper mapper;

    @Override
    public List<Account> findAllAccount() {
        return mapper.findAllAccount();
    }

    @Override
    public List<Account> search(Account account) {
        return mapper.criteriaQuery(account);
    }

    @Override
    public void changeStatusById(int account_id, String status) {
        Account account = new Account();
        account.setAccount_id(String.valueOf(account_id));
        mapper.updateStatusById(account_id, status);
        switch (status) {
            case "1":
                break;
            case "2":
                account.setPause_date(TimeUtil.getCurrentTime());
                break;
            case "0":
                account.setClose_date(TimeUtil.getCurrentTime());
                break;
        }
        mapper.updateTimesById(account);
    }

    @Override
    // 传进来的参数应该有pageNum 每页的条数固定为6 可在AccountPage类中修改
    public AccountPage findAccountByPage(AccountPage accountPage) {
        // 如果没有初始化 就是第一页
        if (accountPage.getPageNum() == 0) {
            accountPage.setPageNum(1);
        }

        // 设置总条数
        int total = mapper.countByPage(accountPage);
        accountPage.setTotal(total);
        // 设置总页数
        int pages = (int) Math.ceil(1.0 * total / accountPage.getPageSize());
        accountPage.setPages(pages);
        // 设置起始行数 查询要用到
        int startRow = (accountPage.getPageNum() - 1) * accountPage.getPageSize();
        accountPage.setStartRow(startRow);
        // 设置导航条
        int[] navigatepageNums = new int[pages];
        for (int i = 0; i < pages; i++) {
            navigatepageNums[i] = i + 1;
        }
        accountPage.setNavigatepageNums(navigatepageNums);
        // 是否是首尾两页
        accountPage.setIzFirstPage(accountPage.getPageNum() == 1);
        accountPage.setIzLastPage(accountPage.getPageNum() == accountPage.getPages());
        // 前后两页
        accountPage.setPrePage(accountPage.getPageNum() - 1);
        accountPage.setNextPage(accountPage.isIzLastPage()
                ? accountPage.getPageNum() : accountPage.getPageNum() + 1);
        // 查询结果放在accountPage中
        List<Account> list = mapper.findAccountByPage(accountPage);
        accountPage.setList(list);
//        System.out.println(accountPage);
        return accountPage;
    }

    @Override
    public void insertAccount(Account account) throws AccountException {
        Account found = mapper.findByLogin_name(account);
        if (found != null) {
            throw new AccountException("登录名已存在");
        } else {
            account.setStatus("1");
            account.setCreate_date(TimeUtil.getCurrentTime());
            if (account.getRecommender_id().isEmpty()){
                account.setRecommender_id(null);
            }
            mapper.insertAccount(account);
        }
    }

    @Override
    public Account findById(Account account) {
        return mapper.findById(account);
    }

    @Override
    public Account findByIdcard_no(Account account) {
        return mapper.findByIdcard_no(account);
    }
}
