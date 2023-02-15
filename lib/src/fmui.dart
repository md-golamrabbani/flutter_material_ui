import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_material_ui/src/utils/app_constants.dart';

class FMUI {
  /// flutter button
  static Widget button({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    BorderRadiusGeometry? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? width,
    double? height,
    double? elevation,
    bool? isFullWidth,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    return Container(
      margin: margin,
      width: width ?? width,
      height: height ?? height,
      child: ElevatedButton(
        onPressed: () {
          onPressed.call();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          foregroundColor: MaterialStateProperty.all(foregroundColor),
          elevation: MaterialStatePropertyAll(elevation),
          padding: MaterialStateProperty.all(padding),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  BorderRadius.circular(
                    AppConstants.defaultSize / 4,
                  ),
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
              ),
            ),
          ),
        ),
        child: Container(
          alignment: isFullWidth == true ? Alignment.center : null,
          child: child,
        ),
      ),
    );
  }

  /// flutter gradient button
  static Widget gradientBtn({
    BorderRadiusGeometry? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
    bool? isFullWidth,
    required VoidCallback onPressed,
    required List<Color> gradientColors,
    required Widget child,
  }) {
    if (gradientColors.length < 2) {
      gradientColors.add(Colors.blue);
    }
    return Container(
      margin: margin ?? EdgeInsets.all(AppConstants.smSize / 2),
      padding: padding ?? EdgeInsets.all(AppConstants.smSize / 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: borderRadius ??
            BorderRadius.all(
              Radius.circular(AppConstants.defaultSize / 4),
            ),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            alignment: isFullWidth == true ? Alignment.center : null,
            child: child,
          ),
        ),
      ),
    );
  }

  /// flutter dialog
  static dialog({
    required BuildContext context,
    Widget? title,
    required Widget content,
    List<Widget>? action,
    EdgeInsets? titlePadding,
    EdgeInsets? contentPadding,
    EdgeInsets? actionsPadding,
    EdgeInsets? insetPadding,
    BorderRadiusGeometry? borderRadius,
    double? elevation,
    Color? backgroundColor,
    Color? barrierColor,
    bool? barrierDismissible,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible ?? true,
      barrierColor: barrierColor ?? AppConstants.barrierColor,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: titlePadding ??
              EdgeInsets.only(
                top: AppConstants.smSize,
                left: AppConstants.lgSize,
                right: AppConstants.lgSize,
              ),
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: AppConstants.smSize,
                horizontal: AppConstants.lgSize,
              ),
          actionsPadding: actionsPadding ??
              EdgeInsets.only(
                bottom: AppConstants.smSize,
                left: AppConstants.lgSize,
                right: AppConstants.lgSize,
              ),
          backgroundColor: backgroundColor ?? AppConstants.whiteColor,
          elevation: elevation ?? 1,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(
                  AppConstants.defaultSize,
                ),
          ),
          title: title,
          content: content,
          actions: action,
        );
      },
    );
  }

  /// flutter modal
  static modal({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
    BorderRadiusGeometry? borderRadius,
    bool? enableDrag,
    bool? isDismissible,
    bool? isScrollControlled,
    Color? backgroundColor,
    Color? barrierColor,
    double? elevation,
  }) {
    showModalBottomSheet(
        context: context,
        isDismissible: isDismissible ?? true,
        isScrollControlled: isScrollControlled ?? true,
        enableDrag: enableDrag ?? true,
        barrierColor: barrierColor,
        elevation: elevation ?? 1,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ??
              BorderRadius.only(
                topLeft: Radius.circular(
                  AppConstants.defaultSize,
                ),
                topRight: Radius.circular(
                  AppConstants.defaultSize,
                ),
              ),
        ),
        backgroundColor: backgroundColor,
        builder: (context) {
          return Container(
            padding: padding ??
                EdgeInsets.all(
                  AppConstants.defaultSize,
                ),
            child: child,
          );
        });
  }

  /// flutter toast
  static toast({
    required BuildContext context,
    required Widget child,
    Color? backgroundColor,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BorderRadiusGeometry? borderRadius,
    SnackBarBehavior? behavior,
    Duration? duration,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        padding: padding ??
            EdgeInsets.all(
              AppConstants.defaultSize,
            ),
        margin: margin ??
            EdgeInsets.all(
              AppConstants.defaultSize,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ??
              BorderRadius.all(
                Radius.circular(AppConstants.defaultSize),
              ),
        ),
        behavior: behavior ?? SnackBarBehavior.floating,
        duration: duration ?? const Duration(seconds: 2),
        content: child,
      ),
    );
  }
}
