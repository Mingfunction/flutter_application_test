import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TabView2 extends StatefulWidget {
  const TabView2({Key? key}) : super(key: key);

  @override
  State<TabView2> createState() => _TabView2State();
}

class _TabView2State extends State<TabView2> {
  int _count = 10;
  int _opacity = 255;
  late EasyRefreshController _controller;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset > 255) {
          _opacity = 0;
        } else if (_scrollController.offset <= 80) {
          _opacity = 255;
        } else {
          _opacity = (255 - _scrollController.offset) * 255 ~/ (255 * 3);
        }
        print(_opacity);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(width: double.infinity, height: 150, color: Color.fromARGB(_opacity, 117, 231, 161)),
        EasyRefresh(
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
            controller: _scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                sliver: SliverToBoxAdapter(
                  child: EasyRefresh(
                    header: const MaterialHeader(),
                    footer: const MaterialFooter(),
                    onRefresh: () async {},
                    onLoad: () async {},
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 180.0,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                      ),
                      items: [
                        for (int i = 0; i < 9; i++)
                          Card(
                            elevation: 0,
                            color: Colors.orange[(i + 1) * 100],
                            child: Center(
                              child: Text((i + 1).toString()),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverSafeArea(
                sliver: SliverPadding(
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
                                      image: AssetImage('asset/images/test2.webp'),
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
                                  "还有很多东西没有做完呢,起来加班啦！！",
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
                                  "作者:1221",
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
        )
      ],
    );
  }
}
