import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(),
      body: ListView(
        children: const [
          Expanded(child: RedditPost()),
          Expanded(child: RedditPost()),
          Expanded(child: RedditPost()),
        ],
      ),
      drawer: const Drawer(),
    );
  }
}
