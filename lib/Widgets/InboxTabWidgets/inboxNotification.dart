import 'package:flutter/material.dart';
import '../../Helper/colorPallets.dart';
import 'package:get/get.dart';

class InboxNotification extends StatelessWidget with ColorPallets {
  final String title;
  final String image;
  final String time;
  final String content;
  final Function() task;
  const InboxNotification(
      {super.key,
      required this.title,
      required this.image,
      required this.time,
      required this.content,
      required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: task,
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: title,
                          style: const TextStyle(
                            color: ColorPallets.normalTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                                text: ' . $time',
                                style: const TextStyle(
                                    color: ColorPallets.smallTextColor,
                                    fontSize: 13))
                          ]),
                    ]),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.73,
                    child: Text(
                      content,
                      style: const TextStyle(
                        fontSize: 11,
                        color: ColorPallets.smallTextColor,
                      ),
                    ),
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  showBottomSheet(
                      backgroundColor: Colors.red,
                      shape: const StadiumBorder(),
                      context: context,
                      builder: (context) {
                        return _buildBottomSheet();
                      });
                },
                icon: const Icon(Icons.more_vert,
                    size: 18, color: ColorPallets.iconColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      width: double.infinity,
      height: 280,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: ColorPallets.rareButtonColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const Center(
            child: Text("Manage Notification",
                style: TextStyle(
                  color: ColorPallets.normalTextColor,
                  fontSize: 15.5,
                  fontWeight: FontWeight.w500,
                )),
          ),
          const SizedBox(height: 10),
          const Divider(),
          _buildTextButton(
            icon: Icons.remove_red_eye_outlined,
            text: "Hide this Notification",
            task: () {},
          ),
          _buildTextButton(
            icon: Icons.disabled_by_default_outlined,
            text: "Disable updates from this community",
            task: () {},
          ),
          _buildTextButton(
            icon: Icons.notifications_off_outlined,
            text: "Turn off this notification type",
            task: () {},
          ),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: ColorPallets.rareButtonColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Close")))
        ],
      ),
    );
  }

  _buildTextButton({IconData? icon, String? text, Function()? task}) {
    return TextButton(
      onPressed: task ?? () {},
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Icon(icon),
          const SizedBox(width: 15),
          Text(text ?? ""),
        ]),
      ),
    );
  }
}
