/*
    Created by: Bakhromjon Polat
    Created at: Sep 30 2022 17:28:14

    Github: https://github.com/BahromjonPolat
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Description: 

*/

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../../../data/model/local/local_model.dart';
import '../../../../utils/color.dart';

class AppBottomSheets {
  final BuildContext context;
  AppBottomSheets(this.context);

  Future selectBranch({String title = '', required Widget content}) async {
    await _baseBottomSheet(title: title, content: content);
  }

  Future selectFeedbackType(
      {String title = '', required Widget content}) async {
    await _baseBottomSheet(title: title, content: content);
  }

  Future _baseBottomSheet({String title = '', required Widget content}) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(27.r),
          topRight: Radius.circular(27.r),
        ),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              content,
            ],
          ),
        );
      },
    );
  }

  Future launchBranch() async {
    double lat = 41.334122;
    double long = 69.144771;
    try {
      final coords = Coords(lat, long);
      const title = "dfdf";
      final availableMaps = await MapLauncher.installedMaps;

      if (Platform.isIOS) {
        final action = CupertinoActionSheet(
          actions: [
            for (var map in availableMaps)
              CupertinoActionSheetAction(
                child: Text(map.mapName),
                onPressed: () => map.showMarker(
                  coords: coords,
                  title: title,
                ),
              ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("cancel"),
          ),
        );

        // ignore: use_build_context_synchronously
        showCupertinoModalPopup(context: context, builder: (context) => action);
      } else {
        // ignore: use_build_context_synchronously
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () {
                          map
                              .showMarker(
                                coords: coords,
                                title: title,
                              )
                              .then((value) => Navigator.pop(context));
                        },
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      }
    } catch (e) {
      e;
    }
  }

  Future chanageLanguage() async {
    showModalBottomSheet(
        // isDismissible: false,
        backgroundColor: MyColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(27.r),
            topRight: Radius.circular(27.r),
          ),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "chooseLang",
                        style: TextStyle(fontSize: 24),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(12.r),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 12.r,
                          backgroundColor: MyColors.grey,
                          child: const Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                _localeTile(setState, 0),
                const Divider(height: 2, color: MyColors.textColor),
                const Divider(height: 2, color: MyColors.white),
                _localeTile(setState, 1),
                SizedBox(height: 15.h),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size((375.w - 60.w), 57.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(57.r),
                    ),
                    side: const BorderSide(
                      width: 3,
                      color: MyColors.grey,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "save",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10.h)
              ],
            );
          });
        });
  }

  ListTile _localeTile(
    StateSetter setState,
    int index,
  ) {
    LocaleModel localeModel = AppLocale.localeList[index];
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30.h),
      onTap: () async {
        await context.setLocale(localeModel.locale);
        // await AppPrefs.setLanguage(localeModel.locale.languageCode);
        setState(() {});
      },
      title: Text(
        localeModel.name,
        locale: EasyLocalization.of(context)?.locale,
        style: const TextStyle(fontSize: 20),
      ),
      trailing: localeModel.locale == context.locale
          ? null // ? SvgPicture.asset(AppIcons.tick)
          : null,
    );
  }
}
