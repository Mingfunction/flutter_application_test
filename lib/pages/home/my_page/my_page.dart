import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final ScrollController _controller = ScrollController();
  int _titleAlpha = 0;
  int tests = 0;
  double avatarRadius = 20.0;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      setState(() {
        if (_controller.offset > 255) {
          _titleAlpha = 255;
        } else if (_controller.offset <= 155) {
          _titleAlpha = 0;
        } else {
          _titleAlpha = _controller.offset * 255 ~/ 255;
        }
        // 下滑大于15 时 隐藏一些信息
        if (_controller.offset > 15) {
          tests = 1;
        } else {
          tests = 0;
        }
        setAvatarRadius();
      });
    });
  }

  // 下滑头像大小
  setAvatarRadius() {
    if (12 > _controller.offset) {
      avatarRadius = 20;
      return;
    }
    if (_controller.offset > 50) {
      avatarRadius = 12;
      return;
    }
    if (0 < _controller.offset && _controller.offset < 50) {
      var scale = 20.0 * ((50 - _controller.offset) / 50);
      if (scale > 20.0) {
        scale = 20.0;
      } else if (scale < 12.0) {
        scale = 12.0;
      }
      avatarRadius = scale;
    }
  }

  Widget setName() {
    if (tests == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("我是谁", style: TextStyle(color: Colors.black, fontSize: 12)),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text("3", style: TextStyle(color: Color.fromARGB(255, 160, 140, 140), fontSize: 8)),
                  SizedBox(height: 3),
                  Text("私信", style: TextStyle(color: Color.fromARGB(255, 160, 140, 140), fontSize: 8)),
                ],
              ),
              const SizedBox(width: 9),
              Column(
                children: const [
                  Text("3", style: TextStyle(color: Color.fromARGB(255, 160, 140, 140), fontSize: 8)),
                  SizedBox(height: 3),
                  Text("关注", style: TextStyle(color: Color.fromARGB(255, 160, 140, 140), fontSize: 8)),
                ],
              ),
              const SizedBox(width: 9),
              Column(
                children: const [
                  Text("3", style: TextStyle(color: Color.fromARGB(255, 160, 140, 140), fontSize: 8)),
                  SizedBox(height: 3),
                  Text("被关注", style: TextStyle(color: Color.fromARGB(255, 160, 140, 140), fontSize: 8)),
                ],
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("我是谁1", style: TextStyle(color: Colors.black, fontSize: 18)),
        ],
      );
    }
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
          SliverAppBar(
            elevation: 0.0,
            pinned: true, // 滑动到顶端时会固定住
            titleSpacing: 0.0, //title widget两边不留间隙
            backgroundColor: const Color.fromARGB(255, 231, 248, 244),
            expandedHeight: 100.0,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 24,
                  ))
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(bottom: 16, left: 16),
              title: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundImage:
                            const NetworkImage('https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  setName()
                ],
              ),
              centerTitle: false,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: MySliverPersistentHeaderDelegate(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
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

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  double height = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text(
        '我是一个SliverPersistentHeader',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  double get maxExtent => height + 100;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false; // 如果内容需要更新，设置为true
}
