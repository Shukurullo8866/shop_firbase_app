import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_firbase_app/screens/tab_box/home_page/drower/language/languge_button.dart';
import '../../../../../utils/app_image.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedLang = 1;
  @override
  Widget build(BuildContext context) {
    switch (context.locale.languageCode) {
      case 'en':
        selectedLang = 1;
        break;
      case 'ru':
        selectedLang = 2;
        break;
      case 'uz':
        selectedLang = 3;
        break;
      default:
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Image.asset(AppImage.d_r, height: 100.h, width: 190.w),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 221, 133, 2),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tilni_Tanlash".tr(),
                style: const TextStyle(fontSize: 22, color: Colors.black)),
            SizedBox(height: 24.h),
            ListView(
              shrinkWrap: true,
              children: [
                //? -----
                ChooseButton(
                    onTap: () {
                      context.setLocale(const Locale("en", "EN"));
                      setState(() {});
                    },
                    selectedLang: selectedLang,
                    item: 1,
                    language: 'Engilish',
                    image: AppImage.fon_1),
                SizedBox(height: 12.h),
                // ?----
                ChooseButton(
                    onTap: () {
                      context.setLocale(const Locale("ru", "RU"));
                      setState(() {});
                    },
                    selectedLang: selectedLang,
                    item: 2,
                    language: 'Russia',
                    image: AppImage.fon_2),
                SizedBox(height: 12.h),
                //?----
                ChooseButton(
                    onTap: () {
                      context.setLocale(const Locale("uz", "UZ"));
                      setState(() {});
                    },
                    selectedLang: selectedLang,
                    item: 3,
                    language: "Uzbek",
                    image: AppImage.fon_3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}