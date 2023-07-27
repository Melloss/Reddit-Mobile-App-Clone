import 'package:flutter/material.dart';
import '../Helper/colorPallets.dart';
import '../Widgets/widgets.dart';

class CommunityTab extends StatefulWidget {
  const CommunityTab({super.key});

  @override
  State<CommunityTab> createState() => _CommunityTabState();
}

class _CommunityTabState extends State<CommunityTab> with ColorPallets {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTrending(),
        ],
      ),
    );
  }

  Widget _buildTrending() {
    return Column(
      children: const [
        Text(
          "Trending now",
          style: TextStyle(
            color: ColorPallets.normalTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        CircleTextButton(text: "UFOs"),
      ],
    );
  }
}
