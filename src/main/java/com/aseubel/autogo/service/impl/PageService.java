package com.aseubel.autogo.service.impl;

import com.aseubel.autogo.dao.PageMapper;
import com.aseubel.autogo.pojo.entity.Page;
import com.aseubel.autogo.service.IPageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author aseubel
 * @description PageService
 * @date 2024/12/17
 */
@Service
public class PageService extends ServiceImpl<PageMapper, Page> implements IPageService {

}
