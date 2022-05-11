// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/config/controllers.dart';
import 'package:kuseng/model/club_model.dart';

import 'package:kuseng/widgets/square_container.dart';

class EntryInfoScreen extends StatelessWidget {
  final ClubModel club;
  const EntryInfoScreen({Key? key, required this.club}) : super(key: key);

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
                  Obx(() => Text(
                        clubEntryController.caseID.value,
                        style: Get.textTheme.headline4,
                      )),
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
                  clubEntryController.saveUserCase(
                      didComein: true, clubModel: club, context: context);
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
                  clubEntryController.saveUserCase(
                      didComein: false, clubModel: club, context: context);
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
