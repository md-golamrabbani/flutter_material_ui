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
}
