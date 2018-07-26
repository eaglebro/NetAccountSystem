package com.lanou.controller;

import com.lanou.bean.Account;
import com.lanou.service.impl.AccountServiceImpl;
import com.lanou.service.impl.ReportServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Field;
import java.util.List;

/**
 * Created by Nero on 18/7/20.
 */
@Controller
@RequestMapping("/report")
public class ReportController {
    @Resource
    ReportServiceImpl reportServ;
    @Resource
    AccountServiceImpl accountServ;

    @RequestMapping("/main")
    public String main() {
        return "/report/report_main";
    }

    @RequestMapping("/download")
    public void down(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ExportExcel<Account> exportExcel = new ExportExcel<>();
        Field[] fields = Account.class.getDeclaredFields();
        String[] headers = new String[fields.length];
        for (int i = 0; i < fields.length; i++) {
            headers[i] = fields[i].getName();
        }
        List<Account> accountList = accountServ.findAllAccount();
        exportExcel.exportExcel(headers, accountList, "importFile", response);
    }

    @RequestMapping(value="/upload",method = RequestMethod.POST)
    @ResponseBody
    public String  upload(@RequestParam(value="file",required = false)MultipartFile file, HttpServletRequest request, HttpServletResponse response){
        String result = reportServ.readExcelFile(file);
        return result;
    }
}