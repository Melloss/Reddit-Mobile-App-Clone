import 'package:flutter/material.dart';
import '/Views/login_signup.dart';
import '../Helper/color_pallet.dart';
import '../services/auth_service.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        elevation: 0,
        backgroundColor: const Color(0xFFF2F3F5),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTop(),
          const SizedBox(height: 100),
          _buildSignInMethods(),
        ],
      ),
    );
  }

  _buildTop() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/reddit.png'),
              fit: BoxFit.cover,
            )),
          ),
          const SizedBox(height: 40),
          const Text(
            'All your interests in one place',
            textScaleFactor: 2.8,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorPallets.normalTextColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  _buildSignInMethods() {
    return Column(
      children: [
        _buildSignInTile(
            text: 'Continue with Google', onClick: googleSignInHandler),
        _buildSignInTile(
            icon: Icons.mail,
            text: 'Continue with Email',
            onClick: emailSignInHandler),
      ],
    );
  }

  googleSignInHandler() async {
    await AuthService().signInWithGoogle();
  }

  emailSignInHandler() {
    Get.to(() => const LoginSignup());
  }

  _buildSignInTile({IconData? icon, String? text, Function()? onClick}) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 50,
      decoration: BoxDecoration(
        color: ColorPallets.rareButtonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        onPressed: onClick,
        child: Row(children: [
          icon == null
              ? Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/googleg_standard_color_18.png')),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 20,
                  height: 20,
                  child: Icon(icon)),
          const SizedBox(width: 50),
          Text(
            text!,
            style: const TextStyle(
              fontSize: 17,
              color: ColorPallets.normalTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
