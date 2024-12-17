package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.Page;
import com.aseubel.autogo.service.IPageService;
import com.aseubel.autogo.service.impl.PageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author aseubel
 * @description 标题页面控制器
 * @date 2024/12/17
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/page")
public class PageController {

    @Autowired
    private IPageService pageService;

    /**
     * 获取所有页面
     * @return 页面列表
     */
    @GetMapping("/all")
    public Response<List<Page>> getAllPages() {
        return Response.success(pageService.list());
    }

    /**
     * 更新页面信息
     * @param page 页面实体，包括id和名称
     * @return 成功或失败
     */
    @PutMapping("/update")
    public Response updatePage(@RequestBody Page page) {
        return pageService.updateById(page) ? Response.success() : Response.fail("修改失败");
    }

}
