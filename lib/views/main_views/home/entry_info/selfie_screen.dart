// Flutter imports:
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/config/controllers.dart';
import 'package:kuseng/gen/assets.gen.dart';
import 'package:kuseng/utils/show_loading.dart';
import 'package:kuseng/views/main_views/auth/sign_up/classify_screen.dart';

class SelfieScreen extends StatefulWidget {
  const SelfieScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SelfieScreen> createState() => _SelfieScreenState();
}

class _SelfieScreenState extends State<SelfieScreen> {
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
                height: Get.size.height * 0.15,
              ),
              Text(
                kSelfieText,
                textAlign: TextAlign.center,
                style: Get.textTheme.headline4,
              ),
              SizedBox(
                height: Get.size.height * 0.02,
              ),
              Text(
                kSelfieInfoText,
                textAlign: TextAlign.center,
                style: Get.textTheme.headline6,
              ),
              SizedBox(
                height: Get.size.height * 0.02,
              ),
              SvgPicture.asset(
                Assets.images.svgs.selfie.path,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: Get.size.height * 0.25,
              ),
              SizedBox(
                width: Get.size.width * 0.8,
                height: kToolbarHeight,
                child: ElevatedButton(
                  child: Text(
                    kSelfieBtnText,
                    style:
                        Get.textTheme.headline5?.copyWith(color: Colors.black),
                  ),
                  onPressed: () async {
                    List<CameraDescription> cameras = await availableCameras();
                    Get.to(
                        () => CameraApp(
                              cameras: cameras,
                            ),
                        transition: Transition.native);
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraApp({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.cameras[1],
      // Define the resolution to use.
      ResolutionPreset.max,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: kLightBackColor,
        title: Text(
          'Take a selfie pic',
          style: Get.textTheme.headline4,
        ),
      ),
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showLoading();
          try {
            await _initializeControllerFuture;

            final image = await _controller.takePicture();
            dismissLoadingWidget();
            Get.to(() => Classify(
                  image: File(image.path),
                  ratio: 2,
                  isFromSelfieScreen: true,
                ));
          } catch (e) {
            print(e);
            dismissLoadingWidget();
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Column(
              children: [
                CameraPreview(
                  _controller,
                ),
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
