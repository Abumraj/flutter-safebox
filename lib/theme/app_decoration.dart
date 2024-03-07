import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue800,
      );
  static BoxDecoration get fillBlue100 => BoxDecoration(
        color: appTheme.blue100,
      );
  static BoxDecoration get fillBlue5001 => BoxDecoration(
        color: appTheme.blue5001,
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray20001,
      );
  static BoxDecoration get fillBlueGrayE => BoxDecoration(
        color: appTheme.blueGray100E5,
      );
  static BoxDecoration get fillOrange => BoxDecoration(
        color: appTheme.orange5001,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red10001,
      );
  static BoxDecoration get fillRed100 => BoxDecoration(
        color: appTheme.red100,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: appTheme.whiteA700.withOpacity(0.67),
      );

  // Gradient decorations
  static BoxDecoration get gradientBlueDToBlue => BoxDecoration(
        border: Border.all(
          color: appTheme.blue5003,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.37, -0.25),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.blue502d,
            appTheme.blue50,
          ],
        ),
      );
  static BoxDecoration get gradientGreenToGreenA => BoxDecoration(
        border: Border.all(
          color: appTheme.greenA10002,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.08, -0.49),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.green5066,
            appTheme.greenA100,
          ],
        ),
      );
  static BoxDecoration get gradientLightGreenToGreen => BoxDecoration(
        border: Border.all(
          color: appTheme.greenA10001,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.22, -0.23),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.lightGreen10066,
            appTheme.green50,
          ],
        ),
      );
  static BoxDecoration get gradientOrangeToOrange => BoxDecoration(
        border: Border.all(
          color: appTheme.orange5002,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.32, -0.17),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.orange5001.withOpacity(0.27),
            appTheme.orange50,
          ],
        ),
      );
  static BoxDecoration get gradientPinkCToPink => BoxDecoration(
        border: Border.all(
          color: appTheme.red10002,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.32, -0.16),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.pink504c,
            appTheme.pink50,
          ],
        ),
      );
  static BoxDecoration get gradientPurpleFToPurple => BoxDecoration(
        border: Border.all(
          color: appTheme.purple50,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.3, -0.21),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.purple504f,
            appTheme.purple5001,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineAmberA => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.amberA200,
          width: 2.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.amberA200.withOpacity(0.06),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90001.withOpacity(0.35),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlue => BoxDecoration(
        border: Border.all(
          color: appTheme.blue800,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlue200 => BoxDecoration(
        border: Border.all(
          color: appTheme.blue200,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlue800 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.blue800,
          width: 2.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90001.withOpacity(0.06),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlue8001 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.blue800,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.08),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              8,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlue90019 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.blue90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray40001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray40001 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray40001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray50 => BoxDecoration(
        color: appTheme.gray50,
        border: Border.all(
          color: appTheme.gray50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGreen => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.green500,
          width: 2.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.green70011,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineIndigo => BoxDecoration(
        border: Border.all(
          color: appTheme.indigo900,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              12,
            ),
          ),
        ],
      );

  // Image decorations
  static BoxDecoration get image10 => BoxDecoration();
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder32 => BorderRadius.circular(
        32.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
        top: Radius.circular(30.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );

  // Circle borders
  static BorderRadius get circleBorder18 => BorderRadius.circular(
        18.h,
      );
  static BorderRadius get circleBorder43 => BorderRadius.circular(
        43.h,
      );

  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        20.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    