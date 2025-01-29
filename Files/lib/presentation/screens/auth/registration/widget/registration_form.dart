import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/route/route.dart';
import 'package:ShapeCom/config/utils/dimensions.dart';
import 'package:ShapeCom/config/utils/my_color.dart';
import 'package:ShapeCom/config/utils/my_strings.dart';
import 'package:ShapeCom/config/utils/style.dart';
import 'package:ShapeCom/domain/controller/auth/auth/registration_controller.dart';
import 'package:ShapeCom/presentation/components/buttons/rounded_button.dart';
import 'package:ShapeCom/presentation/components/buttons/rounded_loading_button.dart';
import 'package:ShapeCom/presentation/components/text-form-field/custom_text_field.dart';

class RegistrationForm extends StatefulWidget {

  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      builder: (controller){
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                animatedLabel: true,
                needOutlineBorder: true,
                labelText: MyStrings.username.tr,
                controller: controller.userNameController,
                focusNode: controller.userNameFocusNode,
                textInputType: TextInputType.text,
                nextFocus: controller.emailFocusNode,
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
                labelText: MyStrings.email.tr,
                controller: controller.emailController,
                focusNode: controller.emailFocusNode,
                textInputType: TextInputType.emailAddress,
                
                inputAction: TextInputAction.next,
                validator: (value) {
                  if (value!=null && value.isEmpty) {
                    return MyStrings.enterYourEmail.tr;
                  } else if(!MyStrings.emailValidatorRegExp.hasMatch(value??'')) {
                    return MyStrings.invalidEmailMsg.tr;
                  }else{
                    return null;
                  }
                },
                onChanged: (value) {
                  return;
                },
              ),
              // const SizedBox(height: Dimensions.space16),
              // CustomTextField(
              //   controller: controller.countryController,
              //   textInputType: TextInputType.name,
              //   focusNode: controller.countryFocusNode,
              //   nextFocus: controller.mobileFocusNode,
              //   labelText: MyStrings.country.tr,
              //   animatedLabel: true,
              //   needOutlineBorder: true,
                
              //   onChanged: (value){},
              //   onSuffixTap: () {},
              //   validator: (value) {
              //     if(value.isEmpty){
              //       return MyStrings.fieldErrorMsg.tr;
              //     }
              //     else{
              //       return null;
              //     }
              //   },
              // ),
              const SizedBox(height: Dimensions.space16),
              Visibility(
                visible: controller.countryName != null ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 50,
                          height: 47,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: MyColor.transparentColor,
                            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                            border: Border.all(color: controller.countryName == null ? MyColor.getTextFieldDisableBorder() : MyColor.getTextFieldEnableBorder(), width: 0.5)
                         ),
                          child: Text("+${controller.mobileCode}",
                            style: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                          ),
                        ),
                        const SizedBox(width: Dimensions.space5 + 3),
                        Expanded(
                          child: CustomTextField(
                            animatedLabel: true,
                            needOutlineBorder: true,
                            labelText: MyStrings.phoneNo.tr,
                            controller: controller.mobileController,
                            focusNode: controller.mobileFocusNode,
                            textInputType: TextInputType.phone,
                            inputAction: TextInputAction.next,
                            onChanged: (value) {
                              return;
                            },
                          ),
                        )
                      ]
                    ),
                    const SizedBox(height: Dimensions.space16),
                  ],
                )
              ),
              CustomTextField(
                controller: controller.mobileController,
                textInputType: TextInputType.number,
                focusNode: controller.mobileFocusNode,
                nextFocus: controller.emailFocusNode,
                labelText: MyStrings.mobile.tr,
                animatedLabel: true,
                needOutlineBorder: true,
                onChanged: (value){},
                onSuffixTap: () {},
                validator: (value) {
                  if(value.isEmpty){
                    return MyStrings.fieldErrorMsg.tr;
                  }
                  else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space16),
              Focus(
                onFocusChange: (hasFocus){
                  controller.changePasswordFocus(hasFocus);
                },
                child: CustomTextField(
                  animatedLabel: true,
                  needOutlineBorder: true,
                  isShowSuffixIcon: true,
                  isPassword: true,
                  labelText: MyStrings.password.tr,
                  controller: controller.passwordController,
                  focusNode: controller.passwordFocusNode,
                  nextFocus: controller.confirmPasswordFocusNode,
                  textInputType: TextInputType.text,
                  onChanged: (value) {
                    if(controller.checkPasswordStrength){

                    }
                  },
                  validator: (value) {
                    return controller.validatePassword(value ?? '');
                  },
                )
              ),
              const SizedBox(height: Dimensions.textToTextSpace),
              const SizedBox(height: Dimensions.space16),
              CustomTextField(
                animatedLabel: true,
                needOutlineBorder: true,
                labelText: MyStrings.confirmPassword.tr,
                controller: controller.cPasswordController,
                focusNode: controller.confirmPasswordFocusNode,
                inputAction: TextInputAction.done,
                isShowSuffixIcon: true,
                isPassword: true,
                onChanged: (value) {},
                validator: (value) {
                  if (controller.passwordController.text.toLowerCase() != controller.cPasswordController.text.toLowerCase()) {
                    return MyStrings.kMatchPassError.tr;
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space25),
              Visibility(
                visible: controller.needAgree,
                child: Row(
                children: [
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                      activeColor: MyColor.primaryColor,
                      checkColor: MyColor.colorWhite,
                      value: controller.agreeTC,
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                        width: 1.0,
                        color: controller.agreeTC ? MyColor.getTextFieldEnableBorder() : MyColor.getTextFieldDisableBorder()
                       ),
                      ),
                      onChanged: (bool? value) {
                        controller.updateAgreeTC();
                      },
                    ),
                  ),
                  const SizedBox(width: Dimensions.space8),
                  Row(
                    children: [
                      Text(MyStrings.iAgreeWith.tr, style: regularDefault.copyWith(color: MyColor.getTextColor())),
                      const SizedBox(width: Dimensions.space3),
                      GestureDetector(
                        onTap: (){},
                        child: Text(
                          MyStrings.privacyPolicy.tr,
                          style: regularDefaultInter.copyWith(
                          color: MyColor.getPrimaryColor(),
                          decorationColor: MyColor.getPrimaryColor()
                        )),
                      ),
                      const SizedBox(width: Dimensions.space3),
                    ],
                  ),
                ],
              )),
              const SizedBox(height: Dimensions.space25),
              controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                text: MyStrings.signUp.tr,
                press: (){
                    Get.offAndToNamed(RouteHelper.smsVerificationScreen);
                }
              ),
            ],
          ),
        );
      },
    );
  }
}
  