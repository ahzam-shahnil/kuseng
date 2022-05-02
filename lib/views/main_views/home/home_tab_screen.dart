// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/views/main_views/home/entry_info_screen.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: Get.size.height * 0.73,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  // compassEnabled: true,
                  mapToolbarEnabled: true,
                  // myLocationButtonEnabled: true,
                  // myLocationEnabled: true,
                  // rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  onLongPress: (LatLng value) {
                    log.d(value);
                    Get.to(() => const EntryInfoScreen());
                  },
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hallo Max',
                        style: Get.textTheme.headline4,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          primary: kLightBackColor,
                        ),
                        child: const Icon(
                          Icons.circle_rounded,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.size.height * 0.02,
                  ),
                  Text(
                    kHomeText,
                    style: Get.textTheme.headline6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
