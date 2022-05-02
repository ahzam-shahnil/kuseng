// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/views/intro_views/splash_screen.dart';

class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
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
                  kProfileTxt,
                  style: Get.textTheme.headline6,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.size.height * 0.03,
          ),
          const Divider(
            height: 3,
            color: Colors.white54,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              height: Get.size.height * 0.35,
              child: ListView.separated(
                  itemCount: kProfileBtnTextList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () {
                          log.d("$index is pressed");
                        },
                        title: Text(
                          kProfileBtnTextList[index],
                          style: kCheckBoxTextStyle,
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return index != 4
                        ? const Divider(
                            height: 3,
                            color: Colors.white54,
                          )
                        : const SizedBox();
                  }),
            ),
          ),
          const Divider(
            height: 3,
            color: Colors.white54,
          ),
          SizedBox(
            height: Get.size.height * 0.2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: Get.size.width * 0.8,
              height: kToolbarHeight,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xff6954B6)),
                child: Text(
                  'Ausloggen',
                  style: Get.textTheme.headline5,
                ),
                onPressed: () {
                  Get.offAll(() => const SpalshScreen());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
