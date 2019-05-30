import 'package:flutter_boost/flutter_boost.dart';

class BoostAppConfig {
  static final BoostAppConfig _instance = BoostAppConfig();

  static BoostAppConfig get singleton => _instance;

  Map<String, PageBuilder> get builders => _builders;

  Map<String, PageBuilder> _builders;

  void registerPageBuilders(Map<String, PageBuilder> builders) {
    if (this._builders == null) {
      this._builders = new Map();
    }
    this._builders.addAll(builders);
  }
}
