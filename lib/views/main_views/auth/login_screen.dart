// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/components/rounded_rectangular_input_field.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/gen/assets.gen.dart';
import 'package:kuseng/views/main_views/auth/sign_up/signup_screen_one.dart';
import 'package:kuseng/views/main_views/home/home_screen.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/rectangular_password_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = Get.size.width;
    double _height = Get.size.height;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: Get.size.height * 0.1,
              ),
              Image.asset(
                Assets.images.loginScreen.loginImage.path,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: Get.size.height * 0.025,
              ),
              AutofillGroup(
                child: Column(children: [
                  RoundedRectangleInputField(
                    hintText: 'Benutzername',
                    icon: null,
                    // textController: loginController.emailController,
                    textInputType: TextInputType.name,
                    autofillHints: const [AutofillHints.username],
                  ),
                  const RectangularPasswordField(
                    autofillHints: [AutofillHints.password],
                    // textController: loginController.passwordController,
                  ),
                  TextButton(
                    onPressed: () {
                      log.d("Forgot Btn Clicked");
                    },
                    child: Text(
                      kPassWordForgotTxt,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: Get.textTheme.bodyLarge?.fontSize),
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.015,
                  ),
                  SizedBox(
                    width: Get.size.width * 0.8,
                    height: kToolbarHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(
                          () => const HomeScreen(),
                          transition: Transition.native,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                      child: Text(
                        'EINLOGGEN',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: Get.textTheme.headline6?.fontSize),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.white,
                        width: _width * 0.4,
                        height: 0.5,
                      ),
                      Text(
                        'ODER',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: Get.textTheme.bodyLarge?.fontSize),
                      ),
                      Container(
                        color: Colors.white,
                        width: _width * 0.4,
                        height: 0.5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height * 0.065,
                  ),
                  AlreadyHaveAnAccountCheck(
                      press: () => Get.to(
                            () => const SignupScreenOne(),
                            transition: Transition.native,
                          ),
                      login: true),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
