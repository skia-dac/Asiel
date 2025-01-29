import 'package:ShapeCom/config/route/route.dart';
import 'package:ShapeCom/domain/controller/cart_controller/cartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ShapeCom/config/utils/dimensions.dart';
import 'package:ShapeCom/config/utils/my_color.dart';
import 'package:ShapeCom/config/utils/my_strings.dart';
import 'package:ShapeCom/config/utils/style.dart';
import 'package:ShapeCom/domain/controller/auth/forget_password/forget_password_controller.dart';
import 'package:ShapeCom/presentation/components/app-bar/custom_appbar.dart';
import 'package:ShapeCom/presentation/components/buttons/rounded_button.dart';
import 'package:ShapeCom/presentation/components/buttons/rounded_loading_button.dart';
import 'package:ShapeCom/presentation/components/text-form-field/custom_text_field.dart';
import 'package:ShapeCom/presentation/components/text/default_text.dart';
import 'package:ShapeCom/presentation/components/text/header_text.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.put(ForgetPasswordController());
    Get.put(CartCountController());

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.getScreenBgColor(),
        appBar: CustomAppBar(
          fromAuth: true,
          isShowBackBtn: true,
          title: MyStrings.forgetPassword.tr,
          bgColor: MyColor.getAppBarColor(),
        ),
        body: GetBuilder<ForgetPasswordController>(
          builder: (auth) => SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimensions.space30),
                  HeaderText(text: MyStrings.recoverAccount.tr),
                  const SizedBox(height: 15),
                  DefaultText(
                    text: MyStrings.forgetPasswordSubText.tr,
                    textStyle: regularDefault.copyWith(color: MyColor.getTextColor().withOpacity(0.8))),
                  const SizedBox(height: Dimensions.space40),
                  CustomTextField(
                    animatedLabel: true,
                    needOutlineBorder: true,
                    labelText: MyStrings.usernameOrEmail.tr,
                    hintText: MyStrings.usernameOrEmailHint.tr,
                    textInputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                    controller: auth.emailOrUsernameController,
                    onSuffixTap: () {},
                    onChanged: (value) {
                      return;
                    },
                    validator: (value) {
                      if (auth.emailOrUsernameController.text.isEmpty) {
                        return MyStrings.enterEmailOrUserName.tr;
                      } else {
                        return null;
                      }
                    }
                  ),
                  const SizedBox(height: Dimensions.space25),
                  auth.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                  press: () {
                    if(_formKey.currentState!.validate()){
                        Get.toNamed(RouteHelper.verifyPassCodeScreen);
                      }
                    },
                    text: MyStrings.submit.tr,
                  ),
                  const SizedBox(height: Dimensions.space40)
                ],
              ),
            ),
          ),
        )
    );
  }
}
