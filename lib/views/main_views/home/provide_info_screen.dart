import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuseng/components/rounded_rectangular_input_field.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/config/enums.dart';
import 'package:kuseng/views/main_views/home/provide_info_two_screen.dart';

class ProvideInfoScreen extends StatelessWidget {
  const ProvideInfoScreen({Key? key}) : super(key: key);

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
              Hero(
                tag: Tags.caseTag,
                child: Row(
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
              ),
              SizedBox(
                height: Get.size.height * 0.04,
              ),
              Hero(
                tag: Tags.infoTag,
                child: Text(
                  kProvideInfoText,
                  style: Get.textTheme.headline5,
                ),
              ),
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              Hero(
                tag: Tags.selfieTag,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1. Selfie',
                        style: Get.textTheme.headline6,
                      ),
                      const Icon(
                        Icons.check_box_outlined,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.size.height * 0.03,
              ),

              //* Your statement about the issue
              Hero(
                tag: Tags.erkalaTag,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: '2. Erklärung',
                        style: Get.textTheme.headline6,
                        children: [
                          TextSpan(
                              text: '\n$kIncidentReportText',
                              style: kCheckBoxTextStyle)
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: Get.size.height * 0.03,
              ),
              RoundedRectangleInputField(
                hintText: '',
                height: Get.size.height * 0.35,
              ),
              SizedBox(
                height: Get.size.height * 0.08,
              ),
              Hero(
                tag: Tags.infoBtn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: Get.size.width * 0.8,
                    height: kToolbarHeight,
                    child: ElevatedButton(
                      child: Text(
                        kOnBoardBtnText,
                        style: Get.textTheme.headline5
                            ?.copyWith(color: Colors.black),
                      ),
                      onPressed: () {
                        Get.to(() => const ProvideInfoTwoScreen(),
                            transition: Transition.native);
                      },
                    ),
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
