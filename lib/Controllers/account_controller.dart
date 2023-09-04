import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountController extends GetxController {
  final _user = FirebaseAuth.instance.currentUser;
  final avatarLogo = ''.obs;
  getUsername() {
    String? username = _user!.displayName;
    return username;
  }

  getAvatar() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(_user!.uid)
        .get();
    final document = snapshot.data()!;
    String avatar = document['avatar_logo'];
    avatarLogo.value = avatar;
  }
}
