// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reddit_mobile_app_clone/Helper/colorPallets.dart';
import '../../Controllers/uiController.dart';
import '../widgets.dart';

class BuildAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const BuildAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size(300, 55);

  @override
  State<BuildAppBar> createState() => _BuildAppBarState();
}

class _BuildAppBarState extends State<BuildAppBar> with ColorPallets {
  UIController uiController = Get.find();
  _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: ColorPallets.iconColor,
        fontSize: 15,
      ),
    );
  }

  @override
  build(BuildContext context) {
    return AppBar(
      toolbarHeight: 200,
      leadingWidth: 25,
      title: buildTitle(widget.title),
      elevation: widget.title == "Home" ? 2 : 0,
      actions: [
        _buildSearchButton(),
        _buildAccountButton(),
      ],
    );
  }

  Widget homeTabTitle() {
    return Container(
      width: 100,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorPallets.rareButtonColor),
      child: TextButton(
        onPressed: () {
          uiController.isHomePageArrowDown.value =
              uiController.isHomePageArrowDown.value ? false : true;
          setState(() {
            uiController.isHomePageArrowDown.value =
                uiController.isHomePageArrowDown.value;
          });
        },
        child: Obx(
          () => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(uiController.selectedListTile.value,
                    style: const TextStyle(
                      color: ColorPallets.iconColor,
                    )),
                const SizedBox(width: 5),
                uiController.isHomePageArrowDown.value
                    ? const Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorPallets.iconColor,
                      )
                    : const Icon(
                        Icons.keyboard_arrow_up,
                        color: ColorPallets.iconColor,
                      ),
              ]),
        ),
      ),
    );
  }

  _buildAccountButton() {
    return Container(
      width: 45,
      height: 45,
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        child: CircleAvatar(
          maxRadius: 15,
          child: Stack(children: [
            Image.asset('assets/reddit.png'),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
          ]),
        ),
        onPressed: () {
          uiController.homeScaffoldKey.currentState?.openEndDrawer();
        },
      ),
    );
  }

  _buildSearchButton() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
    );
  }

  Widget buildTitle(String title) {
    if (title == "Home") {
      return homeTabTitle();
    } else if (title == "Communities") {
      return _buildText("Communities");

    } else if (title == "Chat") {
      return _buildText("Chat");
    }
    return _buildText("Inbox");
  }
}
