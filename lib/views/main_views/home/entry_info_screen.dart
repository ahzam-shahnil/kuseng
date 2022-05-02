import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/views/main_views/home/selfie_screen.dart';
import 'package:kuseng/views/main_views/home/survey_end_screen.dart';
import 'package:kuseng/widgets/square_container.dart';

class EntryInfoScreen extends StatelessWidget {
  const EntryInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,

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
                height: Get.size.height * 0.04,
              ),
              Text(
                kEntryText,
                style: Get.textTheme.headline5,
              ),
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              Text(
                kEntryQuestionText,
                style: Get.textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              SquareContainer(
                child: Text(
                  'JA',
                  style: Get.textTheme.headline4,
                ),
                onTap: () {
                  Get.to(() => const SurveyEndScreen(),
                      transition: Transition.native);
                },
              ),
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              SquareContainer(
                child: Text(
                  'NEIN',
                  style: Get.textTheme.headline4,
                ),
                onTap: () {
                  Get.to(() => const SelfieScreen(),
                      transition: Transition.native);
                },
              ),
            ],
        ),
      ),
          )),
    );
  }
}
