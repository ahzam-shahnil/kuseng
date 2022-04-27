import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_overlay/flutter_camera_overlay.dart';
import 'package:flutter_camera_overlay/model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/views/main_views/classify_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  OverlayFormat format = OverlayFormat.cardID3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CameraDescription>?>(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return Align(
              alignment: Alignment.center,
              child:
                  SpinKitWanderingCubes(color: Theme.of(context).primaryColor),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No camera found',
                    style: kCheckBoxTextStyle,
                  ));
            }
            return CameraOverlay(
              snapshot.data!.first,
              CardOverlay.byFormat(format),
              (XFile file) async {
                CardOverlay overlay = CardOverlay.byFormat(format);

                Get.to(() => Classify(
                      image: File(file.path),
                      ratio: overlay.ratio ?? 2,
                    ));
              },
              info:
                  'Position your ID card within the rectangle and ensure the image is perfectly readable.',
              label: 'Scanning ID Card',
              loadingWidget: Align(
                  alignment: Alignment.center,
                  child: SpinKitWanderingCubes(
                      color: Theme.of(context).primaryColor)),
            );
          } else {
            return Align(
                alignment: Alignment.center,
                child: SpinKitWanderingCubes(
                    color: Theme.of(context).primaryColor));
          }
        },
      ),
    );
  }
}
