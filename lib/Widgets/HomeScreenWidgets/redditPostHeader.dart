import 'package:flutter/material.dart';
import '../../Helper/colorPallets.dart';

class RedditPostHeader extends StatefulWidget with ColorPallets {
  const RedditPostHeader({super.key});

  @override
  State<RedditPostHeader> createState() => _RedditPostHeaderState();
}

class _RedditPostHeaderState extends State<RedditPostHeader> {
  bool isJoinClicked = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _buildTopHeader(),
      _buildPostDetail(),
    ]);
  }

  Widget _buildTopHeader() {
    List<String> menuItems = [
      "Show more posts like this",
      "Show fewer posts like this",
      "Save",
      "Report",
      "Share",
      "Award"
    ];
    Map<String, IconData> munuItemIcons = {
      menuItems[0]: Icons.check,
      menuItems[1]: Icons.remove_red_eye_outlined,
      menuItems[2]: Icons.bookmark_outline,
      menuItems[3]: Icons.flag_outlined,
      menuItems[4]: Icons.share_outlined,
      menuItems[5]: Icons.card_giftcard_outlined,
    };
    String postAppearanceReason =
        "Because you've shown interest in a similar community";
    return Column(
      children: [
        Row(children: [
          Text(
            postAppearanceReason,
            style: const TextStyle(
                fontSize: 11, color: ColorPallets.smallTextColor),
          ),
          Expanded(child: Container()),
          PopupMenuButton(
              iconSize: 18,
              itemBuilder: (BuildContext context) => menuItems
                  .map((String item) => PopupMenuItem(
                        textStyle: const TextStyle(color: Colors.black),
                        value: item,
                        child: Row(
                          children: [
                            Icon(munuItemIcons[item]),
                            const SizedBox(width: 10),
                            Text(item, style: const TextStyle(fontSize: 13)),
                          ],
                        ),
                      ))
                  .toList())
        ]),
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: double.infinity,
          height: 1,
        ),
      ],
    );
  }

  Widget _buildPostDetail() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(children: [
        const CircleAvatar(
          maxRadius: 13,
          backgroundImage: AssetImage("assets/donkey.png"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextButton(
            onPressed: gotoCommunityDetail,
            child: const Text(
              "r/Donkey",
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ),
        ),
        Text(
          "12h",
          style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 13),
        ),
        Expanded(
          child: Container(),
        ),
        isJoinClicked
            ? _buildCheckedLogo()
            : Container(
                width: 45,
                height: 25,
                decoration: BoxDecoration(
                  color: ColorPallets.buttonBackgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: _joinButtonClickHandler,
                  child: const Text(
                    "Join",
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ),
              )
      ]),
    );
  }

  _buildCheckedLogo() {
    return Container(
        width: 33,
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
            color: ColorPallets.buttonBackgroundColor,
            borderRadius: BorderRadius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: const Icon(
            Icons.check,
            color: ColorPallets.iconColor,
            size: 20,
          ),
        ));
  }

  _joinButtonClickHandler() {
    isJoinClicked = true;
    setState(() {
      isJoinClicked = isJoinClicked;
    });
  }

  gotoCommunityDetail() {
    //print("community is clicked");
  }
}
