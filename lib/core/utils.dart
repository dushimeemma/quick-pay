import 'package:flutter/material.dart';
import 'package:quick_pay/core/constants.dart';

class Utils {
  static String generateCode({
    String? code,
  }) {
    return '*182*8*1*$code#';
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      quickPaySnackBar({
    String? label,
    String? message,
    void Function()? onPressed,
    Color? backgroundColor,
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor ?? Constants.primary,
        content: Text(
          message ?? 'success',
          style: TextStyle(
            color: Constants.textColor,
          ),
        ),
        action: label != null
            ? SnackBarAction(
                label: label,
                onPressed: onPressed!,
              )
            : null,
      ),
    );
  }
}
