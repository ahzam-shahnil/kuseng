import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/gen/assets.gen.dart';

import '../auth/login_screen.dart';

class SelfieScreen extends StatefulWidget {
  const SelfieScreen({Key? key}) : super(key: key);

  @override
  State<SelfieScreen> createState() => _SelfieScreenState();
}

class _SelfieScreenState extends State<SelfieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    primary: kLightBackColor,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'F-123456',
                  style: Get.textTheme.headline4,
                ),
              ],
            ),
            SizedBox(
              height: Get.size.height * 0.15,
            ),
            Text(
              kSelfieText,
              textAlign: TextAlign.center,
              style: Get.textTheme.headline4,
            ),
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            Text(
              kSelfieInfoText,
              textAlign: TextAlign.center,
              style: Get.textTheme.headline6,
            ),
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            SvgPicture.asset(
              Assets.images.svgs.selfie.path,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: Get.size.height * 0.25,
            ),
            SizedBox(
              width: Get.size.width * 0.8,
              height: kToolbarHeight,
              child: ElevatedButton(
                child: Text(
                  kSelfieBtnText,
                  style: Get.textTheme.headline5?.copyWith(color: Colors.black),
                ),
                onPressed: () {
                  Get.to(() => const LoginScreen(),
                       transition: Transition.native);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}