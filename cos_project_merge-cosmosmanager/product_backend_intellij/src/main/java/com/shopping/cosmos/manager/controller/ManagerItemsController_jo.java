package com.shopping.cosmos.manager.controller;

import com.shopping.cosmos.manager.service.ManagerService_jo;
import com.shopping.cosmos.manager.vo.ManagerItemsVO_jo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/cos")
public class ManagerItemsController_jo {
	
	@Autowired
	private ManagerService_jo service;
	
	
	@GetMapping("/manager")
	List<ManagerItemsVO_jo> getManagerItems(ManagerItemsVO_jo vo){
		System.out.println("getManagerItems 접근");
		return service.managerItemsCnt(vo);
	}
	/*
	@GetMapping("/manager/product")
	int getProductCnt(ProductVO vo){
		System.out.println("getProductCnt 접근");
		return mapper.getProductCnt(vo);
	}
	
	@GetMapping("/manager/user")
	int getUserCnt(UserVO vo){
		System.out.println("getUserCnt 접근");
		return mapper.getUserCnt(vo);
	}
	*/
}
