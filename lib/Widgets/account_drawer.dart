import 'package:flutter/material.dart';
import '../Helper/color_pallet.dart';
import '../../Controllers/controllers.dart';
import 'package:get/get.dart';

class AccountDrawer extends StatefulWidget {
  const AccountDrawer({super.key});

  @override
  State<AccountDrawer> createState() => _AccountDrawerState();
}

class _AccountDrawerState extends State<AccountDrawer> with ColorPallets {
  late bool showMeOnline;
  ConnectionController connectionController = Get.find();

  Text status(bool online) {
    if (online == true) {
      return const Text("Online Status: On",
          style: TextStyle(color: Colors.green));
    }
    return const Text("Online Status: Off",
        style: TextStyle(color: ColorPallets.iconColor));
  }

  @override
  void initState() {
    showMeOnline = connectionController.connectedToInternet.value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 2,
            child: Image.asset('assets/reddit_avatar.png'),
          ),
          Flexible(
            flex: 4,
            child: Column(children: [
              _buildUserNameButton(),
              const SizedBox(height: 5),
              _buildOnlineStatusButton(),
              const SizedBox(height: 15),
              _buildCreateAvatarButton(),
              const SizedBox(height: 20),
              _buildKarmaAndRedditAge(),
              _buildOptionsMenu(),
              _buildSettingOption(),
            ]),
          ),
        ],
      ),
    );
  }

  _buildUserNameButton() {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [Text("u/melloss12"), Icon(Icons.keyboard_arrow_down)],
      ),
      onPressed: () {},
    );
  }

  _buildOnlineStatusButton() {
    return Container(
      padding: const EdgeInsets.all(1),
      width: 200,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: showMeOnline ? Colors.green : ColorPallets.iconColor,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.zero)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            showMeOnline
                ? Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                  )
                : const SizedBox.shrink(),
            showMeOnline ? const SizedBox(width: 10) : const SizedBox.shrink(),
            status(showMeOnline),
          ]),
          onPressed: () {
            setState(() {
              showMeOnline = !showMeOnline;
            });
          },
        ),
      ),
    );
  }

  _buildCreateAvatarButton() {
    return Builder(
        builder: (context) => Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: 35,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  end: Alignment.topRight,
                  colors: [
                    Colors.red,
                    Colors.red,
                    Colors.orange,
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  TextButton(
                    style: const ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    child: const Center(child: Text("Create Avatar")),
                    onPressed: () {},
                  ),
                  const Positioned(
                    right: 10,
                    top: 3,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 27,
                      weight: 3,
                    ),
                  ),
                ],
              ),
            ));
  }

  _buildKarmaAndRedditAge() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/karma.png')),
              ),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "1",
                  style: TextStyle(
                      color: ColorPallets.iconColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Karma",
                  style: TextStyle(
                      fontSize: 12, color: ColorPallets.smallTextColor),
                ),
              ],
            )
          ],
        ),
        Container(
          color: ColorPallets.iconColor.withOpacity(0.4),
          width: 0.5,
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle_sharp, color: Colors.blue, size: 30),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "17d",
                  style: TextStyle(
                      color: ColorPallets.iconColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Reddit age",
                  style: TextStyle(
                      fontSize: 12, color: ColorPallets.smallTextColor),
                ),
              ],
            )
          ],
        ),
      ]),
      const SizedBox(height: 10),
      Container(
        color: ColorPallets.iconColor.withOpacity(0.4),
        width: 270,
        height: 0.5,
      ),
    ]);
  }

  Widget _buildOptionsMenu() {
    return Expanded(
      flex: 5,
      child: ListView(
        children: [
          _buildOption(Icons.person_outline, "My profile"),
          _buildOption(Icons.groups_outlined, "Create a community"),
          _buildOption(Icons.lock_person_outlined, "Vault"),
          _buildOption(Icons.copyright_outlined, "Reddit Coins"),
          _buildOption(Icons.shield_outlined, "Reddit Premium"),
          _buildOption(Icons.bookmarks_outlined, "Saved"),
          _buildOption(Icons.access_time, "History")
        ],
      ),
    );
  }

  _buildSettingOption() {
    return Expanded(
        flex: 1, child: _buildOption(Icons.settings_outlined, "Settings"));
  }

  _buildOption(IconData icon, String s) {
    return TextButton(
      style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 15, horizontal: 20))),
      onPressed: () {},
      child: Row(
        children: [Icon(icon), const SizedBox(width: 15), Text(s)],
      ),
    );
  }
}
