package com.shopping.cosmos.product.controller;

import com.shopping.cosmos.product.service.ProductService_jo;
import com.shopping.cosmos.product.vo.ProductVO_jo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin(origins="*")
@RestController
@RequestMapping("/cos")
public class ProductInsertController_jo {
	
	@Autowired
	private ProductService_jo service;
	
	
	//프론트에서 post방식으로 '
	@PostMapping("/manager/productInsert")
	void insertProduct(@RequestBody List<ProductVO_jo> product)  {
			System.out.println("insertProduct 접근");
			System.out.println(product);
			System.out.println(product.size());
			for(int i=0; i<product.size(); i++) {
				if(i==0) {
					service.insertProduct(product.get(i));
				}else {
					service.insertProductId(product.get(i));
				}
			}
			
			System.out.println("insert성공");
	}
}