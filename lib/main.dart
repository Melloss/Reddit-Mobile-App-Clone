import 'package:flutter/material.dart';
import './Views/intro.dart';
import 'Helper/color_pallet.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';
import '../Helper/init_controller.dart' as controllers;

class App extends StatelessWidget with ColorPallets {
  const App({super.key});

  @override
  Widget build(context) {
    return GetMaterialApp(
      home: const Intro(),
      theme: _buildThemeData(),
    );
  }

  _buildThemeData() {
    return ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF2F3F5),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Color(0xFFFFFFFF),
          iconTheme: IconThemeData(color: ColorPallets.iconColor),
          elevation: 2,
          foregroundColor: ColorPallets.normalTextColor,
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 15,
        )),
        disabledColor: ColorPallets.rareButtonColor,
        tabBarTheme: const TabBarTheme(
          labelColor: ColorPallets.normalTextColor,
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
            foregroundColor: MaterialStatePropertyAll(ColorPallets.iconColor),
          ),
        ));
  }
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize all controllers
  controllers.init();
  //connection listner initialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}
