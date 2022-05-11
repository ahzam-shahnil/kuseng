// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/utils/auth_helper_firebase.dart';
import 'package:kuseng/views/main_views/home/home_screen.dart';
import '../config/firebase.dart';
import '../utils/toast_dialogs.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoggedIn = false.obs;

  // Future<void> _setInitialScreen() async {
  //   String? userCredential = await getLoggedInUser();

  //   if (userCredential != null) {
  //     isLoggedIn.value = true;

  //     Get.offAll(() => const HomeScreen());
  //   } else {
  //     isLoggedIn.value = false;
  //     Get.offAll(() => const LoginScreen());
  //   }

  //   // hideLoading();
  //   // showToast(msg: token!);
  //   // showToast(msg: isLoggedIn.toString());
  // }

  loginUser(BuildContext context) {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      // show error toast
      showToast(
        msg: 'Please fill all fields',
      );
      return;
    } else {
      //? Calling Login
      _logIn(
        context: context,
        email: email,
        password: password,
      );
    }
  }

  Future<void> _logIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    // request to firebase auth

    var progressDialog = getProgressDialog(
        context: context, msg: 'Please Wait', title: 'Logging In');
    progressDialog.show();

    try {
      UserCredential? userCredential =
          await AuthHelperFirebase.logInUser(email, password);

      // if (userCredential?.user?.emailVerified == false) {
      //   progressDialog.setMessage(const Text("Verify your email to login."));
      //   progressDialog.dismiss();
      //   throw FirebaseAuthException(code: 'verify_email');
      // }
      if (userCredential?.user != null) {
        // //*saving User to secure storageR
        // storeTokenAndData(userCredential!);
        // // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
        // final CollectionReference _mainCollection;

        // //* Checking User to store Data
        // _mainCollection = firestore
        //     .collection(kUserDb)
        //     .doc(userCredential.user?.uid)
        //     .collection('kProfileCollection');

        // // bool? isUser;
        // var collection = await _mainCollection
        //     .where('kUserIdDoc', isEqualTo: userCredential.user?.uid)
        //     .get();

        // if (collection.docs.isNotEmpty) {
        //   progressDialog.dismiss();

        //   Get.offAll(() => const HomeScreen());
        // } else {
        //   progressDialog.dismiss();
        //   showToast(
        //     msg: 'User not found',
        //   );
        // }
        progressDialog.dismiss();
        Get.offAll(() => const HomeScreen());
      } else {
        progressDialog.dismiss();
        showToast(
          msg: 'User not found',
        );
        AuthHelperFirebase.signOutAndCacheClear();
      }
    } on FirebaseAuthException catch (e) {
      progressDialog.dismiss();
      log.d(e.code);
      if (e.code == 'user-not-found') {
        showToast(
          msg: 'User not found',
        );
      } else if (e.code == 'wrong-password') {
        showToast(
          msg: 'Wrong password',
        );
      } else if (e.code == 'verify_email') {
        showToast(msg: "Verify your Email to Login");
      } else if (e.code == 'too-many-requests') {
        showToast(msg: "Too many requests from you. Slow down");
      }
    } catch (e) {
      progressDialog.dismiss();
      showToast(
        msg: 'Something went wrong',
      );
      debugPrint('e : $e');
    }
  }

  Future<void> storeTokenAndData(UserCredential userCredential) async {
    log.d(userCredential.credential?.token.toString());
    log.i(userCredential);
    //TODO: store data here
    // await storagePrefs.write(key: kUserTypeSharedPrefKey, value: selected);
    // await storagePrefs.write(
    //     key: kUserCredSharedPrefKey, value: userCredential.toString());
  }

  Future<String?> getLoggedInUser() async {
    return await storagePrefs.read(key: kUserCredSharedPrefKey);
    // AuthHelperFirebase.getCurrentUserUid();
  }

  Future<String?> getLoggedInUserType() async {
    return await storagePrefs.read(key: kUserTypeSharedPrefKey);
  }
}
