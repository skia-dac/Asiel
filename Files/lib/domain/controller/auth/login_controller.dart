import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/route/route.dart';

class LoginController extends GetxController{


  final FocusNode emailFocusNode    = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  TextEditingController emailController    = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? email;
  String? password;

  List<String>errors = [];
  bool remember      = false;



  void forgetPassword() {
    Get.toNamed(RouteHelper.forgotPasswordScreen);
  }

  bool isSubmitLoading = false;
  void loginUser() async {

    isSubmitLoading = true;
    update();


    isSubmitLoading = false;
    update();

  }

  changeRememberMe() {
    remember = !remember;
    update();
  }


  void clearTextField() {

    passwordController.text = '';
    emailController.text    = '';

    if(remember){
      remember = false;
    }
    update();

  }

}
