package com.xiaoyao.product.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaoyao.product.entity.ProductBrandInfo;
import com.xiaoyao.product.mapper.BrandMapper;
import com.xiaoyao.product.service.IBrandService;
import org.springframework.stereotype.Service;

@Service
public class BrandServiceImpl extends ServiceImpl<BrandMapper, ProductBrandInfo> implements IBrandService {

}
