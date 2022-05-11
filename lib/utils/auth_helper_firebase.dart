// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/config/firebase.dart';
import 'package:kuseng/model/case_model.dart';
import 'package:kuseng/model/club_model.dart';
import 'package:kuseng/model/user_model.dart';
import 'package:kuseng/utils/toast_dialogs.dart';

class AuthHelperFirebase {
  String? userUid;

  // Future<void> addItem(
  //     {required UserDetail userDetail, required String collectionName}) async {
  //   DocumentReference documentReferencer =
  //       _firestore.collection(collectionName).doc(userUid);

  //   await documentReferencer
  //       .set(userDetail)
  //       .whenComplete(() => debugPrint("Notes item added to the database"))
  //       .catchError((e) => debugPrint(e));
  // }

  Stream<DocumentSnapshot<Map<String, dynamic>>> readItems(
      {required String collectionName}) {
    DocumentReference<Map<String, dynamic>> notesItemCollection =
        firestore.collection(collectionName).doc(userUid);

    return notesItemCollection.snapshots();
  }

  Future<void> updateItem(
      {required String title,
      required String description,
      required String docId,
      required String collectionName}) async {
    DocumentReference documentReferencer =
        firestore.collection(collectionName).doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => debugPrint("Note item updated in the database"))
        .catchError((e) => debugPrint(e));
  }

  Future<void> deleteItem(
      {required String docId, required String collectionName}) async {
    DocumentReference documentReferencer =
        firestore.collection(collectionName).doc(docId);
    await documentReferencer
        .delete()
        .whenComplete(() => debugPrint('Item deleted from the database'))
        .catchError((e) => debugPrint(e));
  }

  static String? getCurrentUserUid() {
    // FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      debugPrint(auth.currentUser?.uid);
      return auth.currentUser?.uid;
    }
    return null;
  }

  // static void _clearCache() async {
  //   await DefaultCacheManager().emptyCache();
  //   // showToast(
  //   //     msg: 'Cache Cleared', backColor: Colors.green, textColor: Colors.white);
  // }

  static Future<void> signOutAndCacheClear() async {
    // FirebaseAuth auth = FirebaseAuth.instance;
    try {
      if (auth.currentUser != null) {
        //TODO: enable login controller here
        // loginController.isLoggedIn.value = false;
        debugPrint(auth.currentUser?.uid);
        await auth.signOut();
        // Delete value
        await storagePrefs.deleteAll();
        // await storagePrefs.delete(key: kUserTypeSharedPrefKey);
        // _clearCache();

// Delete all
        // await _sharedPref.deleteAll();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(msg: 'Email is already in Use');
      } else if (e.code == 'weak-password') {
        showToast(msg: 'Password is weak');
      }
    } catch (e) {
      log.i('catch sign up : $e');
      showToast(msg: 'Something went wrong');
    }
  }

  static User? getCurrentUserDetails() {
    // FirebaseAuth auth = FirebaseAuth.instance;
    try {
      if (auth.currentUser != null) {
        log.i(auth.currentUser);
        return auth.currentUser;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // static Future<List<ProductModel>?> fetchProducts(String uid) async {
  //   var data = await firestore
  //       .collection(kMerchantDb)
  //       .doc(uid)
  //       .collection(kProductCollection)
  //       .orderBy('title', descending: true)
  //       .get();
  //   try {
  //     return List.from(data.docs.map((e) => ProductModel.fromSnapshot(e)));
  //   } catch (e) {
  //     logger.e(e);
  //     return null;
  //   }
  // }

  void deleteFirebaseUser(String email, String password, String collectionName,
      String docId) async {
    try {
      UserCredential? userCredentials = await logInUser(email, password);
      if (userCredentials?.user != null) {
        await deleteItem(docId: docId, collectionName: collectionName);
        await userCredentials?.user?.delete();
        Fluttertoast.showToast(
          msg: 'Deleted Record Sucessfully',
        );
      } else {
        Fluttertoast.showToast(
          msg: 'No Record deleted',
        );
      }
      // await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        debugPrint(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  static isUserNameAvailable(
    UserModel user,
  ) async {
    var userList = await fetchUsers();
    log.d(userList);
    bool isAvailable =
        userList?.where((item) => item.userName == user.userName).isNotEmpty ??
                false
            ? false
            : true;
    log.d(userList?.where((item) => item.userName == user.userName));
    return isAvailable;
  }

  static Future<List<UserModel>?> fetchUsers() async {
    var data = await firestore
        .collection(kUserDb)
        .orderBy(
          'userName',
        )
        .get();
    try {
      return List.from(data.docs.map((e) => UserModel.fromSnapshot(e)));
    } catch (e) {
      log.e(e);
      return null;
    }
  }

  static Future<List<ClubModel>> fetchClubs() async {
    var data = await firestore
        .collection('clubs')
        .orderBy(
          'name',
        )
        .get();
    log.d(data.docs.map((e) => log.d(ClubModel.fromSnapshot(e))));
    try {
      return List.from(data.docs.map((e) => ClubModel.fromSnapshot(e)));
    } catch (e) {
      log.e(e);
      return [];
    }
  }

  static Future<void> saveCase(CaseModel userCase, BuildContext context) async {
    var progressDialog = getProgressDialog(
        title: 'Please wait ', msg: 'Uploading Case...', context: context);
    progressDialog.show();
    final CollectionReference _mainCollection;

    _mainCollection = firestore.collection('cases');
    DocumentReference documentReferencer = _mainCollection.doc();

    //* Converting data to map
    Map<String, dynamic>? data = userCase.toMap();
    try {
      await documentReferencer
          .set(data)
          .whenComplete(
              () => showToast(msg: "Success.", backColor: Colors.green))
          .catchError((e) => log.e(e));

      Future.delayed(const Duration(milliseconds: 200));
      progressDialog.dismiss();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(msg: 'Email is already in Use');
      } else if (e.code == 'weak-password') {
        showToast(msg: 'Password is weak');
      }
      log.e(e);
      rethrow;
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  static Future<UserCredential?> logInUser(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
      rethrow;
    }
  }

  static Future<UserCredential?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        debugPrint('Email is already in Use');
      } else if (e.code == 'weak-password') {
        debugPrint('Password is weak');
      }

      rethrow;
    }
  }

  dynamic authenticaTeUser(String email, String password) async {
// Create a credential
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);

// Reauthenticate
    await FirebaseAuth.instance.currentUser!
        .reauthenticateWithCredential(credential);
  }
}
