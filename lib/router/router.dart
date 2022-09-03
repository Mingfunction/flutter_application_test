import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './application.dart';

import './router_config.dart';

class Routes {
  static String root = "/";
  static String page2 = "/page2";

  static void configureRoutes(FluroRouter router) {
    //每一个路由规则都需要在这里进行新的定义
    router.define(root, handler: rootHandler);
    router.define(page2, handler: page2Handler, transitionType: TransitionType.inFromRight);
    router.notFoundHandler = emptyHandle;
  }

  static Future navigateTo(BuildContext context, String path,
      {required Map<String, dynamic> params, String transition = "native"}) {
    String query = "";
    int index = 0;
    TransitionType transitionOption = transitionTypes[transition];
    for (var key in params.keys) {
      var value = Uri.encodeComponent(params[key]);
      if (index == 0) {
        query = "?";
      } else {
        query = "$query&";
      }
      query += "$key=$value";
      index++;
    }
    // print('我是navigateTo传递的参数：$query');
    path = path + query;
    return Application.router.navigateTo(context, path, transition: transitionOption);
  }
}

// 路由动画
Map transitionTypes = <String, TransitionType>{
  "inFromLeft": TransitionType.inFromLeft,
  "inFromRight": TransitionType.inFromRight,
  "inFromBottom": TransitionType.inFromBottom,
  "native": TransitionType.native,
  "nativeModal": TransitionType.nativeModal,
  "fadeIn": TransitionType.fadeIn,
  "cupertino": TransitionType.cupertino,
};

/*
上面代码中transitionType是可以给页面进入时配置一个入场动画,他有下面11种
TransitionType.inFromLeft //左侧进入
TransitionType.inFromRight //右侧进入
TransitionType.inFromBottom //底部进入 默认入场动画
TransitionType.native //无进入动画
TransitionType.nativeModal //同上
TransitionType.fadeIn //渐显动画
TransitionType.custom //自定义
TransitionType.material //感觉和上面几种一样 无特别动画效果
TransitionType.materialFullScreenDialog //感觉和上面几种一样 无特别动画效果
TransitionType.cupertino //右进右出
TransitionType.cupertinoFullScreenDialog //底部进 底部出 下个页面返回值变化
*/

var emptyHandle = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const EmptyPage();
});

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("没有页面");
  }
}
