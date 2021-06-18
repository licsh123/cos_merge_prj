package com.shopping.cosmos.product.mapper;

import com.shopping.cosmos.product.vo.ProductVO_jo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper_jo {

	void insertProduct(ProductVO_jo vo);
	void insertProductId(ProductVO_jo vo);
	List<ProductVO_jo> getProductList(ProductVO_jo vo);
	List<ProductVO_jo> getProductDetail(ProductVO_jo vo);
	List<ProductVO_jo> seachList(ProductVO_jo vo);
	void updateProduct(ProductVO_jo product);
	void updateProductOption(ProductVO_jo product);
	void deleteProduct(ProductVO_jo product);
	void deleteProductOption(ProductVO_jo product);
	int productCount();
}
