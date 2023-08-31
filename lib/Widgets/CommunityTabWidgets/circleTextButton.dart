import 'package:flutter/material.dart';
import 'package:reddit_mobile_app_clone/Helper/color_pallet.dart';

class CircleTextButton extends StatelessWidget {
  final String text;
  const CircleTextButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: ColorPallets.iconColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          clipBehavior: Clip.none,
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
