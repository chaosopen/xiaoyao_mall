package com.xiaoyao.product;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.xiaoyao.product.mapper")
@SpringBootApplication
public class ProductCenterApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProductCenterApplication.class, args);
	}

}
