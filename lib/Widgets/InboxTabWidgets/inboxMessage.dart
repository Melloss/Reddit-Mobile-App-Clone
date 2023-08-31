import 'package:flutter/material.dart';
import '../../Helper/color_pallet.dart';

class InboxMessage extends StatelessWidget with ColorPallets {
  final String title;
  final String content;
  final String time;
  final String from;
  final Function() task;
  const InboxMessage({
    super.key,
    required this.title,
    required this.content,
    required this.time,
    required this.from,
    required this.task,
  });

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.message,
                  color: ColorPallets.iconColor.withOpacity(0.8)),
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
                      ),
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
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: from,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                  text: ' . $time',
                                  style: const TextStyle(
                                    color: ColorPallets.normalTextColor,
                                  )),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
              PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: 'Copy Link',
                        child: Row(
                          children: [
                            const Icon(Icons.link_outlined),
                            const SizedBox(width: 10),
                            Text("Copy Link",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: ColorPallets.normalTextColor,
                                    )),
                          ],
                        ),
                      )
                    ];
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
