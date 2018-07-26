package com.lanou.service;

import com.lanou.bean.Account;
import com.lanou.bean.AccountPage;
import com.lanou.service.exception.AccountException;

import java.util.List;

/**
 * Created by Nero on 18/7/18.
 */
public interface AccountService {
    List<Account> findAllAccount();
    List<Account> search(Account account);
    void changeStatusById(int account_id, String status);
    AccountPage findAccountByPage(AccountPage accountPage);
    void insertAccount(Account account) throws AccountException;
    Account findById(Account account);
    Account findByIdcard_no(Account account);
}
