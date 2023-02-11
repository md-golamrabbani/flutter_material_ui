// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_material_ui/src/utils/app_constants.dart';

class MButton {
  static Widget defaultBtn({
    Color? backgroundColor,
    Color? borderColor,
    double? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
    bool? isFullWidth,
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: () {
          onPressed.call();
        },
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

  static Widget gradientBtn({
    List<Color>? gradientColors,
    double? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
    bool? isFullWidth,
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: margin ?? EdgeInsets.all(5.0),
      padding: padding ?? EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        gradient: gradientColors == null
            ? null
            : LinearGradient(
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
                child: child)),
      ),
    );
  }
}
