import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
    required this.icons,
    required this.titles,
    required this.currentIndex,
    required this.active,
  }) : super(key: key);

  final List<IconData> icons;
  final List<String> titles;
  final int currentIndex;
  final Function(int index) active;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // 底部导航的每一项
  Widget tabbarItem(int index) {
    Color iconColor = Colors.black;
    TextStyle style = const TextStyle(fontSize: 12, color: Colors.black);
    if (index == widget.currentIndex) {
      iconColor = Colors.amber;
      style = const TextStyle(fontSize: 12, color: Colors.amber);
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(widget.icons[index], color: iconColor),
          Text(widget.titles[index], style: style),
        ],
      ),
      onTap: () {
        widget.active(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 50, child: tabbarItem(0)),
          SizedBox(height: 50, child: tabbarItem(1)),
          const SizedBox(height: 30),
          SizedBox(height: 50, child: tabbarItem(2)),
          SizedBox(height: 50, child: tabbarItem(3)),
        ],
      ),
    );
  }
}

class BarCenterButton extends StatelessWidget {
  const BarCenterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: FloatingActionButton(
        onPressed: () {
          print("你点击了ADD");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
