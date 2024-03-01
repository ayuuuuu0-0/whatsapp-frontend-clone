import 'package:flutter/material.dart';
import 'package:whatsapp_frontend_clone/screens/settingScreen.dart';
import 'package:whatsapp_frontend_clone/screens/statusScreen.dart';

import 'callView.dart';
import 'chatListViewScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final _fabIcons = [
    Icons.camera_alt_outlined,
    Icons.chat,
    Icons.camera_alt_outlined,
    Icons.message,

  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          PopupMenuButton(
            onSelected: (value) {
              if (value == 1) {
                // Handle New Group creation
              } else if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingScreen()),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("New Group"),
                value: 1,
              ),
              const PopupMenuItem(
                child: Text("Linked devices"),
                value: 2,
              ),
            ],
          ),
        ],
        bottom: TabBar(
          tabs: const [
            Tab(icon: Icon(Icons.group)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Icon(Icons.group),
          ChatListView(),
          StatusScreen(),
          CallView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(_fabIcons[_tabController.index]),
      ),
    );
  }
}
