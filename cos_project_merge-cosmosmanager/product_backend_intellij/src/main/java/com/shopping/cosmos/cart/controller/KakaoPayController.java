package com.shopping.cosmos.cart.controller;

import com.shopping.cosmos.cart.domain.*;
import com.shopping.cosmos.cart.service.KakaoPayService;
import com.shopping.cosmos.cart.service.OrderSerivce;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

@Log
@RestController
@AllArgsConstructor
@CrossOrigin(origins = "*")
@RequestMapping("/order")
public class KakaoPayController {
    private KakaoPayService kakaopayService;

    private OrderSerivce orderSerivce;

    @GetMapping("/address")
    public List<AddressVO> addressList(HttpSession session){
//        String userId=(String) session.getAttribute("userId");
        String userId = "licsh12@gmail.com";
        return kakaopayService.listAddress(userId);
    }
    @GetMapping("/user")
    public UserVO userData(HttpSession session){
        String userId = "licsh12@gmail.com";
        return kakaopayService.userOrderData(userId);
    }

    @GetMapping("/kakaoPay2")
    public void kakaoPayGet(){
    }

    @PostMapping("/kakaoPay")
    public String kakaoPay(){
        log.info("kakaoPay post.....");

        return kakaopayService.kakaoPayReady();
    }

    @PostMapping("/insert")
    public void orderInsert(HttpSession session,@RequestBody OrderVO orderVO){
        String userId = "licsh12@gmail.com";
        OrderDetailVO orderDetailVO = new OrderDetailVO();
        orderVO.setUserId(userId);

        //주문번호(orderId) 생성을 위한 로직
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String subNum = "";

        for(int i = 1; i <= 6; i ++) {
            subNum += (int)(Math.random() * 10);
        }



        String orderId = ymd + "_" + subNum; //ex) 20200508_373063
        orderVO.setOrderId(orderId);
        orderDetailVO.setOrderId(orderId);

        orderSerivce.insertOrder(orderVO);
        orderSerivce.insertOrderDetail(orderDetailVO,userId);


        System.out.println(orderVO);



    }

//    @GetMapping("/kakaoPaySuccess")
//    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model){
//        log.info("kakaoPay Success get.......");
//        log.info("kakaoPaySuccess pg_token:   "+pg_token);
//        //model.addAttribute("info",kakaopayService.kakaoPayInfo(pg_token));
//
//    }
    @GetMapping("/kakaoPaySuccess{id}")
    public KaKaoPayApprovalVO kakaoPaySuccess(@PathVariable(name="id") String pg_token){
        String userId="licsh12@gmail.com";
        log.info(pg_token);
        log.info("kakaoPay Success get.......");
        log.info("kakaoPaySuccess pg_token:   "+pg_token);


        return kakaopayService.kakaoPayInfo(pg_token,userId);
    }

}
