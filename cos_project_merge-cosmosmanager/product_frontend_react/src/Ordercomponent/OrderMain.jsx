import {Button} from '@material-ui/core';
import ApiService from '../ApiServiceChu';
import React, { useEffect,useState } from 'react'
import axios from 'axios';
import { Link,useHistory } from 'react-router-dom';


const OrderMain=()=>{
    const [userInfo,setUserInfo] = useState({
        user_email:"",
        user_name:"",
        user_phone:""
    });
    const imgUrl = "/images/";
    const [radioStatus,setRadioStatus] = useState("option1");
    const [addresses,setAddresses] = useState([]);
    const [innerRadioStatus,setInnerRadioStatus] = useState(0);
    const [carts,setCarts] = useState([]);


    let order={
        userId:"",
        userName:"",
        address:"",
        detailAddress:"",
        postCode:"",
        orderProductAmount:0,
        orderName:""
    }
    

    useEffect(()=>{
        reloadAddress();
        reloadOrderList();
        reloadUserInfo();
    },[]);

    const changeRadio = (e)=>{
        setRadioStatus(e.target.value);
    }
    const changeInnerRadio = (e)=>{
        setInnerRadioStatus(e.target.value);
    }

    const reloadAddress = () =>{
        ApiService.showAddressList()
            .then(res => {
                setAddresses(res.data);
            })
            .catch(err => {
                console.log('reloadAddressList() Error!',err);
            })
    }

    const reloadOrderList = () =>{
        ApiService.showCartList()
            .then(res => {
                setCarts(res.data);
                order={
                    userId:carts[0].userId,
                    orderName:carts[0].productName
                }
            })
            .catch(err => {
                console.log('reloadBoardList() Error!',err);
            })
        }
    const reloadUserInfo=()=>{
        ApiService.showUserInfo()
            .then(res=>{
                setUserInfo(res.data);
            })
            .catch(err => {
                console.log('reloadUserInfo() Error!',err);
            })
    }

    const kakaoPay = ()=>{
        ApiService.kakaoPay()
        .then(res=>{
            window.location.assign(res.data);
        })
        .catch(
            console.log("?????? ??????")
        )
    }
    
    const submitOrderInfo=()=>{
        
        console.log(order)
        order={
            postCode:addresses[innerRadioStatus].postCode,
            userName:addresses[innerRadioStatus].userName,
            address:addresses[innerRadioStatus].address,
            detailAddress:addresses[innerRadioStatus].detailAddress,
            orderProductAmount:carts.length,
        }

        ApiService.addOrderInfo(order)
        .catch(err=>{
            console.log("addOrderInfo ??????",err);
        });
    }
    const submitSomeThing=()=>{
        submitOrderInfo();
        kakaoPay();
    }


    
    return(
        <div>
            <div style={{fontSize:'13px',textAlign:"center",marginTop:"50px",marginBottom:'20px'}}>?????????</div>
            <div className="oderList">
                        {carts.map((cart,index) =>
                            <div key={cart.cartId}>
                                <img src={imgUrl+(cart.productImagePath).split(',')[0]}/>
                                <p>{cart.productName}</p>
                                <p>??????: {cart.productPrice}</p>
                                <p>?????????: {cart.productSize}</p>
                                <p>??????: {cart.productColor}</p>
                                <p>??????: {cart.amount}</p>
                                <div className="cartprice">
                                    <p>{cart.money}</p>
                                </div>
                                <div>
                                    <hr style={{marginTop:"60px",marginBottom:"30px",color:"lightgray"}}></hr>
                                </div>
                            </div>
                        )}
                </div>
            <div className="order_user">
                <p>1.?????? ?????? ??????</p>
                <hr></hr>
                <p>{userInfo.user_email}</p>
                <p>{userInfo.user_name}</p>
                <p>{userInfo.user_phone}</p>
            </div>
            <hr></hr>
            <div className="adress_info">
                <p style={{marginLeft:"20px"}}>2.????????? ??????</p>
                <hr></hr>
                <div className="address_radio" style={{marginLeft:"10px"}}>
                    <label>
                    <input type="radio"
                    value="option1"
                    checked={radioStatus=="option1"}
                    onChange={changeRadio}/>
                    ????????? ??????
                    </label>
                    <label>
                    <input type="radio"
                    value="option2"
                    checked={radioStatus=="option2"}
                    onChange={changeRadio}/>
                    ?????? ??????
                    </label>
                </div>
                <hr></hr>
                <div style={radioStatus=="option1"?{}:{display:"none"}} >
                    <div className="addressListRadio" style={{marginLeft:"10px"}}>
                        {addresses.map((address,index) =>
                            <label key={index}>
                            <input type="radio"
                            value={index}
                            checked={innerRadioStatus==index}
                            onChange={changeInnerRadio}/>
                            {index+1}??? ?????????
                            </label>
                        )}
                      </div>
                      <hr></hr>
                      <div>
                      {addresses.map((address,index)=>
                      <div style={innerRadioStatus==index?{marginLeft:"10px"}:{display:"none"}}>
                            <p>?????????: {address.userName}</p>
                            <p>????????????: {address.postCode}</p>
                            <p>??????: {address.address}</p>
                            <p>?????? ??????: {address.detailAddress}</p>
                        </div>
                        )}
                      </div>
                </div>
                <div style={radioStatus=="option2"?{}:{display:"none"}}>
                    <p>?????????</p>
                    <p>010-3227-2759</p>
                    <p>?????????????????? 158?????? 29</p>
                </div>
                <hr></hr>
            </div>
            <div className="payAPI" style={{marginLeft:"10px"}}>
                <p>4.??????</p>
                <Button onClick={submitSomeThing}>????????????</Button>
            </div>
            <div>
            </div>

        </div>
    );

}

export default OrderMain;