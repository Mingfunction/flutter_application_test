import 'package:flutter/material.dart';
import '../../router/router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 2;
  // tabbar 右上角图标
  var actionsList = <Widget>[
    IconButton(
      icon: const Icon(Icons.shopping_cart),
      tooltip: 'Open shopping cart',
      onPressed: () {
        // handle the press
      },
    ),
  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    print("2112");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("21"),
          centerTitle: false,
          actions: actionsList,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.amber,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Routes.navigateTo(context, "/page2", params: {}, transition: "inFromRight");
                },
              ),
              const SizedBox(), //中间位置空出
              IconButton(
                icon: const Icon(Icons.business),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.business),
                onPressed: () {},
              ),
            ], //均分底部导航栏横向空间
          ),
        ));
  }
}
