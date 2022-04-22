//? Text Constants for app

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

const kAppTitle = 'KUSENG';

const kOnbardOneTxt =
    """
Wir sind gegen Rassimus, Seximus, Ableismus,
Antisemitismus, Queer- und Transfeindlichkeit.
Mit der Kuseng-App möchten wir, vorallem in der
Clubszene, das Zusammenleben verbessern und
jegliche rassistischen Vorfälle vermeiden.""";

const kOnbardTwoTxt =
    """
In der Clubszene kommt es oft zu unfairen
Vorfällen. Wir möchten diese Vorfälle in der
Zukunft, mit deiner Hilfe, vermeiden.
Mit der Kuseng-App kannst du den jeweiligen
Club auswählen und deinen Vorfall melden.""";

const kRegisterText =
    """
Fotografiere nun deinen Personalausweis. Verdecke
anschließend alle Informationen, die nicht benötigt
werden.""";

const kOnBoardBtnText = 'WEITER';
const kPassWordForgotTxt = 'Passwort vergessen?';
const kNameText = 'Vollständiger Name (nicht öffentlich)';
const kUserNameText = 'Benutzername (öffentlich)';

//? Colors for App
const kPrimaryColor = Color(0xff4124AA);
const kTextFieldColor = Color(0xffD8D8D8);
const kRegDesTxt = """
Allgemeine Fragen zur Einordnung deines Avatrs,
""";
const kRegMiniDescText =
    """
Diese Daten werden nicht veröffentlicht. Wir nutzen Sie nur für unsere anonymisierte Statistik""";
//* text style checkbox
final kCheckBoxTextStyle =
    Get.textTheme.headline6?.copyWith(fontSize: Get.size.shortestSide * 0.0358);
final kRegScreenPadding = EdgeInsets.only(left: Get.size.width * 0.1);
//* For debug Printing
Logger log = Logger();
