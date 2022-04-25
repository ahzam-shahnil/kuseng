// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:kuseng/components/custom_checkbox.dart';
import 'package:kuseng/components/switch_row_tile.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/views/main_views/auth/sign_up/signup_screen_two.dart';
import 'package:kuseng/widgets/custom_drop_down.dart';

class SignupScreenOne extends StatefulWidget {
  const SignupScreenOne({Key? key}) : super(key: key);

  @override
  State<SignupScreenOne> createState() => _SignupScreenOneState();
}

class _SignupScreenOneState extends State<SignupScreenOne> {
  bool isFullNameSelected = false;
  bool isUsernameSelected = false;

  final _physicalController = ValueNotifier<bool>(false);
  final _querController = ValueNotifier<bool>(false);
  final _bornController = ValueNotifier<bool>(false);
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = Get.size.width;
    double _height = Get.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.08),
          child: ListView(
            // padding: const EdgeInsets.all(30.0),
            physics: const AlwaysScrollableScrollPhysics(),
            // shrinkWrap: true,
            primary: true,
            children: [
              SizedBox(
                height: _height * 0.08,
              ),
              Text(
                'Registrierung',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: Get.textTheme.headline3?.fontSize),
              ),
              SizedBox(
                height: Get.size.height * 0.025,
              ),
              CheckBoxTextField(
                textEditingController: fullNameController,
                callback: (bool? value) {
                  if (value != null) {
                    setState(() {
                      isFullNameSelected = value;
                    });
                    log.d('Selected : $value');
                  }
                },
                value: isFullNameSelected,
                hintText: 'Vollständiger Name (nicht öffentlich)',
              ),
              CheckBoxTextField(
                callback: (bool? value) {
                  if (value != null) {
                    setState(() {
                      isUsernameSelected = value;
                    });
                    log.d('Selected : $isUsernameSelected');
                  }
                },
                value: isUsernameSelected,
                textEditingController: userNameController,
                hintText: 'Benutzername (öffentlich)',
              ),
              SizedBox(
                height: _height * 0.015,
              ),
              Text(
                kRegDesTxt,
                style: Get.textTheme.headline5,
              ),
              Text(kRegMiniDescText,
                  style:
                      Get.textTheme.bodyLarge?.copyWith(color: Colors.white)),
              SizedBox(
                height: _height * 0.05,
              ),
              const CustomDropDown(),
              SizedBox(
                height: _height * 0.03,
              ),
              SwitchRowTile(
                controller: _physicalController,
                width: _width,
                height: _height,
                text: 'Körperl. Einschränkungen?',
              ),
              SizedBox(
                height: _height * 0.03,
              ),
              SwitchRowTile(
                controller: _querController,
                width: _width,
                height: _height,
                text: 'Identifizierst du dich als Quer?',
              ),
              SizedBox(
                height: _height * 0.03,
              ),
              SwitchRowTile(
                controller: _bornController,
                width: _width,
                height: _height,
                text: """Bist du in Deutschland geboren?""",
              ),
              SizedBox(
                height: _height * 0.1,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const SignUpScreenTwo(),
                       transition: Transition.native);
                },
                child: Text(
                  kOnBoardBtnText,
                  style: kCheckBoxTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
