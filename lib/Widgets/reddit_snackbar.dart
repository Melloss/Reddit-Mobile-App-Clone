import 'package:flutter/material.dart';

redditSnackBar({BuildContext? context, String? message, bool? isHappy}) {
  return ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 5),
      content: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(
                  color: Colors.red,
                  width: 10,
                ),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  isHappy!
                      ? 'assets/ic_toast_happy.png'
                      : 'assets/ic_toast_sad.png',
                  scale: 1,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    message ?? '',
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )));
}
