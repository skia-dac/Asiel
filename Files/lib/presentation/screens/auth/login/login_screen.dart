import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/route/route.dart';
import 'package:ShapeCom/config/utils/dimensions.dart';
import 'package:ShapeCom/config/utils/my_color.dart';
import 'package:ShapeCom/config/utils/my_images.dart';
import 'package:ShapeCom/config/utils/my_strings.dart';
import 'package:ShapeCom/config/utils/style.dart';
import 'package:ShapeCom/config/utils/util.dart';
import 'package:ShapeCom/presentation/components/buttons/rounded_button.dart';
import 'package:ShapeCom/presentation/components/will_pop_widget.dart';

import '../../../../domain/controller/auth/login_controller.dart';
import '../../../components/buttons/rounded_loading_button.dart';
import '../../../components/text-form-field/custom_text_field.dart';
import '../../../components/text/default_text.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {

    MyUtils.allScreen();

    var controller = Get.put(LoginController());

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.remember = false;
    });

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GetBuilder<LoginController>(
      builder: (controller) => WillPopWidget(
        nextRoute: RouteHelper.loginScreen,
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.space25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.height * .08,),
                  Text(MyStrings.welcome.tr,style: semiBoldLargeInter.copyWith(fontSize: 40,color: MyColor.primaryColor)),
                  Text(MyStrings.back.tr,style: semiBoldLargeInter.copyWith(fontSize: 40)),

                  const SizedBox(height: Dimensions.space50),
                  Text(MyStrings.loginWelcomeMessage.tr,style: regularLarge.copyWith(color: MyColor.secondaryTextColor)),
                  const SizedBox(height: Dimensions.space20),

                  CustomTextField(
                    animatedLabel: true,
                    needOutlineBorder: true,
                    labelText: MyStrings.emailOrUserName.tr,
                    controller: controller.emailController,
                    focusNode: controller.emailFocusNode,
                    textInputType: TextInputType.text,
                    nextFocus: controller.passwordFocusNode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return MyStrings.enterYourUsername.tr;
                      } else if(value.length<6){
                        return MyStrings.kShortUserNameError.tr;
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      return;
                    },
                  ),
                  const SizedBox(height: Dimensions.space16),
                  CustomTextField(
                    animatedLabel: true,
                    needOutlineBorder: true,
                    isShowSuffixIcon: true,
                    isPassword: true,
                    labelText: MyStrings.password.tr,
                    controller: controller.passwordController,
                    focusNode: controller.passwordFocusNode,
                    textInputType: TextInputType.text,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return MyStrings.fieldErrorMsg.tr;
                      } else {
                        return null;
                      }
                    }
                  ),
                  const SizedBox(height: Dimensions.space25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Checkbox(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                activeColor: MyColor.primaryColor,
                                checkColor: MyColor.colorWhite,
                                value: controller.remember,
                                side: MaterialStateBorderSide.resolveWith(
                                      (states) => BorderSide(
                                      width: 1.0,
                                      color: controller.remember ? MyColor.getTextFieldEnableBorder() : MyColor.getTextFieldDisableBorder()
                                  ),
                                ),
                                onChanged: (value){
                                  controller.changeRememberMe();
                                }
                            ),
                          ),
                          const SizedBox(width: 8),
                          DefaultText(text: MyStrings.rememberMe.tr, textColor: MyColor.getTextColor())
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          controller.clearTextField();
                          Get.toNamed(RouteHelper.forgotPasswordScreen);
                        },
                        child: DefaultText(text: MyStrings.forgotPassword.tr, textColor: MyColor.primaryColor),
                      )
                    ],
                  ),
                  const SizedBox(height: Dimensions.space18),
                  controller.isSubmitLoading ? const RoundedLoadingBtn() : RoundedButton(
                    text: MyStrings.signIn.tr,
                    press: (){
                
                      Get.offAllNamed(RouteHelper.bottomNavBar);
                    }
                  ),

                
                  const SizedBox(height: Dimensions.space50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(MyStrings.doNotHaveAccount.tr, overflow:TextOverflow.ellipsis,style: regularLarge.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500)),
                      const SizedBox(width: Dimensions.space5),
                      TextButton(
                        onPressed: (){
                          Get.offAndToNamed(RouteHelper.registrationScreen);
                        },
                        child: Text(MyStrings.signUp.tr, maxLines: 2, overflow:TextOverflow.ellipsis,style: regularLarge.copyWith(color: MyColor.getPrimaryColor())),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

