import 'package:flutter/material.dart';
import '../Helper/colorPallets.dart';

class AccountDrawer extends StatefulWidget {
  const AccountDrawer({super.key});

  @override
  State<AccountDrawer> createState() => _AccountDrawerState();
}

class _AccountDrawerState extends State<AccountDrawer> with ColorPallets {
  bool isOnline = true;

  Text status(bool online) {
    if (online == true) {
      return const Text("Online Status: On",
          style: TextStyle(color: Colors.green));
    }
    return const Text("Online Status: Off",
        style: TextStyle(color: ColorPallets.iconColor));
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
        color: isOnline ? Colors.green : ColorPallets.iconColor,
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
            isOnline
                ? Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                  )
                : const SizedBox.shrink(),
            isOnline ? const SizedBox(width: 10) : const SizedBox.shrink(),
            status(isOnline),
          ]),
          onPressed: () {
            setState(() {
              isOnline = !isOnline;
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
}
