import 'package:flutter/material.dart';
import 'package:reddit_mobile_app_clone/Helper/color_pallet.dart';

class NewChat extends StatefulWidget {
  const NewChat({super.key});

  @override
  State<NewChat> createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 25,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "New Chat",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    setState(() {
                      isEmpty = false;
                    });
                  } else {
                    setState(() {
                      isEmpty = true;
                    });
                  }
                },
                autofocus: true,
                style: const TextStyle(
                  color: ColorPallets.iconColor,
                  fontSize: 15,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefix: Text(
                    "To:  ",
                    style: TextStyle(
                      color: ColorPallets.iconColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Search for people by username to chat with them.',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ColorPallets.smallTextColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: isEmpty
                    ? ColorPallets.rareButtonColor
                    : ColorPallets.buttonBackgroundColor,
                borderRadius: BorderRadius.circular(30),
              ),
              width: double.infinity,
              child: TextButton(
                onPressed: isEmpty ? null : () {},
                child: Text("Start Chat",
                    style: TextStyle(
                      color: isEmpty
                          ? ColorPallets.smallTextColor.withOpacity(0.5)
                          : Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
