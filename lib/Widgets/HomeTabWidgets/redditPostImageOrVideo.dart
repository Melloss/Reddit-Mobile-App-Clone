import 'package:flutter/material.dart';

class RedditPostImageOrVideo extends StatelessWidget {
  const RedditPostImageOrVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 450,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/donkey.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
