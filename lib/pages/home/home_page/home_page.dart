import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_test/pages/home/home_page/tab_view/tab_view1.dart';
import 'package:flutter_application_test/pages/home/home_page/tab_view/tab_view2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 6,
      vsync: this,
    );
    _tabController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // 这里设置为0AppBar底部就没有阴影了
        leadingWidth: 0,
        titleSpacing: 0.0, // 设置  widget两边不留间隙
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
            Tab(text: '推荐'),
            Tab(text: '前端开发'),
            Tab(text: '第二个界面'),
            Tab(text: '第二个界面'),
            Tab(text: '第二个界面'),
            Tab(text: '第二个界面'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TabView1(),
          TabView2(),
          Center(),
          Center(),
          Center(),
          Center(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
