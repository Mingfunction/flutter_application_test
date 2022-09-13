import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final ScrollController _controller = ScrollController();
  int _titleAlpha = 0;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        if (_controller.offset > 255) {
          _titleAlpha = 255;
        } else if (_controller.offset <= 155) {
          _titleAlpha = 0;
        } else {
          _titleAlpha = _controller.offset * 255 ~/ 255;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          // AppBar，包含一个导航栏.
          SliverAppBar(
            elevation: 0.0,
            pinned: true, // 滑动到顶端时会固定住
            // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)),
            backgroundColor: const Color.fromARGB(255, 231, 248, 244),
            automaticallyImplyLeading: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo', style: TextStyle(color: Colors.black.withAlpha(_titleAlpha))),
              centerTitle: true,
              background: Image.asset(
                "asset/images/test2.webp",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              //Grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建列表项
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
