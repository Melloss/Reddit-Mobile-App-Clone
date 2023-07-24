import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import '../Helper/colorPallets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin, ColorPallets {
  late TabController _tabController;

  final _tabPages = <Widget>[
    _buildHomePageTab(),
    _buildCommunityPageTab(),
    _buildCreatePageTab(),
    _buildChatPageTab(),
    _buildInboxPageTab(),
  ];

  static List<bool> isSelected = [true, false, false, false, false];
  static List<List<IconData>> icons = [
    [Icons.home_outlined, Icons.home_filled],
    [Icons.group_outlined, Icons.group],
    [Icons.add_outlined, Icons.add_rounded],
    [Icons.message_outlined, Icons.message_rounded],
    [FontAwesomeIcons.bell, FontAwesomeIcons.solidBell]
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabPages.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: _tabPages,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: SizedBox(
          height: 55,
          child: TabBar(
            onTap: (index) {
              final temp = isSelected.map((data) {
                return false;
              });
              isSelected = [...temp];
              setState(() {
                isSelected[index] = true;
              });
            },
            tabs: [
              _buildTab("Home", 0),
              _buildTab("Community", 1),
              _buildTab("Create", 2),
              _buildTab("Chat", 3),
              _buildTab("Inbox", 4),
            ],
            controller: _tabController,
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }

  static Widget _buildHomePageTab() {
    return ListView(
      children: const [
        RedditPost(),
        RedditPost(),
        RedditPost(),
      ],
    );
  }

  static _buildCommunityPageTab() {
    return Container();
  }

  static _buildCreatePageTab() {
    return Container();
  }

  static _buildChatPageTab() {
    return Container();
  }

  static _buildInboxPageTab() {
    return Container();
  }

  static Widget _buildTab(String text, int index) {
    return Tab(
      icon: FaIcon(
        isSelected[index] ? icons[index][1] : icons[index][0],
        color: Colors.black.withOpacity(0.85),
        size: 25,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: ColorPallets.smallTextColor,
          fontSize: 11,
        ),
      ),
    );
  }
}
