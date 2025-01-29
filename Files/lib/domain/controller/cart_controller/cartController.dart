

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../config/utils/my_images.dart';

class CartCountController extends GetxController{

  int cartCount = 1;
  void manageCartCount(){
    cartCount++;
    update();
  }

}