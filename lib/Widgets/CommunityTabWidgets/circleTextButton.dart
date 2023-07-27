import 'package:flutter/material.dart';
import 'package:reddit_mobile_app_clone/Helper/colorPallets.dart';

class CircleTextButton extends StatelessWidget {
  final String text;
  const CircleTextButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: ColorPallets.iconColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
