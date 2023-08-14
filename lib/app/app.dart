import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shop_firbase_app/screens/auth/widgets/repositories/categories_repository.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/orders_repository.dart';
import '../data/repositories/profile_repository.dart';
import '../screens/auth/widgets/repositories/product_repocitory.dart';
import '../screens/on_boarding/on_boarding_screen.dart';
import '../screens/splash/splashPage.dart';
import '../view_model/auth_view_model.dart';
import '../view_model/categoryries_view_model.dart';
import '../view_model/order_view_model.dart';
import '../view_model/product_view_model.dart';
import '../view_model/profile_view_model.dart';
import '../view_model/tab_view_model.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    var fireStore = FirebaseFirestore.instance;
    return EasyLocalization(
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'EN'),
        Locale('uz', 'UZ')
      ],
      startLocale: const Locale('uz', 'UZ'),
      path: 'assets/translate',
      fallbackLocale: const Locale('uz', 'UZ'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabViewModel()),
          ChangeNotifierProvider(
            create: (context) => CategoriesViewModel(
                categoryRepository:
                    CategoryRepository(firebaseFirestore: fireStore)),
          ),
          ChangeNotifierProvider(
            create: (context) => ProfileViewModel(
              firebaseAuth: FirebaseAuth.instance,
              profileRepository:
                  ProfileRepository(firebaseFirestore: fireStore),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => OrdersViewModel(
              ordersRepository: OrdersRepository(
                firebaseFirestore: fireStore,
              ),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => ProductViewModel(
              productRepository: ProductRepository(
                firebaseFirestore: fireStore,
              ),
            ),
          ),
          Provider(
            create: (context) => AuthViewModel(
              authRepository:
                  AuthRepository(firebaseAuth: FirebaseAuth.instance),
            ),
          )
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MainPage(),
        );
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const SplashPage();
        } else {
          return const OnBoardingScreen();
        }
      },
    );
  }
}
