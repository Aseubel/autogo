package com.aseubel.autogo.controller;

import com.aliyuncs.exceptions.ClientException;
import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.utils.AliOSSUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Objects;
import java.util.UUID;

/**
 * @author aseubel
 * @description 文件controller
 * @date 2024/12/16
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/file")
public class FileController {

    @Autowired
    private AliOSSUtil aliOSSUtil;

    /**
     * 上传文件
     * @param file
     * @return
     * @throws ClientException
     */
    @PostMapping("/upload")
    public Response<String> upload(MultipartFile file) throws ClientException {
        String fileName = UUID.randomUUID() + Objects.requireNonNull(file.getOriginalFilename()).substring(file.getOriginalFilename().lastIndexOf("."));
        return Response.success(aliOSSUtil.upload(file,fileName));
    }

    /**
     * 删除文件
     * @param filePath
     * @return
     * @throws ClientException
     */
    @DeleteMapping("/delete")
    public Response<String> delete(String filePath) throws ClientException {
        String fileName = aliOSSUtil.getFileName(filePath);
        aliOSSUtil.remove(fileName);
        return Response.success(fileName);
    }
}
