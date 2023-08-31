import 'package:flutter/material.dart';
import '../Helper/color_pallet.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: SizedBox(
          width: 35,
          height: 35,
          child: Image.asset('assets/reddit.png'),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Log in'),
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(height: 20),
        const Text(
          'Hi new friend, welcome to Reddit',
          style: TextStyle(
            color: ColorPallets.normalTextColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        _buildSignInTile(text: 'Continue with Google', onClick: () {}),
      ]),
    );
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
