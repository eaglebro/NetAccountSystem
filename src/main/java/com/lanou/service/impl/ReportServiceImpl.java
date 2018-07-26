package com.lanou.service.impl;

import com.lanou.bean.Account;
import com.lanou.service.ReportService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by Nero on 18/7/20.
 */
@Service
public class ReportServiceImpl implements ReportService {
    @Override
    public String readExcelFile(MultipartFile file) {
        String result = "";
        //创建处理EXCEL的类
        ReadExcel readExcel = new ReadExcel();
        //解析excel，获取上传的事件单
        List<Account> useList = readExcel.getExcelInfo(file);
        //至此已经将excel中的数据转换到list里面了,接下来就可以操作list,可以进行保存到数据库,或者其他操作,
        for (Account account : useList) {
            System.out.println(account);
        }
        //和你具体业务有关,这里不做具体的示范
        if (useList != null && !useList.isEmpty()) {
            result = "上传成功";
        } else {
            result = "上传失败";
        }
        return result;
    }
}

