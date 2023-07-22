import 'package:flutter/material.dart';
import './Views/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          iconTheme: IconThemeData(color: Color(0xFF0A0A0A)),
          elevation: 1,
        ),
        primaryColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }
}

main() => runApp(App());
