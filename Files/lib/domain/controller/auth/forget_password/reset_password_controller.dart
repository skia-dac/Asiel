import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/utils/my_strings.dart';


class ResetPasswordController extends GetxController{

  
  String email = '';
  String code = '';
  bool submitLoading = false;

  bool checkPasswordStrength = false;

  final FocusNode passwordFocusNode         = FocusNode();
  final FocusNode confirmPasswordFocusNode  = FocusNode();

  TextEditingController passController        = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>]).{6,}$');

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return MyStrings.enterYourPassword_.tr;
    } else {
      if(checkPasswordStrength){
        if (!regex.hasMatch(value)) {
          return MyStrings.invalidPassMsg.tr;
        } else {
          return null;
        }
      }else{
        return null;
      }
    }
  }

  bool hasPasswordFocus = false;
  void changePasswordFocus(bool hasFocus) {
    hasPasswordFocus = hasFocus;
    update();
  }

}


