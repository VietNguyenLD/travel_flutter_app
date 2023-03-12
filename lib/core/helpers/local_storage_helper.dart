import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHelper {
  LocalStorageHelper._internal();

  static final LocalStorageHelper _shared = LocalStorageHelper._internal();

  factory LocalStorageHelper() {
    return _shared;
  }

  Box<dynamic>? hideBox;

  static innitLocalStorage() async {
    _shared.hideBox = await Hive.openBox('TravolApp');
  }

  static dynamic getValue(String key) {
    return _shared.hideBox?.get(key);
  }

  static setValue(String key, dynamic val) {
    _shared.hideBox?.put(key, val);
  }
}
