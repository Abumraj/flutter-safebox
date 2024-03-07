import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get bodyMediumBlue200 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blue200,
      );
  static get bodySmallBlue20012 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue200,
        fontSize: 12.fSize,
      );
  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get bodyLargeOnPrimaryContainer_1 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get bodyLargeRobotoGray500 =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: appTheme.gray500,
      );
  static get bodyLargeSFProTextBlack900 =>
      theme.textTheme.bodyLarge!.sFProText.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeSFProTextBlack900_1 =>
      theme.textTheme.bodyLarge!.sFProText.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeSFProTextBlack900_2 =>
      theme.textTheme.bodyLarge!.sFProText.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeSFProTextWhiteA700 =>
      theme.textTheme.bodyLarge!.sFProText.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
      );
  static get bodyMediumBlack90001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90001,
      );
  static get bodyMediumBlue800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blue800,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMedium_1 => theme.textTheme.bodyMedium!;
  static get bodyMedium_2 => theme.textTheme.bodyMedium!;
  static get bodyMedium_3 => theme.textTheme.bodyMedium!;
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 10.fSize,
      );
  static get bodySmallBlack90001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90001,
      );
  static get bodySmallBlue800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue800,
      );
  static get bodySmallBlue800_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue800,
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 9.fSize,
      );
  // Headline text style
  static get headlineMediumBlack90001 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black90001,
      );
  static get headlineMediumOpenSans =>
      theme.textTheme.headlineMedium!.openSans.copyWith(
        fontSize: 29.fSize,
        fontWeight: FontWeight.w700,
      );
  static get headlineMediumRoboto =>
      theme.textTheme.headlineMedium!.roboto.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get headlineMediumRobotoIndigo900 =>
      theme.textTheme.headlineMedium!.roboto.copyWith(
        color: appTheme.indigo900.withOpacity(0.67),
        fontWeight: FontWeight.w400,
      );
  static get headlineMedium_1 => theme.textTheme.headlineMedium!;
  static get headlineSmallBlack90001 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black90001,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallBlue90001 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blue800,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallOpenSansOnPrimary =>
      theme.textTheme.headlineSmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  // Label text style
  static get labelLargeOnPrimaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get labelLargeSofiaPro =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProBlack90001 =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProBlue800 =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: appTheme.blue800,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProBlue800Medium =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: appTheme.blue800,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProBlue800_1 =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: appTheme.blue800,
      );
  static get labelLargeSofiaProGray40001 =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: appTheme.gray40001,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProGray500 =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProMedium =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProOnPrimaryContainer =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProOnPrimaryContainerMedium =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProRed500 =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: appTheme.red500,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProWhiteA700 =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeSofiaProWhiteA700Medium =>
      theme.textTheme.labelLarge!.sofiaPro.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBlue10001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blue10001,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumOnPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get labelMediumOnPrimaryContainer =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get labelMediumOnPrimaryMedium =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      );
  static get labelSmallBlue800 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.blue800,
      );
  static get labelSmallSecondaryContainer =>
      theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
  // Sofia text style
  static get sofiaProBlue800 => TextStyle(
        color: appTheme.blue800,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w600,
      ).sofiaPro;
  // Title text style
  static get titleLargeOpenSansGray40001 =>
      theme.textTheme.titleLarge!.openSans.copyWith(
        color: appTheme.gray40001,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeOpenSansIndigo900 =>
      theme.textTheme.titleLarge!.openSans.copyWith(
        color: appTheme.indigo900,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeSofiaProIndigo900 =>
      theme.textTheme.titleLarge!.sofiaPro.copyWith(
        color: appTheme.indigo900,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeSofiaProOnPrimary =>
      theme.textTheme.titleLarge!.sofiaPro.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 20.fSize,
      );
  static get titleLargeSofiaProOnPrimaryMedium =>
      theme.textTheme.titleLarge!.sofiaPro.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMedium18_1 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumBlack90001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001,
      );
  static get titleMediumBlue800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue800,
      );
  static get titleMediumBlue800_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue800,
      );
  static get titleMediumGray40001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray40001,
      );
  static get titleMediumGray500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOnPrimaryContainerSemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOnPrimaryContainer_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get titleMediumOpenSansBlue800 =>
      theme.textTheme.titleMedium!.openSans.copyWith(
        color: appTheme.blue800,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOpenSansWhiteA700 =>
      theme.textTheme.titleMedium!.openSans.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOpenSansWhiteA700SemiBold =>
      theme.textTheme.titleMedium!.openSans.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSFProText => theme.textTheme.titleMedium!.sFProText;
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumWhiteA700_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMedium_1 => theme.textTheme.titleMedium!;
  static get titleSmallBlue800 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blue800,
      );
  static get titleSmallBlue800SemiBold => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blue800,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get titleSmallOpenSansOnPrimaryContainer =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOpenSansOnPrimaryContainerSemiBold =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get openSans {
    return copyWith(
      fontFamily: 'Open Sans',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }

  TextStyle get sofiaPro {
    return copyWith(
      fontFamily: 'Sofia Pro',
    );
  }
}
