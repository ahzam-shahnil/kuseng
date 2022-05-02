import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuseng/config/app_constants.dart';

class SquareContainer extends StatelessWidget {
  final double? height;
  final double? width;
  const SquareContainer({
    Key? key,
    required this.child,
    required this.onTap,
    this.height,
    this.width,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kLightBackColor,
      // borderRadius: BorderRadius.circular(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.purple,
        child: Container(
          height: height??Get.size.height * 0.25,
          width: width??Get.size.width * 0.78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
            // shape: BoxShape.rectangle,
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
