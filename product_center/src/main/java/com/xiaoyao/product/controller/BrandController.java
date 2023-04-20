package com.xiaoyao.product.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.LambdaUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoyao.product.entity.ProductBrandInfo;
import com.xiaoyao.product.service.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/brand")
public class BrandController {

    @Autowired
    private IBrandService iBrandService;

    @RequestMapping("/save")
    public boolean save() {
        ProductBrandInfo productBrandInfo = new ProductBrandInfo();
        productBrandInfo.setBrandName("华为");
        productBrandInfo.setImgUrl("");
        iBrandService.save(productBrandInfo);
        return true;
    }
    @RequestMapping("/delete")
    public boolean delete() {
        iBrandService.removeById(2);
//        ProductBrandInfo productBrandInfo = new ProductBrandInfo();
//        productBrandInfo.setId(2);
//        productBrandInfo.setIsDeleted(1);
//        iBrandService.updateById(productBrandInfo);
        return true;
    }

    @RequestMapping("list")
    public IPage list(@RequestParam("name") String name) {
        IPage page = new Page(2, 10);
        IPage res = iBrandService.page(page);
        return res;
    }
}
