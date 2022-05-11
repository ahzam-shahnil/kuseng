// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/config/firebase.dart';
import 'package:kuseng/controllers/club_entry_controller.dart';
import 'package:kuseng/controllers/login_controller.dart';
import 'package:kuseng/controllers/sign_up_controller.dart';
import 'package:kuseng/views/main_views/home/home_screen.dart';
import 'config/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialization.then((value) {
    // Get.put(UserController());
    Get.put(LoginController());
    // Get.put(ProductController());
    // Get.put(CartController());
    Get.put(SignUpController());
    Get.put(ClubEntryController());
    // Get.put(ProfileController());
    // Get.put(ProductAddController());
    // Get.put(PaymentsController());
    // Get.put(DigiController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,

        // scrollbarTheme: ScrollbarThemeData(
        //   interactive: true,
        //   thumbColor: MaterialStateProperty.all(Colors.deepPurple),
        //   radius: const Radius.circular(60),
        // ),
        // unselectedWidgetColor: Colors.white,
        // iconTheme: const IconThemeData(color: kScanBackColor),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.blue; // the color when checkbox is selected;
              }
              return Colors.white; //the color when checkbox is unselected;
            },
          ),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline1: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 1,
              textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: Get.textTheme.bodyMedium?.fontSize),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
        ),
        useMaterial3: true,
        // textTheme: GoogleFonts.lato(),
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple.withOpacity(0.5),
          // color: kPrimaryColor,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,

          // iconTheme: const IconThemeData(color: kScanBackColor),
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(15),
          //       bottomRight: Radius.circular(15)),
          // ),
        ),
        // fontFamily: 'Lato',
        iconTheme: const IconThemeData(color: Colors.white),
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
        //     .copyWith(secondary: Colors.deepPurpleAccent),
      ),
      // ThemeData(
      //   primarySwatch: const Color(0xff4124AA),
      // ),
      home: const HomeScreen(),
    );
  }
}
