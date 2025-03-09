package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.Treatise;
import com.aseubel.autogo.pojo.entity.Type;
import com.aseubel.autogo.service.ITreatiseService;
import com.aseubel.autogo.service.ITypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * 论著相关接口
 * @author aseubel
 * @date 2024/12/17
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/treatise")
public class TreatiseController {

    @Autowired
    private ITreatiseService treatiseService;

    @Autowired
    private ITypeService typeService;

    /**
     * 列举某类型的论著
     */
    @GetMapping("")
    public Response<List<Treatise>> listTreatiseByType(String typeId) {
        return Response.success(treatiseService.listTreatiseByTypeId(typeId));
    }

    /**
     * 查询论著信息详情
     */
    @GetMapping("/detail")
    public Response<Treatise> queryTreatise(String treatiseId) {
        return Response.success(treatiseService.getById(treatiseId));
    }

    /**
     * 修改论著信息详情
     */
    @PutMapping("/update")
    public Response updateTreatise(@RequestBody Treatise treatise) {
        return treatiseService.updateById(treatise) ? Response.success() : Response.fail("更新论著失败");
    }

    /**
     * 添加论著
     */
    @PostMapping("")
    public Response addTreatise(@RequestBody Treatise treatise) {
        treatise.setTreatiseId(UUID.randomUUID().toString());
        return treatiseService.save(treatise) ? Response.success() : Response.fail("添加论著失败");
    }

    /**
     * 删除论著
     */
    @DeleteMapping("")
    public Response deleteTreatise(String treatiseId) {
        return treatiseService.removeById(treatiseId) ? Response.success() : Response.fail("删除论著失败");
    }

    /**
     * 获取论著所有类型
     */
    @GetMapping("/type")
    public Response<List<Type>> getAllTypes(String pageId) {
        return Response.success(typeService.listTypeByPageId(pageId));
    }

}
