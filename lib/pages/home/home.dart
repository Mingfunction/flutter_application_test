import 'package:flutter/material.dart';
import 'package:flutter_application_test/pages/home/my_page/my_page.dart';
import 'package:flutter_application_test/pages/home/test_page/test_page.dart';

import 'home_page/home_page.dart';
import 'find_page/find_page.dart';
import '../../components/bottom_bar/bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  List<String> titles = ["首页", "发现", "测试", "我的"];
  List<IconData> icons = [Icons.home, Icons.view_module, Icons.catching_pokemon, Icons.person];
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void toNavigation(index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const <Widget>[HomePage(), FindPage(), TestPage(), MyPage()],
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      floatingActionButton: const BarCenterButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(
        titles: titles,
        icons: icons,
        currentIndex: _pageIndex,
        active: toNavigation,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
