// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/config/controllers.dart';
import 'package:kuseng/utils/auth_helper_firebase.dart';
import 'package:kuseng/utils/toast_dialogs.dart';
import 'package:location/location.dart';

import 'entry_info/entry_info_screen.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  late GoogleMapController _controller;
  final LatLng _initialcameraposition = const LatLng(20.5937, 78.9629);
  final Location _location = Location();
  final Map<String, Marker> _markers = {};
  void _onMapCreated(GoogleMapController _cntlr) async {
    _controller = _cntlr;
    _location.onLocationChanged.listen(
        (l) async {
          _controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(l.latitude!, l.longitude!), zoom: 15),
            ),
          );
          await Future.delayed(const Duration(seconds: 4));
        },
        cancelOnError: true,
        onError: (e) {
          showToast(msg: 'Error Getting Location Data');
        });
    final clubsList = await AuthHelperFirebase.fetchClubs();

    setState(() {
      _markers.clear();
      for (final club in clubsList) {
        final marker = Marker(
          markerId: MarkerId(club.clubDocID),
          visible: true,
          position: LatLng(club.location.latitude, club.location.longitude),
          infoWindow: InfoWindow(
              title: club.name,
              snippet: club.street,
              onTap: () {
                // log.d(club);
                clubEntryController.generateCaseID();
                Get.to(
                    () => EntryInfoScreen(
                          club: club,
                        ),
                    transition: Transition.native);
              }),
        );
        _markers[club.clubDocID] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: Get.size.height * 0.7,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  // compassEnabled: true,
                  mapToolbarEnabled: true,
                  initialCameraPosition:
                      CameraPosition(target: _initialcameraposition),
                  markers: _markers.values.toSet(),
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                ),
              ),
            ),
            // : ElevatedButton.icon(
            //     onPressed: () {},
            //     icon: const Icon(Icons.gps_fixed_rounded),
            //     label: const Text('Enable Location')),
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
