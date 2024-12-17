package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.IndexInfo;
import com.aseubel.autogo.service.IIndexService;
import com.aseubel.autogo.service.impl.IndexService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author aseubel
 * @description 首页信息
 * @date 2024/12/17
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/index")
public class IndexController {

    @Autowired
    private IIndexService indexService;

    @GetMapping("/")
    public Response<IndexInfo> getIndexInfo() {
        return Response.success(indexService.getById(1));
    }

    @PutMapping("/")
    public Response updateIndex(IndexInfo indexInfo) {
        return indexService.updateById(indexInfo) ? Response.success() : Response.fail("更新首页信息失败");
    }
}
