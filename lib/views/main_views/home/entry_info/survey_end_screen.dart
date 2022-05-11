// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/config/controllers.dart';
import 'package:kuseng/gen/assets.gen.dart';
import '../home_screen.dart';

class SurveyEndScreen extends StatelessWidget {
  const SurveyEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4F2FC1),
              Color(0xFF8A1DB4),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ElevatedButton(
                  //   onPressed: () => Get.back(),
                  //   style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(8)),
                  //     primary: kLightBackColor,
                  //   ),
                  //   child: const Icon(
                  //     Icons.arrow_back_ios_new_outlined,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 20,
                  ),
                  Obx(() => Text(
                        clubEntryController.caseID.value,
                        style: Get.textTheme.headline4,
                      )),
                ],
              ),
              SizedBox(
                height: Get.size.height * 0.15,
              ),
              Text(
                'Viel spaß!',
                textAlign: TextAlign.center,
                style: Get.textTheme.headline3,
              ),
              SizedBox(
                height: Get.size.height * 0.02,
              ),
              Text(
                kSurveyEndText,
                textAlign: TextAlign.center,
                style: Get.textTheme.headline6,
              ),
              SizedBox(
                height: Get.size.height * 0.02,
              ),
              SvgPicture.asset(
                Assets.images.svgs.survey.path,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: Get.size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: Get.size.width * 0.8,
                  height: kToolbarHeight,
                  child: ElevatedButton(
                    child: Text(
                      //* submit btn
                      'HomeScreen',
                      style: Get.textTheme.headline5
                          ?.copyWith(color: Colors.black),
                    ),
                    onPressed: () => Get.offAll(() => const HomeScreen()),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
