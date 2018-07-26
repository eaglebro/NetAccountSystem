package com.lanou.dao;

import com.lanou.bean.Account;
import com.lanou.bean.AccountPage;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Nero on 18/7/18.
 */
@Repository
public interface AccountMapper {
    void insertAccount(Account account);
    List<Account> findAllAccount();
    List<Account> criteriaQuery(Account account);
    void updateStatusById(@Param("account_id") int account_id, @Param("status") String status);
    void updateTimesById(Account account);
    List<Account> findAccountByPage(AccountPage accountPage);
    int countByPage(AccountPage accountPage);

    Account findById(Account account);
    Account findByLogin_name(Account account);
    Account findByIdcard_no(Account account);
}
