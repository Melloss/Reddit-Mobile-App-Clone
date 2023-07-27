import 'package:flutter/material.dart';
import 'Views/homeTab.dart';
import './Helper/colorPallets.dart';
import './Helper/init_controller.dart' as di;

class App extends StatelessWidget with ColorPallets {
  const App({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0xFFF2F3F5),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFFFFF),
            iconTheme: IconThemeData(color: ColorPallets.iconColor),
            elevation: 2,
          ),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 15,
          )),
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
  await di.init();
  runApp(const App());
}
