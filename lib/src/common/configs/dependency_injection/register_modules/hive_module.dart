import 'package:test_template/src/routers/page_config.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HiveModule {
  @preResolve
  @lazySingleton
  Future<HiveInterface> get hive async {
    await Hive.initFlutter();
    Hive.registerAdapter(PageConfigAdapter());
    await Hive.openBox<PageConfig>('pageConfig');
    return Hive;
  }

  @preResolve
  @lazySingleton
  Future<Box<PageConfig>> pageConfigEntityBox(HiveInterface hive) async {
    final box = hive.box<PageConfig>('pageConfig');
    return box;
  }
}
