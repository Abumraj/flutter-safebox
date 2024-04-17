// import '../controller/copy_page_controller.dart';
// import '../models/fileslist1_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:safebox/core/app_export.dart';
// import 'package:safebox/widgets/custom_icon_button.dart';

// // ignore: must_be_immutable
// class Fileslist1ItemWidget extends StatelessWidget {
//   Fileslist1ItemWidget(
//     this.fileslist1ItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );

//   Fileslist1ItemModel fileslist1ItemModelObj;

//   var controller = Get.find<CopyPageController>();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 47.h,
//       child: Align(
//         alignment: Alignment.centerRight,
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 6.h),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 4.v),
//               Obx(
//                 () => CustomIconButton(
//                   height: 30.adaptSize,
//                   width: 30.adaptSize,
//                   padding: EdgeInsets.all(6.h),
//                   child: CustomImageView(
//                     imagePath: fileslist1ItemModelObj.menuImage!.value,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 13.v),
//               Obx(
//                 () => Text(
//                   fileslist1ItemModelObj.files!.value,
//                   style: CustomTextStyles.titleMedium18_1,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
