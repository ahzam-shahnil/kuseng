// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:logger/logger.dart';

//? Text Constants for app
const kUserCredSharedPrefKey = 'userCredential';
const kUserTypeSharedPrefKey = 'userType';
const kUserDb = 'users';
// const kProfileCollection = 'profile';
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
const kMigrationText =
    """
Migrationsgeschichte innerhalb der letzten2 Generationn in deiner Familie?""";

const kOnBoardBtnText = 'WEITER';
const kDisabilityText = 'Körperl. Einschränkungen';
const kPassWordForgotTxt = 'Passwort vergessen?';
const kNameText = 'Vollständiger Name (nicht öffentlich)';
const kUserNameText = 'Benutzername (öffentlich)';
const kMotherLngGerText = """Ist deine Muttersprache Deutsch?""";
const kBlackIdentifyText = """Identifizierst du dich als / bist du Schwarz?""";
const kPolicyText =
    """Mit dem Klicken auf Weiter aktzeptierst du unsere AGB’s und Datenschutz erklärung.""";
const kAnotherMotherLngGerText =
    """Hast du eine weitere Mutter-sprache neben Deutsch?""";

//? TEXT used in app

const kEntryText = """Bitte gebe uns weitere Informationen zu deinem Fall""";
const kEntryQuestionText = """Bist du reingekommen?""";

const kSelfieText = """Nimm ein Selfie auf""";
const kSelfieBtnText = """Selfie aufnehmen""";
const kIncidentReportText =
    """Schilder uns bitte, was genau passiert ist. Diese Daten werden nicht öffentlich gezeigt!""";
const kProvideInfoText =
    """Bitte gebe uns weitere Informationen zu deinem Fall.""";
const kHomeText =
    """Wähle den jeweiligen Club aus, um einen Vorfall zu melden""";
const kSelfieInfoText =
    """Achte auf eine gute Belichtung, damit wir das Selfie auswerten können.""";
const kSurveyEndText =
    """
Wir danken Dir dass du an unserer Umfrage teilgenommen hast und dazu für einander zu gestalten. """;
const kSurveyEndTwoText =
    """Wir danken Dir dass du an unserer Umfrage teilgenommen hast und dazu für einander zugestalten. Wir wünschen dir weiterhin viel Glück! """;
const kRegDesTxt = """
Allgemeine Fragen zur Einordnung deines Avatrs,
""";
const kProfileTxt =
    """
Hier kannst du Einstellungen zu deinem Account festlegen.
""";
const kRegScreen2Txt =
    """
Fotografiere nun deinen Personalausweis. Verdecke anschließend alle Informationen, die nicht benötigt werden.
""";
const kRegMiniDescText =
    """
Diese Daten werden nicht veröffentlicht. Wir nutzen Sie nur für unsere anonymisierte Statistik""";

//? Colors for App
const kPrimaryColor = Color(0xff4124AA);
const kTextFieldColor = Color(0xffD8D8D8);
const kLightBackColor = Color(0xff5E46B3);
const kProfileBtnTextList = [
  "Mein Namen ändern",
  "AGB’s & Datenschutz",
  "Standort Einstellungen",
  "Deine Daten",
  "Wer wir sind"
];

//* text style checkbox
final kCheckBoxTextStyle =
    Get.textTheme.headline6?.copyWith(fontSize: Get.size.shortestSide * 0.0358);
final kRegScreenPadding = EdgeInsets.only(left: Get.size.width * 0.1);

//* For debug Printing
Logger log = Logger();
