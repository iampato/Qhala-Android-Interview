import 'package:hive/hive.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:logger/logger.dart';

class HiveUtils {
  static Logger _logger = Logger();
  static Future<void> initHiveDb() async {
    await Hive.initFlutter();
  }

  static Future<void> testHive() async {
    var box = await Hive.openBox('testBox');
    box.put('name', 'David');
    _logger.d('Name: ${box.get('name')}');
  }
}
