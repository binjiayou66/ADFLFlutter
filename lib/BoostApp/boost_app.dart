import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'boost_app_config.dart';

class BoostApp extends StatefulWidget {
  BoostApp();

  @override
  _BoostAppState createState() => _BoostAppState();
}

class _BoostAppState extends State<BoostApp> {
  _BoostAppState();

  @override
  void initState() {
    super.initState();

    Map<String, PageBuilder> builders = BoostAppConfig.singleton.builders;

    if (builders.isNotEmpty) {
      FlutterBoost.singleton.registerPageBuilders(builders);
    }
    FlutterBoost.handleOnStartPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(),
        home: MyHomeWidget());
  }
}

class MyHomeWidget extends StatefulWidget {
  MyHomeWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new MyHomeWidgetState();
  }
}

class MyHomeWidgetState extends State<MyHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
    );
  }
}
