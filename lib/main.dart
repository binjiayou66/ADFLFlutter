import 'package:flutter/material.dart';
import 'BoostApp/boost_app.dart';
import 'BoostApp/boost_app_config.dart';
import 'TestPage/hello_flutter.dart';

void main() async {
  BoostAppConfig.singleton.registerPageBuilders({
    'hello_flutter': (pageName, params, _) {
      return HelloFlutter();
    },
  });
  runApp(new BoostApp());
}
