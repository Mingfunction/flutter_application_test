import 'package:flutter/material.dart';

class TabView1 extends StatelessWidget {
  const TabView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
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
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          // controller: _inputController,//控制器
          // focusNode: _inputFocusNode,//焦点
          style: const TextStyle(fontSize: 16, color: Colors.black87), //文字大小、颜色
          maxLines: 1, //最多多少行
          minLines: 1, //最少多少行
          onChanged: (text) {
            //输入框内容变化回调
          },
          decoration: InputDecoration(
            fillColor: Colors.grey[200], //背景颜色，必须结合filled: true,才有效
            filled: true, //重点，必须设置为true，fillColor才有效
            isCollapsed: true, //重点，相当于高度包裹的意思，必须设置为true，不然有默认奇妙的最小高度
            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10), //内容内边距，影响高度
            border: const OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(
                color: Color.fromARGB(255, 200, 30, 30),
              ),
            ), //边框，一般下面的几个边框一起设置
            // keyboardType: TextInputType.number, //键盘类型
            // obscureText: true,//密码模式
            // focusedBorder: _outlineInputBorder,
            // enabledBorder: _outlineInputBorder,
            // disabledBorder: _outlineInputBorder,
            // focusedErrorBorder: _outlineInputBorder,
            // errorBorder: _outlineInputBorder,
          ),
        ),
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
  }
}

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
