package com.aseubel.autogo.service.impl;

import com.aseubel.autogo.dao.IndexMapper;
import com.aseubel.autogo.pojo.entity.IndexInfo;
import com.aseubel.autogo.service.IIndexService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author aseubel
 * @date 2024/12/17
 */
@Service
public class IndexService extends ServiceImpl<IndexMapper, IndexInfo> implements IIndexService {
}
