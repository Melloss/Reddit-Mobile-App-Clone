import 'package:flutter/material.dart';
import '../../Helper/colorPallets.dart';
import 'dart:math' as Math;

class RedditPostFooter extends StatefulWidget with ColorPallets {
  const RedditPostFooter({super.key});

  @override
  State<RedditPostFooter> createState() => _RedditPostFooterState();
}

class _RedditPostFooterState extends State<RedditPostFooter> {
  int vote = 615;

  void voteUpHandler() {
    setState(() {
      vote++;
    });
  }

  void voteDownHandler() {
    setState(() {
      vote--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.rotate(
          angle: Math.pi * -0.5,
          child: IconButton(
            icon: const Icon(
              Icons.forward_outlined,
              color: ColorPallets.smallTextColor,
            ),
            onPressed: voteUpHandler,
          ),
        ),
        Text(
          vote.toString(),
          style: const TextStyle(color: ColorPallets.smallTextColor),
        ),
        IconButton(
          icon: Transform.rotate(
            angle: Math.pi * 0.5,
            child: const Icon(
              Icons.forward_outlined,
              color: ColorPallets.smallTextColor,
            ),
          ),
          onPressed: voteDownHandler,
        ),
        Expanded(child: Container()),
        IconButton(
          icon: const Icon(
            Icons.message_outlined,
            color: ColorPallets.smallTextColor,
          ),
          onPressed: () {},
        ),
        const Text(
          "68",
          style: TextStyle(color: ColorPallets.smallTextColor),
        ),
        Expanded(child: Container()),
        IconButton(
          icon: const Icon(
            Icons.share_outlined,
            color: ColorPallets.smallTextColor,
          ),
          onPressed: () {},
        ),
        const Text(
          "117",
          style: TextStyle(color: ColorPallets.smallTextColor),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
