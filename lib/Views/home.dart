import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import '../Helper/colorPallets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controllers/uiController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin, ColorPallets {
  late TabController _tabController;
  static UIController uiController = Get.find();

  final _tabPages = <Widget>[
    _buildHomePageTab(),
    _buildCommunityPageTab(),
    _buildCreatePageTab(),
    _buildChatPageTab(),
    _buildInboxPageTab(),
  ];

  static int selectedIndex = 0;
  static List tabTitles = ["Home", "Community", "Create", "Chat", "Inbox"];
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
    uiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: uiController.homeScaffoldKey,
      appBar: BuildAppBAr(title: tabTitles[selectedIndex]),
      endDrawer: Drawer(),
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
                selectedIndex = index;
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

  static _buildHomePageTab() {
    return Column(children: [
      Obx(
        () => uiController.isHomePageArrowDown.value
            ? const SizedBox.shrink()
            : Flexible(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTextButton("Home", Icons.home),
                        _buildTextButton(
                            "Popular", Icons.arrow_circle_right_outlined),
                        _buildTextButton("Watch", Icons.watch_later_outlined),
                        _buildTextButton("Latest", Icons.new_releases),
                      ]),
                ),
              ),
      ),
      Flexible(
        flex: 7,
        child: ListView(
          children: const [
            RedditPost(),
            RedditPost(),
            RedditPost(),
          ],
        ),
      ),
    ]);
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

  static TextButton _buildTextButton(String s, IconData icon) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: uiController.selectedListTile.value == s
            ? const MaterialStatePropertyAll(Color(0xFFECECEC))
            : null,
      ),
      child: Builder(
        builder: (context) => Container(
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, color: ColorPallets.iconColor),
              const SizedBox(width: 25),
              Text(s, style: const TextStyle(color: ColorPallets.iconColor)),
            ],
          ),
        ),
      ),
      onPressed: () {
        uiController.isHomePageArrowDown.value =
            uiController.isHomePageArrowDown.value ? false : true;
        uiController.selectedListTile.value = s;
        print(uiController.isHomePageArrowDown.value);
      },
    );
  }
}
