package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.redis.IRedisService;
import com.aseubel.autogo.redis.RedissonService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.UUID;

/**
 * 登录接口
 * @author aseubel
 * @date 2025-03-09 16:01
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api")
public class LoginController {

    @Resource
    private IRedisService redissonService;

    @PostMapping("/login")
    public Response<String> login(@RequestParam String password) {
        // 验证密码（这里假设密码是 "autogogogo"）
        if ("autogogogo".equals(password)) {
            // 生成一个简单的token
            String generatedToken = UUID.randomUUID().toString();
            // 将token存储到Redis中，设置过期时间为30分钟
            redissonService.setValue("autogo:horizon-admin:token", generatedToken, 30 * 60 * 1000);

            return Response.success(generatedToken);
        } else {
            return Response.authFail("密码错误");
        }
    }

    @GetMapping("/validateToken")
    public Response<String> validateToken(String token) {
        // 从Redis中获取token
        String storedToken = redissonService.getValue("autogo:horizon-admin:token");
        if (storedToken != null && storedToken.equals(token)) {
            // 生成一个新的token
            String newToken = UUID.randomUUID().toString();
            // 将token存储到Redis中，设置过期时间为30分钟
            redissonService.setValue("autogo:horizon-admin:token", newToken, 30 * 60 * 1000);
            return Response.success(newToken);
        } else {
            return Response.authFail("Token无效或已过期");
        }
    }

}
