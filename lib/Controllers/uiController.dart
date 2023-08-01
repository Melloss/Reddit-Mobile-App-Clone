import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIController extends GetxController {
  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
  final isHomePageArrowDown = true.obs;
  final selectedListTile = "Home".obs;
}
