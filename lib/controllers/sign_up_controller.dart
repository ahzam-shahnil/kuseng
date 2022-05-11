// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/config/firebase.dart';
import 'package:kuseng/utils/toast_dialogs.dart';
import 'package:kuseng/utils/upload_image.dart';
import 'package:kuseng/utils/validators.dart';
import 'package:kuseng/views/main_views/auth/sign_up/picture_info_screen.dart';
import '../config/app_constants.dart';
import '../model/user_model.dart';
import '../utils/auth_helper_firebase.dart';
import '../views/main_views/auth/login_screen.dart';

// Project imports:

class SignUpController extends GetxController {
  static SignUpController instance = Get.find();
  var selectedGender = "".obs;
  var user = UserModel(
      bodyDisabilities: false,
      bornInGermany: false,
      fullName: '',
      identifyBlack: false,
      identifyQueer: false,
      migrationHistorySinceTwoYears: false,
      motherLangGerman: false,
      motherLangText: null,
      bodyDisabilitiesText: null,
      otherLangs: false,
      userName: '',
      email: '',
      password: '',
      gender: '',
      userID: '');
//*Switch Tile Controllers
  final physicalTileController = ValueNotifier<bool>(false);
  final queerTileController = ValueNotifier<bool>(false);
  final migrationTileController = ValueNotifier<bool>(false);
  final motherLngTileController = ValueNotifier<bool>(false);
  final otherLanguageTileController = ValueNotifier<bool>(false);
  final identifyAsBlackTileController = ValueNotifier<bool>(false);
  final bornTileController = ValueNotifier<bool>(false);

  //* text editing Controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController physicalTextController = TextEditingController();
  final TextEditingController motherLngTextController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> saveUserData(BuildContext context) async {
    var fullName = fullNameController.text.trim();
    var userName = userNameController.text.trim();
    var email = emailController.text.trim();
    var password = passwordController.text.trim();
    var bodyDisabilities = physicalTileController.value;
    var bodyDisabilitiesText =
        bodyDisabilities ? physicalTextController.text.trim() : null;
    var motherLangGerman = motherLngTileController.value;
    var otherLangs = otherLanguageTileController.value;
    var identifyBlack = identifyAsBlackTileController.value;
    var motherLangText =
        motherLangGerman ? null : physicalTextController.text.trim();
    var identifyQueer = queerTileController.value;
    var bornInGermany = bornTileController.value;
    var gender = selectedGender.value;
    var migrationHistorySinceTwoYears = migrationTileController.value;

    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        userName.isEmpty) {
      // show error toast

      showToast(
        msg: 'Please fill all fields',
      );
      return;
    }
    if (bodyDisabilities == true) {
      if (bodyDisabilitiesText!.isEmpty) {
        showToast(
          msg: 'Please enter Körperliche Einschränkungen',
        );
        return;
      }
    }
    if (motherLangGerman == false) {
      if (motherLangText!.isEmpty) {
        showToast(
          msg: 'Please enter Muttersprache eingeben',
        );
        return;
      }
    }
    if (checkEmail(email) == false) {
      showToast(msg: 'Email is Invalid');

      return;
    }

    if (checkUserName(userName) == false) {
      showToast(msg: 'UserName is Invalid');

      return;
    }
    if (gender.isEmpty) {
      showToast(msg: 'Please select gender');

      return;
    }

    user = UserModel(
        bodyDisabilities: bodyDisabilities,
        bornInGermany: bornInGermany,
        fullName: fullName,
        identifyBlack: identifyBlack,
        identifyQueer: identifyQueer,
        migrationHistorySinceTwoYears: migrationHistorySinceTwoYears,
        motherLangGerman: motherLangGerman,
        motherLangText: motherLangText,
        bodyDisabilitiesText: bodyDisabilitiesText,
        otherLangs: otherLangs,
        userName: userName,
        email: email,
        password: password,
        gender: gender,
        userID: '');

    //? In case of no error , we do sign up
    if (await AuthHelperFirebase.isUserNameAvailable(user) == false) {
      showToast(msg: 'UserName is Not Available');
      // throw "UserName is Not Available";
      return;
    }
    Get.to(() => const PictureInfoScreen(), transition: Transition.native);
    // await _signUpUser(context: context, user: _user);
  }

  Future<void> signUp(
      {required BuildContext context,
      required UserModel userData,
      required File imageFile}) async {
    //? saving the product to database and savinf Db ref to Qr
    var progressDialog = getProgressDialog(
        title: 'Please wait ', msg: 'Uploading Image...', context: context);
    progressDialog.show();
    String? imgUrl;
    //showLoading('Adding ...');

    try {
      imgUrl = await uploadImage(
          imageFile: imageFile,
          metaData: {'name': user.fullName, 'description': user.userName},
          userName: user.userName);

      progressDialog.setMessage(const Text('Signing Up...'));
      UserCredential? userCredential =
          await AuthHelperFirebase.signUp(userData.email, userData.password);
      log.i('before database');

      if (userCredential?.user != null) {
        final CollectionReference _mainCollection;

        // Merchant? _merchant;
        String? uid = userCredential?.user!.uid;

        //* Checking User to store Data
        userData = userData.copyWith(userID: uid, imageUrl: imgUrl);
        _mainCollection = firestore.collection(kUserDb);
        DocumentReference documentReferencer = _mainCollection.doc(uid);

        //* Converting data to map
        Map<String, dynamic>? data = userData.toMap();

        await documentReferencer
            .set(data)
            .whenComplete(() =>
                showToast(msg: "Sign Up Success.", backColor: Colors.green))
            .catchError((e) => log.e(e));
        // progressDialog.setMessage(const Text('Verify email is sent.'));
        // //* sending verify email
        // await userCredential?.user?.sendEmailVerification();
        Future.delayed(const Duration(milliseconds: 200));
        progressDialog.dismiss();

        AuthHelperFirebase.signOutAndCacheClear();
        Get.to(() => const LoginScreen(), transition: Transition.native);
        // Get.to(() => const PictureInfoScreen(), transition: Transition.native);
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

  clearSignUpDetails() {
    fullNameController.clear();
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    physicalTileController.value = false;

    physicalTextController.clear();
    motherLngTileController.value = false;
    otherLanguageTileController.value = false;
    identifyAsBlackTileController.value = false;
    selectedGender.value = "";
    physicalTextController.clear();
    queerTileController.value = false;
    bornTileController.value = false;
    migrationTileController.value = false;
  }
}
