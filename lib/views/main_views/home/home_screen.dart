import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/gen/assets.gen.dart';
import 'package:kuseng/views/main_views/home/entry_info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
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
              height: Get.size.height * 0.04,
            ),
            Text(
              kHomeText,
              style: Get.textTheme.headline6,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const EntryInfoScreen(),
                     transition: Transition.native);
              },
              child: Image.asset(Assets.images.maps.path),
            ),
          ],
        ),
      )),
    );
  }
}
