import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/utils/my_strings.dart';
import 'package:ShapeCom/presentation/components/snack_bar/show_custom_snackbar.dart';

class RegistrationController extends GetxController {


  bool isLoading = true;
  bool agreeTC   = false;


  bool checkPasswordStrength = false;
  bool needAgree=true;

  final FocusNode emailFocusNode           = FocusNode();
  final FocusNode passwordFocusNode        = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode firstNameFocusNode       = FocusNode();
  final FocusNode lastNameFocusNode        = FocusNode();
  final FocusNode countryNameFocusNode     = FocusNode();
  final FocusNode mobileFocusNode          = FocusNode();
  final FocusNode userNameFocusNode        = FocusNode();
  final FocusNode companyNameFocusNode     = FocusNode();
  final FocusNode countryFocusNode     = FocusNode();

  final TextEditingController emailController       = TextEditingController();
  final TextEditingController passwordController    = TextEditingController();
  final TextEditingController cPasswordController   = TextEditingController();
  final TextEditingController fNameController       = TextEditingController();
  final TextEditingController lNameController       = TextEditingController();
  final TextEditingController mobileController      = TextEditingController();
  final TextEditingController countryController     = TextEditingController();
  final TextEditingController userNameController    = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();


  String? email;
  String? password;
  String? confirmPassword;
  String? countryName;
  String? countryCode;
  String? mobileCode;
  String? userName;
  String? phoneNo;
  String? firstName;
  String? lastName;

  RegExp regex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  bool submitLoading = false;

  signUpUser() async {

    if (countryName == null) {
      CustomSnackBar.error(errorList: [MyStrings.selectACountry]);
      update();
      return;
    }

    if(mobileController.text.isEmpty) {
      CustomSnackBar.error(errorList: [MyStrings.enterYourPhoneNumber]);
      return;
    }

    if(needAgree && !agreeTC) {
      CustomSnackBar.error(errorList: [MyStrings.agreePolicyMessage],);
      return;
    }

    submitLoading=true;
    update();

    submitLoading=false;
    update();
  }



  setCountryNameAndCode(String cName, String countryCode, String mobileCode) {
    countryName = cName;
    this.countryCode = countryCode;
    this.mobileCode = mobileCode;
    update();
  }


  updateAgreeTC() {
    agreeTC = !agreeTC;
    update();
  }


  void closeAllController() {
    isLoading = false;
    emailController.text         = '';
    passwordController.text      = '';
    cPasswordController.text     = '';
    fNameController.text         = '';
    lNameController.text         = '';
    mobileController.text        = '';
    countryController.text       = '';
    userNameController.text      = '';
    companyNameController.text   = '';
  }

  clearAllData() {
    closeAllController();
  }

  bool isCountryLoading=true;
  void initData() async {

    isLoading = true;
    update();

    isLoading = false;
    update();
  }

  bool countryLoading = true;


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

  bool noInternet=false;
  void changeInternet(bool hasInternet){
    noInternet = false;
    initData();
    update();
  }

  bool hasPasswordFocus = false;
  void changePasswordFocus(bool hasFocus) {
    hasPasswordFocus = hasFocus;
    update();
  }
}
