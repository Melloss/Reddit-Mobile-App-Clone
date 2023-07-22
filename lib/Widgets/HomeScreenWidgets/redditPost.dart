import 'package:flutter/material.dart';
import '../widgets.dart';

class RedditPost extends StatefulWidget {
  const RedditPost({super.key});

  @override
  State<RedditPost> createState() => _RedditPostState();
}

class _RedditPostState extends State<RedditPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          RedditPostHeader(),
          RedditPostTitleAndContent(),
          RedditPostImageOrVideo(),
          RedditPostFooter(),
        ],
      ),
    );
  }
}
