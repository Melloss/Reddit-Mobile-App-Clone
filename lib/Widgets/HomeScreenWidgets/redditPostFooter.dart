import 'package:flutter/material.dart';
import '../../Helper/colorPallets.dart';

class RedditPostFooter extends StatefulWidget with ColorPallets {
  const RedditPostFooter({super.key});

  @override
  State<RedditPostFooter> createState() => _RedditPostFooterState();
}

class _RedditPostFooterState extends State<RedditPostFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_upward_outlined,
              color: ColorPallets.smallTextColor,
            ),
            onPressed: () {},
          ),
          const Text(
            "615",
            style: TextStyle(color: ColorPallets.smallTextColor),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_downward_outlined,
              color: ColorPallets.smallTextColor,
            ),
            onPressed: () {},
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
      ),
    );
  }
}
