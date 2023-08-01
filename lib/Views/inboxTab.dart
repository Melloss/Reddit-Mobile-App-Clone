// ignore: file_names
import 'package:flutter/material.dart';
import '../Controllers/controllers.dart';
import 'package:get/get.dart';
import '../Widgets/widgets.dart';

class InboxTab extends StatefulWidget {
  const InboxTab({super.key});

  @override
  State<InboxTab> createState() => _InboxTabState();
}

class _InboxTabState extends State<InboxTab> {
  ConnectionController connectionController = Get.find();

  final _tabs = const <Tab>[
    Tab(text: 'Notifications'),
    Tab(text: 'Messages'),
    Tab(text: 'Modmail'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(tabs: _tabs),
        ),
        body: TabBarView(
          children: [
            _buildNotificationTab(),
            _buildMessageTab(),
            _buildModmailTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTab() {
    return Obx(() => connectionController.connectedToInternet.value
        ? ListView(
            children: [
              InboxNotification(
                image: 'assets/reddit.png',
                title: 'meirl: ',
                time: '3h',
                content: 'Me irl',
                task: () {},
              ),
              InboxNotification(
                  image: 'assets/reddit.png',
                  title: 'Start r/melloss off right!: ',
                  time: '5d',
                  content:
                      'Communities that have posts for people to interact with see more action,so try adding five posts today.',
                  task: () {}),
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
          ));
  }

  Widget _buildMessageTab() {
    return Obx(
      () => connectionController.connectedToInternet.value
          ? ListView(
              children: [
                InboxMessage(
                    title: "Welcome to Moderating!",
                    content:
                        "If you're receiving this automated message, you've just become a moderator in your first community, Congra...",
                    time: "6d",
                    from: "u/reddit",
                    task: () {})
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildModmailTab() {
    return Container();
  }
}
