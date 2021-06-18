package com.shopping.cosmos.product.controller;

import com.shopping.cosmos.product.service.ProductService_jo;
import com.shopping.cosmos.product.vo.ProductVO_jo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins="*")
@RestController
@RequestMapping("/cos")
public class ProductUpdateController_jo {
	
	@Autowired
	private ProductService_jo service;
	
	//프론트에서 post방식으로 '
	@PutMapping("/manager/productUpdate")
	void updateProduct(@RequestBody List<ProductVO_jo> product)  {
			System.out.println("updateProduct 접근");
			System.out.println(product);
			
			for(ProductVO_jo list : product) {
				service.updateProduct(list);
				service.updateProductOption(list);
			}
			System.out.println("update 성공");
			
	}
}