import 'package:flutter/material.dart';
import 'package:safebox/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(5.h),
                  border: Border.all(
                    color: appTheme.blue5003,
                    width: 1.h,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(0.37, 0),
                    end: Alignment(0.5, 1),
                    colors: [
                      appTheme.blue502d,
                      appTheme.blue50,
                    ],
                  ),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue800,
        borderRadius: BorderRadius.circular(32.h),
      );
  static BoxDecoration get fillBlueTL32 => BoxDecoration(
        color: appTheme.blue800.withOpacity(0.67),
        borderRadius: BorderRadius.circular(32.h),
      );
  static BoxDecoration get gradientOrangeToOrange => BoxDecoration(
        borderRadius: BorderRadius.circular(5.h),
        border: Border.all(
          color: appTheme.orange5002,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.32, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.orange5001.withOpacity(0.27),
            appTheme.orange50,
          ],
        ),
      );
  static BoxDecoration get gradientLightGreenToGreen => BoxDecoration(
        borderRadius: BorderRadius.circular(5.h),
        border: Border.all(
          color: appTheme.greenA10001,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.22, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.lightGreen10066,
            appTheme.green50,
          ],
        ),
      );
  static BoxDecoration get gradientPurpleFToPurple => BoxDecoration(
        borderRadius: BorderRadius.circular(5.h),
        border: Border.all(
          color: appTheme.purple50,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.3, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.purple504f,
            appTheme.purple5001,
          ],
        ),
      );
  static BoxDecoration get gradientPinkCToPink => BoxDecoration(
        borderRadius: BorderRadius.circular(5.h),
        border: Border.all(
          color: appTheme.red10002,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.32, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.pink504c,
            appTheme.pink50,
          ],
        ),
      );
  static BoxDecoration get gradientGreenToGreenA => BoxDecoration(
        borderRadius: BorderRadius.circular(7.h),
        border: Border.all(
          color: appTheme.greenA10002,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.08, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.green5066,
            appTheme.greenA100,
          ],
        ),
      );
  static BoxDecoration get outlineBlue => BoxDecoration(
        color: appTheme.blue800,
        borderRadius: BorderRadius.circular(31.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.blue800.withOpacity(0.2),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              15,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineIndigo => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(25.h),
      );
}
