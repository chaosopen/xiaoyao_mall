package com.xiaoyao.product.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("product_brand_info")
public class ProductBrandInfo {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("brand_name")
    private String brandName;

    @TableField("img_url")
    private String imgUrl;


    @TableField("is_deleted")
    private Integer isDeleted;


}
