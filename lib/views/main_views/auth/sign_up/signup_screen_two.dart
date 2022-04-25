import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/gen/assets.gen.dart';
import 'package:kuseng/utils/toast_dialogs.dart';
import 'package:kuseng/views/main_views/auth/login_screen.dart';

class SignUpScreenTwo extends StatelessWidget {
  const SignUpScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = Get.size.width;
    double _height = Get.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.08),
          child: ListView(
            // padding: const EdgeInsets.all(30.0),
            physics: const AlwaysScrollableScrollPhysics(),
            // shrinkWrap: true,
            primary: true,
            children: [
              SizedBox(
                height: _height * 0.08,
              ),
              Text(
                'Registrierung',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: Get.textTheme.headline3?.fontSize),
              ),
              SizedBox(
                height: _height * 0.015,
              ),
              Text(kRegScreen2Txt, style: kCheckBoxTextStyle),
              SizedBox(
                height: _height * 0.05,
              ),
              Container(
                height: _height * 0.55,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                    shape: BoxShape.rectangle),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      Assets.images.signUp.placeholder.path,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: _height * 0.04,
              ),
              SizedBox(
                width: Get.size.width * 0.8,
                height: kToolbarHeight,
                child: ElevatedButton(
                  child: Text(
                    kOnBoardBtnText,
                    style:
                        Get.textTheme.headline5?.copyWith(color: Colors.black),
                  ),
                  onPressed: () {
                    showToast(msg: "Sign Up Success", backColor: Colors.green);
                    Get.offAll(() => const LoginScreen(),
                         transition: Transition.native);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
