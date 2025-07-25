import 'package:e_commerce_app/core/resources/colors_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              Padding(
                padding: REdgeInsets.all(8),
                child: Text(
                  "Loading",
                  style: getMediumStyle(
                    color: ColorManager.darkBlue,
                    fontSize: FontSize.s18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideDialog(BuildContext context){
    Navigator.pop(context);
  }

  static void showMessageDialog(
      BuildContext context, {
        required String message,
        String? title,
        String? posActionTitle,
        String? negActionTitle,
        VoidCallback? posAction,
        VoidCallback? negAction,
      }) {
    List<Widget> actions = [];

    if (posActionTitle != null && posAction != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction.call();
          },
          child: Text(posActionTitle),
        ),
      );
    }
    if (negActionTitle != null && negAction != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction.call();
          },
          child: Text(negActionTitle),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          title: title != null ? Text(title) : null,
          actions: actions,
        );
      },
    );
  }
}
