// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:kuseng/components/custom_checkbox.dart';
import 'package:kuseng/config/app_constants.dart';

// Project imports:

// Package imports:

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool value = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {
    double _width = Get.size.width;
    double _height = Get.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('Sign Up'),
      //   centerTitle: true,
      // ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          // padding: const EdgeInsets.all(30.0),
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: Get.size.height * 0.08,
            ),
            Padding(
              padding: kRegScreenPadding,
              child: Text(
                'Registrierung',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: Get.textTheme.headline3?.fontSize),
              ),
            ),
            SizedBox(
              height: Get.size.height * 0.025,
            ),
            AutofillGroup(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCheckBox(
                      child: Text(
                        'Vollständiger Name (nicht öffentlich)',
                        style: kCheckBoxTextStyle,
                      ),
                      callback: (bool? value) {
                        if (value != null) {
                          setState(() {
                            this.value = value;
                          });
                          log.d('Selected : $value');
                        }
                      },
                      value: value,
                    ),
                    CustomCheckBox(
                      child: Text(
                        'Benutzername (öffentlich)',
                        style: kCheckBoxTextStyle,
                      ),
                      callback: (bool? value) {
                        if (value != null) {
                          setState(() {
                            value2 = value;
                          });
                          log.d('Selected : $value2');
                        }
                      },
                      value: value2,
                    ),
                    SizedBox(
                      height: _height * 0.015,
                    ),
                    Padding(
                      padding: kRegScreenPadding,
                      child: Text(
                        kRegDesTxt,
                        style: Get.textTheme.headline5,
                      ),
                    ),
                    Padding(
                      padding: kRegScreenPadding,
                      child: Text(kRegMiniDescText,
                          style: Get.textTheme.bodyLarge
                              ?.copyWith(color: Colors.white)),
                    ),
                    Row(
                      children: const [],
                    ),
                    // SizedBox(
                    //   height: _height * 0.015,
                    // ),
                    // SizedBox(
                    //   width: Get.size.width * 0.8,
                    //   height: kToolbarHeight,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       //trim for white spaces khtm krne k lea :D
                    //       // loginController.loginUser(context);
                    //       log.d(kOnBoardBtnText);
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //         shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     )),
                    //     child: Text(
                    //       'EINLOGGEN',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.w400,
                    //           color: Colors.black,
                    //           fontSize: Get.textTheme.headline6?.fontSize),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: _height * 0.04,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Container(
                    //       color: Colors.white,
                    //       width: _width * 0.4,
                    //       height: 0.5,
                    //     ),
                    //     Text(
                    //       'ODER',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.w400,
                    //           color: Colors.white,
                    //           fontSize: Get.textTheme.bodyLarge?.fontSize),
                    //     ),
                    //     Container(
                    //       color: Colors.white,
                    //       width: _width * 0.4,
                    //       height: 0.5,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: _height * 0.065,
                    // ),
                    // AlreadyHaveAnAccountCheck(
                    //     press: () => log.d("Pressed Sign Up"), login: true),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
