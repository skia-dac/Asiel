import 'package:ShapeCom/domain/product/my_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyCartController extends GetxController{

  TextEditingController couponCodeController = TextEditingController();
  FocusNode couponCodeFocusNode              = FocusNode();

  int productSize = 6;

  double productPrice = 245.00;

  double subTotal = 353.0;

  void increaseQuantity(ProductModel product){

    product.quantity++;
    update();
  }

  void decreaseQuantity(ProductModel product){
    if(product.quantity > 1){
      product.quantity--;
    }
    update();
  }


  List<ProductModel> mixProductList = [
    ProductModel(title: "Urban Voyager Backpack", image: "assets/product/bag/bag (${1}).png", price: "799.00", size: "Medium, Black"),
    ProductModel(title: "Moto Edge 50 pro", image: "assets/product/electronics/electronics (${3}).png",price: "1000",size: "8/256 gb"),
    ProductModel(title: "LuxeLayer Jacket", image: "assets/product/mens_fashion/Mens collections (${10}).png",price: "395"),
    ProductModel(title: "StridePro Running Shoes", image: "assets/product/shoes/shoe (9).png",price: "499",size: "Mixon 12"),
    ProductModel(title: "Elegance Tote", image: "assets/product/bag/bag (${7}).png",size: "14 inches (W)",price: "485"),
    ProductModel(title: "High Quality Headphone", image: "assets/product/head_phone/headphone (${6}).png",size: "EchoWave X1",price: "764"),
    ProductModel(title: "StrideFlex Sneakers", image: "assets/product/shoes/shoe (10).png",size: " Xtreme Grip 2024"),
    ProductModel(title: "One plus Nord CE", image: "assets/product/electronics/electronics (${2}).png",price: "899",size: "4/64 gb"),
    ProductModel(title: "SonicPulse Wireless Headphones", image: "assets/product/head_phone/headphone (${2}).png",size: "PureSound Pro 500",price: "499"),
    ProductModel(title: "ChronoLux Watch", image: "assets/product/watch/watch (${2}).png",size: "Pure gold",price: "1200"),
  ];

}