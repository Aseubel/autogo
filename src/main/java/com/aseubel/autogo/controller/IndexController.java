package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.IndexInfo;
import com.aseubel.autogo.pojo.entity.Type;
import com.aseubel.autogo.service.IIndexService;
import com.aseubel.autogo.service.ITypeService;
import com.aseubel.autogo.service.impl.IndexService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 首页信息相关接口
 * @author aseubel
 * @date 2024/12/17
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/index")
public class IndexController {

    @Autowired
    private IIndexService indexService;

    @Autowired
    private ITypeService typeService;

    /**
     * 获取首页信息
     */
    @GetMapping("/")
    public Response<IndexInfo> getIndexInfo() {
        return Response.success(indexService.getById(1));
    }

    /**
     * 更新首页信息
     */
    @PutMapping("/")
    public Response updateIndex(IndexInfo indexInfo) {
        return indexService.updateById(indexInfo) ? Response.success() : Response.fail("更新首页信息失败");
    }

    /**
     * 获取首页所有类型
     */
    @GetMapping("/type")
    public Response<List<Type>> getAllTypes(String pageId) {
        return Response.success(typeService.listTypeByPageId(pageId));
    }
}
