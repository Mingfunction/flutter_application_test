import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../pages/home/home.dart';
import 'package:flutter_application_test/pages/page2/page2.dart';

var rootHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MyHomePage();
});
var page2Handler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Page2();
});
