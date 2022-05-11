import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/model/case_model.dart';
import 'package:kuseng/model/club_model.dart';
import 'package:kuseng/utils/auth_helper_firebase.dart';
import 'package:kuseng/utils/toast_dialogs.dart';
import 'package:kuseng/utils/upload_image.dart';
import 'package:kuseng/views/main_views/home/entry_info/provide_info_screen.dart';
import 'package:kuseng/views/main_views/home/entry_info/provide_info_two_screen.dart';
import 'package:kuseng/views/main_views/home/entry_info/selfie_screen.dart';
import 'package:kuseng/views/main_views/home/entry_info/survey_end_screen.dart';
import 'package:kuseng/views/main_views/home/entry_info/survey_end_screen_two.dart';

class ClubEntryController extends GetxController {
  static ClubEntryController instance = Get.find();
  var imgFile = File('').obs;

  final TextEditingController explanationController = TextEditingController();
  // var didRetry
  var userCase = CaseModel(
          userID: '',
          caseID: '',
          clubName: '',
          clubDocID: '',
          didComeIn: false,
          date: DateTime.now())
      .obs;
  var selectedClub = ClubModel(
          city: '',
          location: const GeoPoint(0.0, 0.0),
          name: '',
          clubDocID: '',
          street: '',
          zipCode: '')
      .obs;
  var caseID = ''.obs;

  void generateCaseID() {
    final _random = Random();
    final currentDate = DateTime.now();
    String currentMonth = currentDate.month > 9
        ? currentDate.month.toString()
        : "0" + currentDate.month.toString();
    const _availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    final randomString = (currentDate.year - 2000).toString() +
        currentMonth +
        currentDate.day.toString() +
        List.generate(
                5,
                (index) =>
                    _availableChars[_random.nextInt(_availableChars.length)])
            .join();
    log.d("case Id" + caseID.value);
    caseID.value = randomString;
  }

  saveRetryUsercase(bool retry) {
    userCase.value = userCase.value.copyWith(retry: retry);
  }

  saveNotEnterUserCase({
    required BuildContext context,
  }) async {
    //? saving the product to database and savinf Db ref to Qr
    var progressDialog = getProgressDialog(
        title: 'Please wait ', msg: 'Uploading Image...', context: context);
    progressDialog.show();
    String? imgUrl;

    try {
      imgUrl = await uploadImage(
          imageFile: imgFile.value,
          metaData: {
            'name': selectedClub.value.name,
            'description': selectedClub.value.street
          },
          userName: selectedClub.value.clubDocID);

      progressDialog.dismiss();

      String? uid = AuthHelperFirebase.getCurrentUserUid();
      if (uid != null) {
        log.d("Saving Data ${userCase.value}");
        try {
          await AuthHelperFirebase.saveCase(userCase.value, context);
          Get.offAll(() => const SurveyEndTwoScreen());
        } catch (e) {
          showToast(msg: "Something Went Wrong");
        }
        Future.delayed(const Duration(milliseconds: 200));
      } else {
        showToast(msg: 'Failed');
      }

      progressDialog.dismiss();
    } on FirebaseAuthException catch (e) {
      progressDialog.dismiss();
      if (e.code == 'email-already-in-use') {
        showToast(msg: 'Email is already in Use');
      } else if (e.code == 'weak-password') {
        showToast(msg: 'Password is weak');
      }
      log.e(e);
    } catch (e) {
      progressDialog.dismiss();
      log.i('catch sign up : $e');
      if (e == "UserName is Not Available") {
        showToast(msg: 'UserName is Not Available');
      } else {
        showToast(msg: 'Something went wrong');
      }
    }
  }

  saveImageFile(File img) {
    imgFile.value = img;

    Get.to(() => const ProvideInfoScreen(), transition: Transition.native);
  }

  saveExplanation() {
    if (explanationController.text.trim().isNotEmpty) {
      userCase.value = userCase.value
          .copyWith(explanation: explanationController.text.trim());
      Get.to(() => const ProvideInfoTwoScreen(), transition: Transition.native);
    } else {
      showToast(msg: "Give an Explanation Please");
    }
  }

  saveUserCase(
      {required bool didComein,
      required ClubModel clubModel,
      required BuildContext context,
      bool? retry}) async {
    if (didComein) {
      userCase.value = userCase.value.copyWith(
        userID: AuthHelperFirebase.getCurrentUserUid(),
        didComeIn: didComein,
        clubDocID: clubModel.clubDocID,
        clubName: clubModel.name,
        caseID: caseID.value,
        date: DateTime.now(),
        explanation: null,
        retry: null,
      );
      selectedClub.value = clubModel;
      log.d("Saving Data ${userCase.value}");
      try {
        await AuthHelperFirebase.saveCase(userCase.value, context);
        Get.offAll(() => const SurveyEndScreen());
      } catch (e) {
        showToast(msg: "Something Went Wrong");
      }
    } else {
      userCase.value = userCase.value.copyWith(
        userID: AuthHelperFirebase.getCurrentUserUid(),
        didComeIn: didComein,
        clubDocID: clubModel.clubDocID,
        clubName: clubModel.name,
        caseID: caseID.value,
        date: DateTime.now(),
        explanation: explanationController.text.trim(),
        retry: retry,
      );
      selectedClub.value = clubModel;
      log.d("Going to next Screen ${userCase.value}");
      Get.to(() => const SelfieScreen());
    }
  }
  // reset(caseId){
  //   ca
  // }
}
