// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/components/rectangular_password_field.dart';
import 'package:kuseng/components/rounded_rectangular_input_field.dart';
import 'package:kuseng/components/switch_row_tile.dart';
import 'package:kuseng/components/switch_tile_textfield.dart';
import 'package:kuseng/config/app_constants.dart';
import 'package:kuseng/config/controllers.dart';
import 'package:kuseng/widgets/custom_drop_down.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
              physics: const AlwaysScrollableScrollPhysics(),
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
                RoundedRectangleInputField(
                  hintText: 'Email',
                  icon: null,
                  textController: signUpController.emailController,
                  textInputType: TextInputType.name,
                  autofillHints: const [AutofillHints.email],
                ),
                SizedBox(
                  height: _height * 0.015,
                ),
                RectangularPasswordField(
                  autofillHints: const [AutofillHints.password],
                  textController: signUpController.passwordController,
                ),
                SizedBox(
                  height: _height * 0.015,
                ),
                RoundedRectangleInputField(
                  hintText: 'Vollständiger Name (nicht öffentlich)',
                  textCapitalization: TextCapitalization.words,
                  textController: signUpController.fullNameController,
                  autofillHints: const [AutofillHints.name],
                ),
                SizedBox(
                  height: _height * 0.015,
                ),
                RoundedRectangleInputField(
                  hintText: 'Benutzername (öffentlich)',
                  textController: signUpController.userNameController,
                  autofillHints: const [AutofillHints.newUsername],
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
                CustomDropDown(),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: signUpController.physicalTileController,
                  width: _width,
                  height: _height,
                  text: kDisabilityText + '?',
                ),
                SwitchTileTextField(
                  controller: signUpController.physicalTileController,
                  textController: signUpController.physicalTextController,
                  hintText: 'Körperliche Einschränkungen',
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: signUpController.queerTileController,
                  width: _width,
                  height: _height,
                  text: 'Identifizierst du dich als Quer?',
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: signUpController.bornTileController,
                  width: _width,
                  height: _height,
                  text: """Bist du in Deutschland geboren?""",
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: signUpController.migrationTileController,
                  width: _width,
                  height: _height,
                  text: kMigrationText,
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: signUpController.motherLngTileController,
                  width: _width,
                  height: _height,
                  text: kMotherLngGerText,
                ),
                SwitchTileTextField(
                  controller: signUpController.motherLngTileController,
                  textController: signUpController.motherLngTextController,
                  hintText: 'Muttersprache eingeben',
                  isInvert: true,
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: signUpController.otherLanguageTileController,
                  width: _width,
                  height: _height,
                  text: kAnotherMotherLngGerText,
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                SwitchRowTile(
                  controller: signUpController.identifyAsBlackTileController,
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
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    await signUpController.saveUserData(context);
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
