package com.shopping.cosmos.controller;


import com.shopping.cosmos.service.ProductDetailService_dae;
import com.shopping.cosmos.vo.CartVO_hun;
import com.shopping.cosmos.vo.ProductDetailVO_dae;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/products")
public class ProductDetailController_dae {

    @Autowired
    ProductDetailService_dae productService;

    //상품 정보 모두 출력
    @GetMapping("/{id}")
    public List<ProductDetailVO_dae> productDetail(@PathVariable int id){
        System.out.println(productService.productDetail(id));
        System.out.println(id + "상품 출력 성공");
        return productService.productDetail(id);
    }

    //장바구니 저장
    @PostMapping
    public void insertCart(@RequestBody CartVO_hun cart){
        productService.insertCart(cart);
        System.out.println("카트 DB 저장 성공");
    }


}
