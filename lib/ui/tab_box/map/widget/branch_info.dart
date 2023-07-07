/*
    CREATED BY: BAKHROMJON POLAT
    CREATED AT: Sep 28 2022 12:39

    Github: https://github.com/BahromjonPolat
    Linked In: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Description: App dialogs

*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_firbase_app/ui/tab_box/map/widget/primaryButton.dart';
import 'package:shop_firbase_app/utils/app_image.dart';
import 'package:shop_firbase_app/utils/color.dart';

import '../../../../data/model/branch/branch_model.dart';


class BranchInfoTile extends StatelessWidget {
  
  const BranchInfoTile({
    Key? key, required BranchModel branch,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 254.h,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(AppImage.sliver2),
            horizontalTitleGap: 13.w,
            title: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: const Text(
                "Tiin - Ulgurji Market",
                
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nazarbek",
                  // style: AppTextStyle.medium(
                  //   color: Colors.black.withOpacity(0.5),
                  // ),
                ),
                SizedBox(height: 8.h),
                const Text(
                  "tttttttttt",
                  style: TextStyle(
                    color: MyColors.white,
                    
                  ),
                ),
                SizedBox(height: 15.h),
                Divider(
                  height: 2,
                  color: const Color(0xffcecece).withOpacity(0.5),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 5, bottom: 5),
                  child: InkWell(
                    // onTap: () => contactDial("+998935559562"),
                    child: Text(
                      "+998 (93) 555 95 62",
                    
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  color: const Color(0xffcecece).withOpacity(0.5),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
          PrimaryButton(
            label: "ssssssss",
            onPressed: () {
              Navigator.pop(context);
              // AppBottomSheets bottomSheets = AppBottomSheets(context);
              // bottomSheets.launchBranch(branch.location);
              // AppNavigator.pop();
            },
          )
        ],
      ),
    );
  }
}
