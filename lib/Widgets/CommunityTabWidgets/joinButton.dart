import 'package:flutter/material.dart';
import '../../Helper/colorPallets.dart';

class JoinButton extends StatelessWidget with ColorPallets {
  final Function? task;
  const JoinButton({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 45,
      height: 30,
      decoration: BoxDecoration(
        color: ColorPallets.buttonBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () => task,
        child: const Text(
          "Join",
          style: TextStyle(color: Colors.white, fontSize: 11.5),
        ),
      ),
    );
  }
}
