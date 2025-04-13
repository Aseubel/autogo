package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.CustomMultipartFile;
import com.aseubel.autogo.common.Response;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

    @Value("${file.upload-dir:./uploads/}") // 可在 application.properties 中配置
    private String uploadDir;

    private static final String appName = "autogo";

    // 初始化存储目录
    @PostConstruct
    public void init() throws IOException {
        Files.createDirectories(Paths.get(uploadDir, appName));
    }

    /**
     * 上传文件
     */
    @PostMapping("/upload")
    public Response<String> upload(MultipartFile file) throws IOException {
        String fileExtension = StringUtils.getFilenameExtension(file.getOriginalFilename());
        String fileName = appName + "/" + UUID.randomUUID() + "." + fileExtension;
        Path storagePath = Paths.get(uploadDir, fileName);
        try (InputStream inputStream = file.getInputStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            Thumbnails.of(inputStream)
                    .useExifOrientation(true) // 避免额外旋转计算
                    .size(1024, 1024) // 设置压缩尺寸
                    .keepAspectRatio(true) // 保持纵横比
                    .outputQuality(0.8) // 设置输出质量（0.0到1.0之间）
                    .outputFormat("JPEG") // 设置输出格式
                    .toOutputStream(outputStream);
            // 将压缩后的图片转换为Base64字符串
            byte[] compressedBytes = outputStream.toByteArray();
            file = new CustomMultipartFile(compressedBytes, file.getOriginalFilename());
        }
        // 保存文件到本地
        file.transferTo(storagePath);
        return Response.success(fileName);
    }

    /**
     * 删除文件
     */
    @DeleteMapping("/delete")
    public Response<Boolean> delete(String filePath) throws IOException {
        Path targetPath = validateAndResolvePath(filePath);
        if (Files.exists(targetPath)) {
            Files.delete(targetPath);
            return Response.success(true);
        }
        return Response.fail("File not found");
    }

    /**
     * 获取图片
     */
    @GetMapping("/picture")
    public void picture(String filePath, HttpServletResponse response) throws IOException {
        Path targetPath = validateAndResolvePath(filePath);

        if (!Files.exists(targetPath)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        try (InputStream is = Files.newInputStream(targetPath);
             OutputStream os = response.getOutputStream()) {
            response.setContentType(Files.probeContentType(targetPath));
            response.setContentLength((int) Files.size(targetPath));
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.flush();
        }
    }

    // 路径安全验证
    private Path validateAndResolvePath(String filePath) throws IOException {
        Path basePath = Paths.get(uploadDir).toRealPath();
        Path requestedPath = basePath.resolve(filePath).normalize();

        if (!requestedPath.startsWith(basePath)) {
            throw new SecurityException("Attempt to access restricted path");
        }
        return requestedPath;
    }
}
