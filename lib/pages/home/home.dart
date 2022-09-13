import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tab_view/tab_view1.dart';
import '../../components/bottom_bar/bottom_bar.dart';
import '../../router/router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> titles = ["首页", "发现", "测试", "我的"];
  List<String> pages = ["/", "/page2", "测试", "我的"];
  List<IconData> icons = [Icons.home, Icons.home, Icons.home, Icons.home];
  final int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 6,
      vsync: this,
    );
    _tabController.addListener(() {});
  }

  void toNavigation(index) {
    if (index != _currentIndex) {
      Routes.navigateTo(context, pages[index], params: {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // 这里设置为0AppBar底部就没有阴影了
        leadingWidth: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 201, 255, 242),
              Color.fromARGB(255, 231, 248, 244),
              Color.fromARGB(255, 249, 249, 251),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print('search');
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 18,
            ),
          ),
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: TabBar(
          isScrollable: true,
          controller: _tabController,
          overlayColor: const MaterialStatePropertyAll(Color(0x00000000)),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color: const Color.fromARGB(255, 99, 255, 180),
          ),
          indicatorPadding: const EdgeInsets.only(left: 21, right: 20, top: 43),
          labelColor: Colors.black,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: const TextStyle(fontSize: 12.0),
          tabs: const [
            Tab(text: '第一个界面'),
            Tab(text: '第二个'),
            Tab(text: '第二个界面'),
            Tab(text: '第二个界面'),
            Tab(text: '第二个界面'),
            Tab(text: '第二个界面'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const TabView1(),
          ListView(
            children: const [
              ListTile(title: Text('第2个界面')),
              ListTile(title: Text('第2个界面')),
              ListTile(title: Text('第2个界面')),
            ],
          ),
          const Center(),
          const Center(),
          const Center(),
          const Center(),
        ],
      ),
      floatingActionButton: const BarCenterButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(
        titles: titles,
        icons: icons,
        currentIndex: _currentIndex,
        active: toNavigation,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
