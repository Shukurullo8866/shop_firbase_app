import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_firbase_app/utils/app_image.dart';

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
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(25).r,
            child: Column(
              children: [
                SizedBox(
                  width: 162.5.w,
                  height: 88.64.h,
                  child: Image.asset(
                    AppImage.d_r
                  ),
                ),
                // SizedBox(
                //   child: Text('Ishonch 571',
                //       style: Theme.of(context).textTheme.bodyLarge),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 300.h,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/languageChange");
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
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/about"),
                  child: ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: Text(
                      "Haqimizda".tr(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}