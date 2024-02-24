import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

/// This class is used in the [profileinformation_item_widget] screen.
class ProfileinformationItemModel {
  ProfileinformationItemModel({
    this.userImage,
    this.profileInformation,
    this.changeAccountInformation,
    this.accountInformationArrow,
    this.screen,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgBxBxsUser);
    profileInformation = profileInformation ?? Rx("Account Information");
    changeAccountInformation =
        changeAccountInformation ?? Rx("Change your account information");
    accountInformationArrow =
        accountInformationArrow ?? Rx(ImageConstant.imgArrowRight);
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? profileInformation;

  Rx<String>? changeAccountInformation;

  Rx<String>? accountInformationArrow;
  Rx<Widget>? screen;

  Rx<String>? id;
}
