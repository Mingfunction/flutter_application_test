import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';

class TabView1 extends StatefulWidget {
  const TabView1({Key? key}) : super(key: key);

  @override
  State<TabView1> createState() => _TabView1State();
}

class _TabView1State extends State<TabView1> {
  int _count = 10;
  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: _controller,
      header: const ClassicHeader(dragText: "1", armedText: "2", messageText: "3"),
      footer: const ClassicFooter(),
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) {
          return;
        }
        setState(() {
          _count = 10;
        });
        _controller.finishRefresh();
        _controller.resetFooter();
      },
      onLoad: () async {
        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) {
          return;
        }
        setState(() {
          _count += 10;
        });
        _controller.finishLoad(_count >= 20 ? IndicatorResult.noMore : IndicatorResult.success);
      },
      child: CustomScrollView(
        slivers: [
          SliverSafeArea(
            // 使用安全区，保证创建时保留安全区，向上滚动贯穿安全区
            sliver: SliverPadding(
              // 给内部添加自然间距，向上滚动穿透安全区
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'asset/images/test2.webp',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(5.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: const [
                                    Icon(Icons.source, color: Colors.white, size: 12),
                                    SizedBox(width: 3),
                                    Text("200", style: TextStyle(color: Colors.white, fontSize: 12))
                                  ]),
                                  Row(children: const [
                                    Icon(Icons.stars, color: Colors.white, size: 12),
                                    SizedBox(width: 3),
                                    Text("100", style: TextStyle(color: Colors.white, fontSize: 12))
                                  ]),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 3),
                            height: 45,
                            child: const Text(
                              "还有很多东西没有做完呢！！",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 5, top: 0, right: 10, bottom: 0),
                            height: 25,
                            child: const Text(
                              "作者:Min",
                              maxLines: 1,
                              style: TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  childCount: _count, //内部控件数量
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
ListView(children: <Widget>[
      // 图片
      Image.asset(
        'asset/images/test1.webp',
        fit: BoxFit.fitWidth,
        height: 180,
      ),
      // 标题
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const <Widget>[
                    Text(
                      'fit属性可以控制图片的拉伸和挤压21212112',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          // maxLines: 1,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '可能裁切，充满（图片要充满整个容器，还不变形这些都是）',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    )
                  ]),
                ),
                const Icon(Icons.star, color: Colors.red),
                const Text('31')
              ])),
      // 按钮
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          PubIco(Icons.settings, 'CALL'),
          PubIco(Icons.format_align_justify, 'HAHA'),
          PubIco(Icons.architecture, 'SESE')
        ],
      ),
      const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
            'Reprehenderit ex cupidatat laboris ea irure cillum et magna aliqua. Qui labore est ullamco ea labore Lorem quis magna ea est quis Lorem. Ad irure anim mollit minim et pariatur. Eiusmod aute nisi aliqua dolor. Laborum eu reprehenderit deserunt laborum labore reprehenderit veniam tempor magna. Esse occaecat qui ullamco occaecat laboris dolore sunt irure laboris sint eu reprehenderit. Reprehenderit labore dolor incididunt occaecat proident veniam.'),
      ),
      const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
            'Reprehenderit ex cupidatat laboris ea irure cillum et magna aliqua. Qui labore est ullamco ea labore Lorem quis magna ea est quis Lorem. Ad irure anim mollit minim et pariatur. Eiusmod aute nisi aliqua dolor. Laborum eu reprehenderit deserunt laborum labore reprehenderit veniam tempor magna. Esse occaecat qui ullamco occaecat laboris dolore sunt irure laboris sint eu reprehenderit. Reprehenderit labore dolor incididunt occaecat proident veniam.'),
      ),
      const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
            'Reprehenderit ex cupidatat laboris ea irure cillum et magna aliqua. Qui labore est ullamco ea labore Lorem quis magna ea est quis Lorem. Ad irure anim mollit minim et pariatur. Eiusmod aute nisi aliqua dolor. Laborum eu reprehenderit deserunt laborum labore reprehenderit veniam tempor magna. Esse occaecat qui ullamco occaecat laboris dolore sunt irure laboris sint eu reprehenderit. Reprehenderit labore dolor incididunt occaecat proident veniam.'),
      ),
      // 长文字
      const SizedBox(
        height: 20.0,
      )
    ]);
*/
class PubIco extends StatelessWidget {
  // 定义参数
  final String text;
  final IconData icon;
  // 接收参数
  const PubIco(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Icon(icon, color: Colors.blue, size: 32.0),
      const SizedBox(height: 7.0),
      Text(text, style: const TextStyle(fontSize: 24, color: Colors.blue))
    ]);
  }
}
