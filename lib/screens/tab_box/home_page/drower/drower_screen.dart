import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_firbase_app/screens/tab_box/home_page/drower/app_abaut/app_abaut.dart';
import 'package:shop_firbase_app/utils/app_image.dart';
import 'package:shop_firbase_app/utils/color.dart';
import 'package:shop_firbase_app/utils/my_utils.dart';

import 'language/language_screen.dart';

// ignore: must_be_immutable
class MyDrawer extends StatefulWidget {
  bool IsNightMode;
  ValueChanged onChanged;

  MyDrawer({super.key, required this.IsNightMode, required this.onChanged});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Future<void> _getMode() async {
    setState(() {});
  }

  @override
  void initState() {
    _getMode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shadowColor: MyColors.appColor1,
      elevation: 15.5,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(25).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    AppImage.d_r,
                    fit: BoxFit.cover,
                    width: 110.5,
                    height: 110.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300.h,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                MyUtils.infoPagedrover(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LanguageScreen()));
                  },
                  child: ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(
                      "Til".tr(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ),
                MyUtils.infoPagedrover(),
                ListTile(
                  leading: const Icon(Icons.nights_stay_outlined),
                  title: Text(
                    "Tungi_Rejim".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700),
                  ),
                  trailing: Switch(
                      activeColor: Theme.of(context).cardColor,
                      inactiveThumbColor: Theme.of(context).cardColor,
                      value: widget.IsNightMode,
                      onChanged: widget.onChanged),
                ),
                MyUtils.infoPagedrover(),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AbautScreen())),
                  child: ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: Text(
                      "Biz Haqimizda".tr(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                MyUtils.infoPagedrover(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
