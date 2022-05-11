// Dart imports:
import 'dart:async';
import 'dart:io';

// Package imports:
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

// Project imports:
import 'package:kuseng/config/firebase.dart';
import '../config/app_constants.dart';
import '../config/app_exceptions.dart';

// Flutter imports:

// Project imports:

Future<String?> uploadImage(
    {required File imageFile,
    Map<String, String>? metaData,
    required String userName}) async {
  try {
    final String fileName = path.basename(imageFile.path);
    log.i(fileName);
    String? imgUrl;

    try {
      // Uploading the selected image with some custom meta data
      var taskSnapshot = await storage
          .ref()
          .child('images/users/$userName')
          .putFile(imageFile, SettableMetadata(customMetadata: metaData));

      imgUrl = await taskSnapshot.ref.getDownloadURL();
      log.i("Done: $imgUrl");
      // Refresh the UI
      return imgUrl;
      // setState(() {});
    } on FirebaseException {
      rethrow;
    }
  } on TimeoutException {
    throw ApiNotRespondingException(
      'API not responded in time',
    );
  } catch (err) {
    rethrow;
  }
}