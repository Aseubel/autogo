package com.aseubel.autogo.dao;

import com.aseubel.autogo.pojo.entity.Type;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author aseubel
 * @description 具体类型数据访问接口
 * @date 2024/12/16
 */
@Mapper
public interface TypeMapper extends BaseMapper<Type> {
}
