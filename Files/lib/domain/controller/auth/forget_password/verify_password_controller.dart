import 'package:get/get.dart';

class VerifyPasswordController extends GetxController{

  String email    = '';
  String password = '';
  bool isLoading  = false;
  bool remember   = false;
  bool hasError   = false;

  List<String> errors    = [];
  String currentText     = "";
  String confirmPassword = '';

  bool isResendLoading=false;

  void resendForgetPassCode() async {

    isResendLoading=true;
    update();
    String value = email;
    String type = 'email';
    isResendLoading=false;
    update();

  }

  bool verifyLoading=false;

  String getFormatedMail(){
    try{
      List<String>tempList = email.split('@');
      int maskLength = tempList[0].length;
      String maskValue = tempList[0][0].padRight(maskLength,'*');
      String value = '$maskValue@${tempList[1]}';
      return value;
    } catch(e){
      return email;
    }

  }

}


