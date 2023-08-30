import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Helper/colorPallets.dart';
import '../Controllers/account_controller.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> with ColorPallets {
  bool isExpanded = false;
  AccountController accountController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        _buildRecentlyVisitedExpansionTile(),
        const Divider(height: 0.5),
        _buildModeratingExpansionTile(),
        const Divider(height: 0.5),
        _buildYourCommunityExpansionTile(),
        const Divider(height: 0.5),
        _buldAllButton(),
      ]),
    );
  }

  _buildExpansionTile(String title, List<Widget> children) {
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.trailing,
      maintainState: true,
      onExpansionChanged: (expanded) {
        if (expanded == true) {
          setState(() {
            isExpanded = true;
          });
        } else {
          setState(() {
            isExpanded = false;
          });
        }
      },
      trailing: Icon(
        isExpanded == true
            ? Icons.keyboard_arrow_down_outlined
            : Icons.keyboard_arrow_right_outlined,
      ),
      iconColor: ColorPallets.iconColor,
      collapsedIconColor: ColorPallets.iconColor,
      title: Text(
        title,
        style: const TextStyle(color: ColorPallets.normalTextColor),
      ),
      children: children,
    );
  }

  _buildListTile(
      {String? title,
      IconData? icon,
      Function()? action,
      IconButton? iconButton}) {
    return ListTile(
      minLeadingWidth: 15,
      leading: Icon(icon),
      title: Text(
        title ?? '',
        style: const TextStyle(color: ColorPallets.normalTextColor),
      ),
      onTap: action,
      trailing: iconButton,
    );
  }

  _buildModeratingExpansionTile() {
    return _buildExpansionTile('Moderating', [
      _buildListTile(
        title: 'Mod Feed',
        icon: Icons.event_note,
      ),
      _buildListTile(
        title: 'Queues',
        icon: Icons.queue_outlined,
      ),
      _buildListTile(
        title: 'Modmail',
        icon: Icons.mail_outline,
      ),
      _buildListTile(
        title: 'Chat Queue',
        icon: Icons.chat_bubble_outline,
      ),
      Obx(
        () => _buildListTile(
          title: accountController.accountUserName.value,
          icon: Icons.reddit,
        ),
      ),
    ]);
  }

  _buildYourCommunityExpansionTile() {
    return _buildExpansionTile('Your Community', [
      _buildListTile(
        title: 'Create Community',
        icon: Icons.add,
      ),
      _buildListTile(
        title: 'r/announcements',
        icon: Icons.reddit_outlined,
        iconButton: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_border_outlined),
        ),
      ),
      _buildListTile(
        title: 'r/Ethiopia',
        icon: Icons.reddit_outlined,
        iconButton: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_border_outlined),
        ),
      ),
      _buildListTile(
        title: 'r/melloss',
        icon: Icons.reddit_outlined,
        iconButton: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_border_outlined),
        ),
      ),
    ]);
  }

  _buldAllButton() {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              Icons.blur_circular_outlined,
              color: ColorPallets.iconColor.withOpacity(0.7),
            ),
            const SizedBox(width: 10),
            const Text(
              "All",
              style: TextStyle(color: ColorPallets.normalTextColor),
            ),
          ],
        ),
      ),
    );
  }

  _buildRecentlyVisitedExpansionTile() {
    return _buildExpansionTile('Recently Visited', [
      _buildListTile(
        title: 'r/announcements',
        icon: Icons.reddit_outlined,
        iconButton: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_border_outlined),
        ),
      ),
      _buildListTile(
        title: 'r/Ethiopia',
        icon: Icons.reddit_outlined,
        iconButton: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_border_outlined),
        ),
      ),
      _buildListTile(
        title: 'r/melloss',
        icon: Icons.reddit_outlined,
        iconButton: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.star_border_outlined),
        ),
      ),
    ]);
  }
}
