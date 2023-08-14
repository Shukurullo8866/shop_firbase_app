import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/app.dart';
import 'data/hive/hive_servise.dart';

void main() async {
   SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

    WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  
  await Firebase.initializeApp();
  runApp(const App());
}



