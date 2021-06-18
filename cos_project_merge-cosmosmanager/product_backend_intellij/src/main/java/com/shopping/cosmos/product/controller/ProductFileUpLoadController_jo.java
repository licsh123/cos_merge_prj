package com.shopping.cosmos.product.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/cos")
public class ProductFileUpLoadController_jo {

	@PostMapping("/manager/upload")
	public void upload(@RequestParam("file") List<MultipartFile> mtfList) {
		System.out.println("upload접근");
		System.out.println("upload접근");
		System.out.println(mtfList);
		for(MultipartFile list : mtfList) {
			System.out.println(list.getOriginalFilename());
		}
		
		for (MultipartFile mf : mtfList) {
			try {
				if (!mf.isEmpty()) {
					String fileName = mf.getOriginalFilename();// pc에서 업로드시 파일명
					// UUID.randomUUID();
					fileName = fileName.substring(0, fileName.lastIndexOf("."));
					String fileName2 = mf.getOriginalFilename();

					String extend = fileName2.substring(fileName2.lastIndexOf(".") + 1);// 파일명.jpg

					System.out.println("파일명:" + fileName);
					System.out.println("확장자:" + extend);

					// 파일명 중복방지 처리 UUID.randomUUID()
					// fileName=fileName+"-"+UUID.randomUUID()+"."+extend;
					// System.out.println("파일명:"+fileName);
					// trandsferto 파일 저장경로
					//mf.transferTo(new File("C:/cos/cosfrontend/public/imgs/" + fileName + "." + extend));
					mf.transferTo(new File("C:/cos_project_merge/cos_project_merge/product_frontend_react/public/imgs/" + fileName + "." + extend));
				}else {
					System.out.println("중복이있음");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
