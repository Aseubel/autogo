package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.Treatise;
import com.aseubel.autogo.service.ITreatiseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * @author aseubel
 * @description 论著接口
 * @date 2024/12/17
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/treatise")
public class TreatiseController {

    @Autowired
    private ITreatiseService treatiseService;

    @GetMapping("/")
    public Response<List<Treatise>> listTreatiseByType(String typeId) {
        return Response.success(treatiseService.listTreatiseByTypeId(typeId));
    }

    @GetMapping("/detail")
    public Response<Treatise> queryTreatise(String treatiseId) {
        return Response.success(treatiseService.getById(treatiseId));
    }

    @PutMapping("/update")
    public Response updateTreatise(Treatise treatise) {
        return treatiseService.updateById(treatise) ? Response.success() : Response.fail("更新论著失败");
    }

    @PostMapping("/")
    public Response addTreatise(Treatise treatise) {
        treatise.setTreatiseId(UUID.randomUUID().toString());
        return treatiseService.save(treatise) ? Response.success() : Response.fail("添加论著失败");
    }

    @DeleteMapping("/")
    public Response deleteTreatise(String treatiseId) {
        return treatiseService.removeById(treatiseId) ? Response.success() : Response.fail("删除论著失败");
    }

}
