import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_firbase_app/ui/tab_box/map/widget/app_buttonshit.dart';
import 'package:shop_firbase_app/ui/tab_box/map/widget/primaryButton.dart';
import 'package:shop_firbase_app/utils/app_image.dart';
import 'package:shop_firbase_app/utils/color.dart';

import '../../../../data/model/branch/branch_model.dart';
import '../../../../utils/style.dart';

// ignore: must_be_immutable
class BranchInfoTile extends StatelessWidget {
  BranchModel branch;
  BranchInfoTile({
    Key? key,
    required this.branch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(AppImage.d_r),
            horizontalTitleGap: 13.w,
            title: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                "Dream Wood - Ulgurji savdo",
                style: AppTextStyle.bold(size: 18),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Zangiota tumani, Toshkent viloyati",
                  style: AppTextStyle.medium(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Ish vaqti: 08:00-20:00",
                  style: AppTextStyle.medium(
                    color: MyColors.appColor1,
                    size: 10,
                  ),
                ),
                SizedBox(height: 15.h),
                Divider(
                  height: 2,
                  color: const Color(0xffcecece).withOpacity(0.5),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 5, bottom: 5),
                  child: InkWell(
                    child: Text(
                      "+998 (97) 123 33 23",
                      style: AppTextStyle.medium(color: MyColors.appColor1),
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  color: const Color(0xffcecece).withOpacity(0.5),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
          PrimaryButton(
            label: "Marshurutni davom ettring",
            onPressed: () {
              // Navigator.pop(context);
              AppBottomSheets bottomSheets = AppBottomSheets(context);
              bottomSheets.launchBranch();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
