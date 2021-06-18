package com.shopping.cosmos.order.controller;

import com.shopping.cosmos.order.service.OrderService_jo;
import com.shopping.cosmos.order.vo.OrderDetailVO_jo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/cos")
public class CancleOrderController_jo {

	@Autowired
	private OrderService_jo service;

	@GetMapping("/manager/cancleOrder/{pageNum}")
	List<OrderDetailVO_jo> getCancleOrder(OrderDetailVO_jo vo) {
		System.out.println("getOrderStatus 접근");
		System.out.println("pageNum=" + vo.getPageNum());
		if (vo.getPageNum() == 0)
			vo.setPageNum(1);
		// 상품 몇번쨰부터 보여줄건지 계산
		int startRow = (vo.getPageNum() - 1) * 10 + 1;
		// 10개씩 보여줌
		int endRow = startRow + 9;
		vo.setStartRow(startRow);
		vo.setEndRow(endRow);
		System.out.println(startRow);
		System.out.println(endRow);

		return service.cancleOrder(vo);
	}

	@GetMapping("/manager/cancleOrderCount")
	int getCancleOrderCount() {
		System.out.println("getCancleOrderCount 접근");
		// 전체상품개수
		int cancleOrderCount = service.cancleOrderCount();
		System.out.println("cancleOrderCount1 = "+cancleOrderCount);
		// 상품페이지를 보여주기위해 10으로 나눈값을 하나더함 상품개수가 33개라면 3페이지가 아닌 4페이지를 보여주기위해
		if(cancleOrderCount>10 && cancleOrderCount%10!=0) {
			cancleOrderCount=cancleOrderCount/10+1;
		}else {
			cancleOrderCount=cancleOrderCount/10;
		}
		if(cancleOrderCount==0) {
			cancleOrderCount=1;
		}
		System.out.println("cancleOrderCount2 = "+cancleOrderCount);
		return cancleOrderCount;
	}
}