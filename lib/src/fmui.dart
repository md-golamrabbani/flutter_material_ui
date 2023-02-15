import 'package:flutter/material.dart';
import 'package:flutter_material_ui/src/utils/app_constants.dart';

class FMUI {
  /// flutter default button style with optional customization
  static Widget button({
    Color? backgroundColor,
    Color? borderColor,
    double? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? width,
    double? height,
    bool? isFullWidth,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    return Container(
      margin: margin,
      width: width ?? width,
      height: height ?? height,
      child: ElevatedButton(
        onPressed: () => onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          padding: MaterialStateProperty.all(
            padding,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? AppConstants.defaultSize / 4,
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
    double? borderRadius,
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
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? AppConstants.defaultSize / 4),
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
}
