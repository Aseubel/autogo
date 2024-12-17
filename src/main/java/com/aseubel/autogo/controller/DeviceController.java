package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.Device;
import com.aseubel.autogo.service.IDeviceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * @author aseubel
 * @description 机器设备相关接口
 * @date 2024/12/17
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/device")
public class DeviceController {

    @Autowired
    private IDeviceService deviceService;

    @GetMapping("/")
    public Response<List<Device>> listDeviceByType(String typeId) {
        return Response.success(deviceService.listDeviceByTypeId(typeId));
    }

    @GetMapping("/detail")
    public Response<Device> queryDevice(String deviceId) {
        return Response.success(deviceService.getById(deviceId));
    }

    @PutMapping("/update")
    public Response updateDevice(Device device) {
        return deviceService.updateById(device) ? Response.success() : Response.fail("更新设备信息失败");
    }

    @PostMapping("/")
    public Response addDevice(Device device) {
        device.setDeviceId(UUID.randomUUID().toString());
        return deviceService.save(device) ? Response.success() : Response.fail("添加设备失败");
    }

    @DeleteMapping("/")
    public Response deleteDevice(String deviceId) {
        return deviceService.removeById(deviceId) ? Response.success() : Response.fail("删除设备失败");
    }
}
