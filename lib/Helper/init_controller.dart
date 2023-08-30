import '../Controllers/controllers.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => UIController());
  Get.lazyPut(() => ConnectionController());
  Get.lazyPut(() => AccountController());
}
