import 'package:flutter/material.dart';

class RedditPostImageOrVideo extends StatelessWidget {
  const RedditPostImageOrVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/donkey.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
