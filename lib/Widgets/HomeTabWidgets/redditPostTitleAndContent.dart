import 'package:flutter/material.dart';
import '../../Helper/color_pallet.dart';

class RedditPostTitleAndContent extends StatefulWidget with ColorPallets {
  const RedditPostTitleAndContent({super.key});

  @override
  State<RedditPostTitleAndContent> createState() =>
      _RedditPostTitleAndContentState();
}

class _RedditPostTitleAndContentState extends State<RedditPostTitleAndContent> {
  String title = "Rumors I Heard From An Employee";
  String content =
      "Good evening lovelies! I popped into my (newly because my old one closed) local Lush store and chatted up an employee I've gotten to know (they are every nice and I love them). I asked why soooooo much of Lush's";

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      /**
       * This is the title of the post
       */
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
      ),

      /**
       * This one is content of the post
       */
      Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 11,
            color: ColorPallets.smallTextColor,
          ),
        ),
      )
    ]);
  }
}
