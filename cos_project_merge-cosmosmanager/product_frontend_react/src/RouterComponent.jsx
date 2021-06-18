import React from 'react'
import {BrowserRouter, Route, Switch} from 'react-router-dom';
import ProductListCategoryComponent from "./ProductListComponent/product/ProductListCategoryComponent";
import ProductListSearchComponent from "./ProductListComponent/product/ProductListSearchComponent";
import ProductDetailComponent from "./ProductListComponent/product/Product_Info_Component";
import MainComponent from "./Maincomponent/Main";
import ProductListAccessoryComponent from "./ProductListComponent/product/ProductListAccessoryComponent";
import ProductNewArrivalsComponent from "./ProductListComponent/product/ProductNewArrivalsComponent";
import MYCOSPage from './MYCOSComponent/MYCOSPage';
import ManagerPage from './manager_component/ManagerPage';
import SignUp from './signUp_component/component/SignUp';
import SignUpError from "./errComponent/SignUpError"
import ProductInsertError from "./errComponent/ProductInsertError"
import DeliveryStatusError from "./errComponent/DeliveryStatusError"
import ManagerDefaultErr from "./errComponent/ManagerDefaultErr"
import AddCart from "./Cartcomponent/AddCart";
import CartList from "./Cartcomponent/CartList";
import OrderMain from "./Ordercomponent/OrderMain";
import KakaoPaySuccess from './Ordercomponent/KakaoPaySuccess';
import ChatComponent from "./Chatcomponent/ChatMain";

const AppRouter = () => {
    return(
        <div style={style} >
                    <Switch >
                        {/* 메인 페이지 */}
                        <Route exact path="/" component={MainComponent} />

                        {/* 상품 리스트 페이지 */}
                        <Route path="/product-list" component={ProductListCategoryComponent} />
                        <Route path="/product-detail" component={ProductDetailComponent} />
                        <Route path="/search-keyword" component={ProductListSearchComponent} />
                        <Route path="/accessories-list" component={ProductListAccessoryComponent} />
                        <Route path="/new-arrivals" component={ProductNewArrivalsComponent} />
                        {/* <Route path="/mycos-member" component={MyCosMemberComponent} /> */}

                        {/* MYCOS 페이지 */}
                        <Route path="/mycos-member" component={MYCOSPage} />
                        {/*회원가입페이지*/}
                        <Route path="/signUp" component={SignUp} />
                        
                        {/*관리자페이지*/}
                        <Route path="/manager" component={ManagerPage} />
                        
                        {/*오류페이지*/}
                        <Route path="/signUpError" component={SignUpError} />
                        <Route path="/productInsertError" component={ProductInsertError} />
                        <Route path="/deliveryStatusError" component={DeliveryStatusError} />
                        <Route path="/managerDefaultErr" component={ManagerDefaultErr} />
                        
                        {/*장바구니페이지*/}
                        <Route exact path="/cart" component={AddCart} />
                        <Route exact path="/cart/list" component={CartList}/>
                        <Route exact path="/order" component={OrderMain}/>
                        <Route path="/order/kakaoPaySuccess" component={KakaoPaySuccess}/>
                        <Route exact path="/chat" component={ChatComponent}/>
                        
                    </Switch>
        </div>
    );
}

const style = {
    marginTop: '20px'
}

export default AppRouter;