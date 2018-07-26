package com.lanou.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Nero on 18/7/20.
 */
public interface ReportService {
    /**
     * 读取excel中的数据,生成list
     */
    String readExcelFile(MultipartFile file);
}
