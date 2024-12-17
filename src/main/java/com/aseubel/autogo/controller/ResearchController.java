package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.Research;
import com.aseubel.autogo.service.IResearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * @author aseubel
 * @description 研究接口
 * @date 2024/12/17
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/research")
public class ResearchController {

    @Autowired
    private IResearchService researchService;

    @GetMapping("/")
    public Response<List<Research>> listResearchByType(String typeId) {
        return Response.success(researchService.listResearchByTypeId(typeId));
    }

    @GetMapping("/detail")
    public Response<Research> queryResearch(String researchId) {
        return Response.success(researchService.getById(researchId));
    }

    @PutMapping("/update")
    public Response updateResearch(Research research) {
        return researchService.updateById(research) ? Response.success() : Response.fail("更新研究信息失败");
    }

    @PostMapping("/")
    public Response addResearch(Research research) {
        research.setResearchId(UUID.randomUUID().toString());
        return researchService.save(research) ? Response.success() : Response.fail("添加研究失败");
    }

    @DeleteMapping("/")
    public Response deleteResearch(String researchId) {
        return researchService.removeById(researchId) ? Response.success() : Response.fail("删除研究失败");
    }

}
