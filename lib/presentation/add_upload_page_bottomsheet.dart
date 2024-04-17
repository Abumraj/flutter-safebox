import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:safebox/controller/starred_folder_controller.dart';
import 'package:safebox/core/app_export.dart';
import 'package:safebox/core/upload_manager.dart';
import 'package:safebox/core/utils/progress_dialog_utils.dart';
import 'package:safebox/presentation/contact_selection_page.dart';
import 'package:safebox/presentation/name_folder_page_dialog.dart';

// ignore: must_be_immutable
class AddUploadPageBottomsheet extends StatelessWidget {
  StarredFolderController controller = Get.put(StarredFolderController());
  final Uploadanager uploadController = Get.put(Uploadanager());

  final int? folderId;
  final Function? functionCallBack;

  AddUploadPageBottomsheet({
    Key? key,
    this.functionCallBack,
    this.folderId,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.v,
                    bottom: 4.v,
                  ),
                  child: Text(
                    "lbl_add_to_savebox".tr,
                    style: CustomTextStyles
                        .titleSmallOpenSansOnPrimaryContainerSemiBold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowRightOnprimary,
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.v),
          Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIcRoundCreateNewFolder,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();

                      Get.dialog(AlertDialog(
                        backgroundColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        content: NameFolderPageDialog(
                          controller,
                          folderId: folderId,
                          functionCallBack: functionCallBack,
                        ),
                      ));

                      // showDialog(context: context, builder: (context){
                      //   return Al
                      // })
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text(
                        "lbl_create_folder".tr,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.v),
          InkWell(
            onTap: () async {
              bool permissionGranted =
                  await FlutterContacts.requestPermission();
              if (permissionGranted) {
                Get.back();
                Get.to(const CustomContactSelectionScreen());
              } else {}
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBxsContact,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_upload_contacts".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.v),
          InkWell(
            onTap: () {
              Get.back();
              uploadController.whatsappUpload(
                  folderId: folderId, callBack: functionCallBack);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFluentDocument,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "msg_upload_whatsapp".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.v),
          InkWell(
            onTap: () {
              // uploadController.checkFileExist("1693167479685.jpg",
              //     "/storage/emulated/0/Pictures/Recorder0");
              // Get.back();
              // uploadController.docsUpload(
              //     folderId: folderId, callBack: functionCallBack);
              ProgressDialogUtils.showFailureToast(
                  "Document upload coming soon");
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBxsCloudUpload,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_upload_files".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.v),
          InkWell(
            onTap: () {
              // uploadController.photoUpload(
              //     folderId: folderId, callBack: functionCallBack);
              ProgressDialogUtils.showFailureToast("Photos upload coming soon");
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFolderOnprimarycontainer,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "Upload Photos",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.v),
          InkWell(
            onTap: () {
              // uploadController.videoUpload(
              //     folderId: folderId, callBack: functionCallBack);
              ProgressDialogUtils.showFailureToast("Videos upload coming soon");
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFolderOnprimarycontainer,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "Upload Videos",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.v),
          InkWell(
            onTap: () {
              // uploadController.audioUpload(
              //     folderId: folderId, callBack: functionCallBack);
              ProgressDialogUtils.showFailureToast("Audios upload coming soon");
            },
            child: Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgAntDesignAudioFilled,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_upload_audio".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 14.v),
        ],
      ),
    );
  }
}
