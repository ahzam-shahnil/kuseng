// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/components/custom_checkbox.dart';
import 'package:kuseng/components/rounded_rectangular_input_field.dart';
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

  final _physicalTileController = ValueNotifier<bool>(false);
  final _queerTileController = ValueNotifier<bool>(false);
  final _migrationTileController = ValueNotifier<bool>(false);
  final _motherLngTileController = ValueNotifier<bool>(false);
  final _anotherMotherLngTileController = ValueNotifier<bool>(false);
  final _identifyAsBlackTileController = ValueNotifier<bool>(false);
  final _bornTileController = ValueNotifier<bool>(false);
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController physicalTextController = TextEditingController();
  final TextEditingController motherLngTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = Get.size.width;
    double _height = Get.size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
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
        child: GestureDetector(
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
                  controller: _physicalTileController,
                  width: _width,
                  height: _height,
                  text: kDisabilityText + '?',
                ),
                SwitchTileTextField(
                  controller: _physicalTileController,
                  textController: physicalTextController,
                  hintText: 'Körperliche Einschränkungen',
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: _queerTileController,
                  width: _width,
                  height: _height,
                  text: 'Identifizierst du dich als Quer?',
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: _bornTileController,
                  width: _width,
                  height: _height,
                  text: """Bist du in Deutschland geboren?""",
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: _migrationTileController,
                  width: _width,
                  height: _height,
                  text: kMigrationText,
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: _motherLngTileController,
                  width: _width,
                  height: _height,
                  text: kMotherLngGerText,
                ),
                SwitchTileTextField(
                  controller: _motherLngTileController,
                  textController: motherLngTextController,
                  hintText: 'Muttersprache eingeben',
                  isInvert: true,
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: _anotherMotherLngTileController,
                  width: _width,
                  height: _height,
                  text: kAnotherMotherLngGerText,
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: _identifyAsBlackTileController,
                  width: _width,
                  height: _height,
                  text: kBlackIdentifyText,
                ),
                SizedBox(
                  height: _height * 0.2,
                ),
                Text(
                  kPolicyText,
                  textAlign: TextAlign.justify,
                  style: kCheckBoxTextStyle,
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const SignUpScreenTwo(),
                        transition: Transition.native);
                  },
                  child: Text(
                    kOnBoardBtnText,
                    style: Get.textTheme.headline6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SwitchTileTextField extends StatelessWidget {
  final ValueNotifier<bool> controller;
  final TextEditingController textController;
  final String hintText;
  final bool isInvert;
  const SwitchTileTextField({
    Key? key,
    required this.controller,
    required this.textController,
    required this.hintText,
    this.isInvert = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, bool value, __) {
        return !isInvert
            ? value
                ? RoundedRectangleInputField(
                    hintText: hintText,
                    textCapitalization: TextCapitalization.sentences,
                    textInputType: TextInputType.text,
                    textController: textController,
                  )
                : const SizedBox()
            : value
                ? const SizedBox()
                : RoundedRectangleInputField(
                    hintText: hintText,
                    textCapitalization: TextCapitalization.sentences,
                    textInputType: TextInputType.text,
                    textController: textController,
                  );
      },
    );
  }
}
