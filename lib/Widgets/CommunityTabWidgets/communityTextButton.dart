import 'package:flutter/material.dart';
import '../../Helper/colorPallets.dart';
import '../widgets.dart';

class CommunityTextButton extends StatelessWidget with ColorPallets {
  final String image;
  final String name;
  final String members;
  final String description;
  const CommunityTextButton(
      {super.key,
      required this.image,
      required this.name,
      required this.members,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 13),
      height: 95,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorPallets.iconColor,
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //community logo
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 21,
                      backgroundImage: AssetImage(image),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildText(name, weight: FontWeight.w600),
                            const SizedBox(
                              height: 3,
                            ),
                            _buildText("$members members",
                                color: ColorPallets.smallTextColor, size: 10),
                          ],
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    JoinButton(task: () {}),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                child: _buildText(
                  description,
                  size: 11,
                  color: ColorPallets.smallTextColor,
                ),
              )
            ],
          )),
    );
  }

  _buildText(String s, {Color? color, double? size, FontWeight? weight}) {
    return Text(
      s,
      style: TextStyle(
        color: color ?? ColorPallets.normalTextColor,
        fontSize: size ?? 16,
        fontWeight: weight ?? FontWeight.w500,
      ),
    );
  }
}
