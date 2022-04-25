import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/gen/assets.gen.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({Key? key}) : super(key: key);

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
                  onPressed: () =>Get.back(),
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
              'Viel spaß!',
              textAlign: TextAlign.center,
              style: Get.textTheme.headline3,
            ),
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            Text(
              kSurveyText,
              textAlign: TextAlign.center,
              style: Get.textTheme.headline6,
            ),
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            SvgPicture.asset(
              Assets.images.svgs.survey.path,
              fit: BoxFit.contain,
            )
          ],
        ),
      )),
    );
  }
}
