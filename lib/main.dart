import 'package:flutter/material.dart';
import 'Views/homeTab.dart';
import './Helper/colorPallets.dart';
import './Helper/init_controller.dart' as di;
import 'package:get/get.dart';
import './Controllers/connectionController.dart';

class App extends StatelessWidget with ColorPallets {
  const App({super.key});

  @override
  Widget build(context) {
    return GetMaterialApp(
      home: const Home(),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0xFFF2F3F5),
          appBarTheme: const AppBarTheme(
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
          )),
    );
  }
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize all controllers
  await di.init();

  //connection listner initialized
  ConnectionController connectionController = Get.find();
  connectionController.addconnectionListener();
  runApp(const App());
}
