
import 'package:hive_flutter/adapters.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart' as pp;

import '../model/branch/branch_model.dart';
import 'hive_box.dart';


class HiveService {
  const HiveService._();
  static Future<void> init() async {
    final dir = await pp.getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    Hive.registerAdapter(BranchAdapter());
    Hive.registerAdapter(LocationAdapter());

    await Hive.openBox<BranchModel>(HiveBoxNames.branches);
  }
}




