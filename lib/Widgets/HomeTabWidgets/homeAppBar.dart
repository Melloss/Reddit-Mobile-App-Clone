// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reddit_mobile_app_clone/Helper/color_pallet.dart';
import '../../Controllers/controllers.dart';
import '../../Views/new_chat.dart';

class BuildAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const BuildAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size(300, 57);

  @override
  State<BuildAppBar> createState() => _BuildAppBarState();
}

class _BuildAppBarState extends State<BuildAppBar> with ColorPallets {
  UIController uiController = Get.find();
  ConnectionController connectionController = Get.find();

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
      leadingWidth: 25,
      title: buildTitle(widget.title),
      elevation: widget.title == "Home" ? 1 : 0,
      actions: [
        if (widget.title == "Chat")
          _buildChatIconButton()
        else if (widget.title == "Inbox")
          _buildInboxButton()
        else
          _buildSearchButton(),
        _buildAccountButton(),
      ],
    );
  }

  Widget homeTabTitle() {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.27,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
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
                        size: 18,
                      )
                    : const Icon(
                        Icons.keyboard_arrow_up,
                        color: ColorPallets.iconColor,
                        size: 18,
                      ),
              ]),
        ),
      ),
    );
  }

  _buildAccountButton() {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        child: CircleAvatar(
          maxRadius: 15,
          child: Obx(
            () => Stack(children: [
              Image.asset('assets/reddit.png'),
              connectionController.connectedToInternet.value
                  ? Positioned(
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
                    )
                  : const SizedBox.shrink(),
            ]),
          ),
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

  _buildChatIconButton() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: IconButton(
        onPressed: () {
          Get.to(() => const NewChat());
        },
        icon: Stack(children: const [
          Icon(
            fill: 1,
            Icons.chat_bubble_outline_outlined,
            color: ColorPallets.iconColor,
            size: 28,
          ),
          Positioned(
            top: 4,
            left: 7,
            child: Icon(
              Icons.add,
              size: 15,
              color: ColorPallets.iconColor,
            ),
          )
        ]),
      ),
    );
  }

  _buildInboxButton() {
    return IconButton(
      onPressed: () {
        showBottomSheet(
            clipBehavior: Clip.antiAlias,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            context: context,
            builder: (context) {
              return Container(
                clipBehavior: Clip.antiAlias,
                height: 150,
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(children: [
                  _buildTextButton(Icons.edit_outlined, "New Message"),
                  _buildTextButton(Icons.mark_as_unread_outlined,
                      "Mark all inbox tabs as read"),
                  _buildTextButton(
                      Icons.settings_outlined, "Edit notification settings"),
                ]),
              );
            });
      },
      icon: const Icon(Icons.more_vert_outlined, color: ColorPallets.iconColor),
    );
  }

  _buildTextButton(IconData icon, String text) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        child: Row(children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(text),
        ]),
      ),
    );
  }
}
