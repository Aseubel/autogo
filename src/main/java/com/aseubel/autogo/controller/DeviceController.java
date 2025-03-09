package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.Device;
import com.aseubel.autogo.pojo.entity.Type;
import com.aseubel.autogo.service.IDeviceService;
import com.aseubel.autogo.service.ITypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * 机器设备相关接口
 * @author aseubel
 * @date 2024/12/17
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/device")
public class DeviceController {

    @Autowired
    private IDeviceService deviceService;

    @Autowired
    private ITypeService typeService;

    /**
     * 列举某类型的设备
     */
    @GetMapping("")
    public Response<List<Device>> listDeviceByType(String typeId) {
        return Response.success(deviceService.listDeviceByTypeId(typeId));
    }

    /**
     * 查询设备详情
     */
    @GetMapping("/detail")
    public Response<Device> queryDevice(String deviceId) {
        return Response.success(deviceService.getById(deviceId));
    }

    /**
     * 修改设备信息
     */
    @PutMapping("/update")
    public Response updateDevice(@RequestBody Device device) {
        return deviceService.updateById(device) ? Response.success() : Response.fail("更新设备信息失败");
    }

    /**
     * 添加设备
     */
    @PostMapping("")
    public Response addDevice(@RequestBody Device device) {
        device.setDeviceId(UUID.randomUUID().toString());
        return deviceService.save(device) ? Response.success() : Response.fail("添加设备失败");
    }

    /**
     * 删除设备
     */
    @DeleteMapping("")
    public Response deleteDevice(String deviceId) {
        return deviceService.removeById(deviceId) ? Response.success() : Response.fail("删除设备失败");
    }

    /**
     * 获取设备所有类型
     */
    @GetMapping("/type")
    public Response<List<Type>> getAllTypes(String pageId) {
        return Response.success(typeService.listTypeByPageId(pageId));
    }
}
