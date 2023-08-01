import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Views/newChat.dart';
import '../Helper/colorPallets.dart';
import '../Controllers/controllers.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> with ColorPallets {
  ConnectionController connectionController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildConnectivityStatus(),
        _buildCenteredComponents(),
      ],
    );
  }

  Widget _buildConnectivityStatus() {
    return Obx(
      () => Visibility(
        visible: connectionController.showConnectivityStatus.value,
        child: Container(
          width: double.infinity,
          height: 50,
          color: connectionController.connectedToInternet.value
              ? Colors.green
              : ColorPallets.messageBackground,
          child: Row(children: [
            Image.asset(
              'assets/reddit_white_logo.png',
            ),
            Expanded(
                child: Text(
                    connectionController.connectedToInternet.value
                        ? "Connected"
                        : "Trying to connect...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    ))),
          ]),
        ),
      ),
    );
  }

  _buildCenteredComponents() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/chat_logo.png',
              scale: 1,
              width: 200,
            ),
            Text(
              "Your Chat will show up here",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: ColorPallets.normalTextColor),
            ),
            const SizedBox(height: 10),
            Text(
              "Get Started by tapping the new chat\n button here or on the someone's profile.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ColorPallets.normalTextColor,
                    fontSize: 11.5,
                  ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 38,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorPallets.buttonBackgroundColor,
              ),
              child: TextButton(
                onPressed: () {
                  Get.to(() => const NewChat());
                },
                child: const Text(
                  "Start Chatting",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
