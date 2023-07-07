// ignore_for_file: constant_identifier_names

/*
    CREATED BY: BAKHROMJON POLAT
    CREATED AT: Sep 27 2022 12:37

    Github: https://github.com/BahromjonPolat
    Linked In: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Description: Hive boxes

*/

import 'package:hive_flutter/hive_flutter.dart';

import '../model/branch/branch_model.dart';

class HiveBoxes {
  const HiveBoxes._();
  // static Box<LogModel> getLogs() => Hive.box(HiveBoxNames.errors);
  // static Box<ReceiptModel> getReceipts() => Hive.box(HiveBoxNames.receipt);
  // static final Box<dynamic> prefsBox = Hive.box<dynamic>(HiveBoxNames.prefs);
  // static final Box<NewsModel> newsBox = Hive.box(HiveBoxNames.news);
  // static final Box<NewsModel> bannersBox = Hive.box(HiveBoxNames.banners);
//  / static final Box<ProductModel> productBox = Hive.box(HiveBoxNames.products);
  // static final Box<CategoryModel> categoryBox =
      // Hive.box(HiveBoxNames.categories);
  //  static final Box<ProductModel> historyBox = Hive.box(HiveBoxNames.history);
  static final Box<BranchModel> branchBox = Hive.box(HiveBoxNames.branches);

  /// It clears all the boxes
  static Future<void> clearAllBoxes() async {
    await Future.wait([
      // getReceipts().clear(),
      // bannersBox.clear(),
      // newsBox.clear(),
      // prefsBox.clear(),
      // productBox.clear(),
     // categoryBox.clear(),
      // /historyBox.clear(),
    ]);
  }
}

/// It's a class that contains static constants that are used to name the Hive boxes
class HiveBoxNames {
  static const String errors = 'errors';
  static const String user = "user";
  static const String receipt = "receipt";
  static const String prefs = 'prefs';
  static const String news = 'news';
  static const String feedbacks = 'feedbacks';
  static const String banners = 'banners';
  static const String products = 'products';
  static const String categories = 'categories';
  static const String history = 'history';
  static const String branches = 'branches';
}
