/*
    CREATED BY: BAKHROMJON POLAT
    CREATED AT: Sep 28 2022 11:30

    Github: https://github.com/BahromjonPolat
    Linked In: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Description: App dialogs

*/


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_firbase_app/utils/color.dart';
import 'package:shop_firbase_app/utils/style.dart';


import '../data/model/branch/branch_model.dart';
import '../ui/tab_box/map/widget/branch_info.dart';


class AppDialog {
  final BuildContext context;
  const AppDialog(this.context);

  // ===== GENDER DIALOG ===================================================//
  // Future genderDialog(TextEditingController controller) async {
  //   showDialog(
  //     context: context,
  //     builder: (_) => Dialog(
  //       insetPadding: EdgeInsets.zero,
  //       shape: AppShape.circularBorder(radius: 20.0),
  //       elevation: 0,
  //       backgroundColor: Colors.white,
  //       child: SizedBox(
  //         width: ScreenUtil().scaleWidth * .9,
  //         height: 120.h,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             _setGender(LocaleKeys.man.tr(), controller),
  //             SizedBox(height: ScreenUtil.defaultSize.height * .02),
  //             _setGender(LocaleKeys.woman.tr(), controller),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  GestureDetector _setGender(
    String gender,
    TextEditingController controller,
  ) =>
      GestureDetector(
        onTap: () {
          controller.text = gender;
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 16.w),
          child: Text(gender, ),
        ),
      );

  // ==== BRANCH DIALOG ==================================================== //
  void showBranchInfoDialog({required BranchModel branch}) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (_) => AlertDialog(
        backgroundColor: MyColors.white,
        shape: AppShape.circularBorder(),
        alignment: const Alignment(0.0, 0.7),
        contentPadding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 12.h),
        content: BranchInfoTile(branch: branch),
      ),
    );
  }
}
  // ======= SIMPLE DIALOG ================================================== //

//   void simpleDialog({
//     String title = '',
//     String content = '',
//     VoidCallback? onYesPressed,
//   }) {
//     showDialog(
//         context: context,
//         builder: (_) {
//           if (Platform.isIOS) {
//             return CupertinoAlertDialog(
//               title: _setSemiBoldText(title),
//               actions: [
//                 AppTextButton(
//                   key: AppKeys.dialogNo,
//                   label: LocaleKeys.no.tr(),
//                   onPressed: AppNavigator.pop,
//                 ),
//                 AppTextButton(
//                   key: AppKeys.dialogYes,
//                   label: LocaleKeys.yes.tr(),
//                   onPressed: onYesPressed,
//                 ),
//               ],
//             );
//           }
//           return AlertDialog(
//             contentPadding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 0),
//             titlePadding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
//             backgroundColor: Colors.white,
//             title: _setSemiBoldText(title),
//             content: Text(content, style: AppTextStyle.medium()),
//             actions: <Widget>[
//               AppTextButton(
//                 key: AppKeys.dialogNo,
//                 label: LocaleKeys.no.tr(),
//                 onPressed: AppNavigator.pop,
//               ),
//               AppTextButton(
//                 key: AppKeys.dialogYes,
//                 label: LocaleKeys.yes.tr(),
//                 onPressed: onYesPressed,
//               ),
//             ],
//           );
//         });
//   }

//   //  SELECT CAMERA OR GALLERY
//   Future selectFile() async {
//     showDialog(
//       context: context,
//       builder: (_) => Dialog(
//         shape: AppShape.circularBorder(),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _setTile(source: ImageSource.camera),
//             _setTile(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _setTile({
//     ImageSource source = ImageSource.gallery,
//   }) {
//     String title = source == ImageSource.gallery
//         ? LocaleKeys.gallery.tr()
//         : LocaleKeys.camera.tr();

//     final radius =
//         source == ImageSource.gallery ? RadiusType.bottom : RadiusType.top;

//     return SettingsListTile(
//       label: title,
//       radius: radius,
//       onTap: () async {
//         AppNavigator.pop();
//         FeedbackImageBloc feedbackBloc = BlocProvider.of(context);
//         final ImagePicker picker = ImagePicker();
//         XFile? file = await picker.pickImage(source: source);

//         if (file == null) return;

//         feedbackBloc.add(
//           FeedbackSelectImageEvent(imageBytes: await file.readAsBytes()),
//         );
//       },
//     );
//   }

//   Text _setSemiBoldText(String text) {
//     return Text(
//       text,
//       style: AppTextStyle.semiBold(size: 18),
//     );
//   }

//   Future setBirthDate(TextEditingController controller) async {
//     String initialDate = controller.text;
//     if (Platform.isIOS) {
//       showModalBottomSheet(
//           context: context,
//           builder: (_) {
//             return SizedBox(
//               height: 320.h,
//               child: Column(
//                 children: [
//                   CupertinoDatePicker(
//                     mode: CupertinoDatePickerMode.date,
//                     initialDateTime: AppFormatter.parseDate(initialDate),
//                     maximumDate: DateTime(2015),
//                     onDateTimeChanged: (v) {
//                       String date = AppFormatter.formatDate(v);
//                       controller.text = date;
//                     },
//                   ).wrapExpanded(),
//                   AppTextButton(
//                     onPressed: AppNavigator.pop,
//                     label: LocaleKeys.back.tr(),
//                   )
//                 ],
//               ),
//             );
//           });

//       return;
//     }

//     DateTime? dateTime = await showDatePicker(
//       context: context,
//       currentDate: AppFormatter.parseDate(initialDate),
//       initialDate: AppFormatter.parseDate(initialDate),
//       firstDate: DateTime(1950),
//       lastDate: DateTime(2015),
//     );

//     if (dateTime == null) return;
//     String date = AppFormatter.formatDate(dateTime);
//     controller.text = date;
//   }
// }
