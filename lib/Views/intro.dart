import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'login.dart';
import '../Controllers/connection_controller.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    ConnectionController connectionController = Get.find();
    connectionController.addconnectionListener();
    connectionController.dispose();
    Timer(const Duration(seconds: 3), () {
      Get.off(() => const Login(), transition: Transition.zoom);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Center(
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                  image: AssetImage('assets/reddit.png'), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
