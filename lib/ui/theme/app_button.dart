import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.backgroundColor = AppColors.mainElement,
    this.overlayColor = AppColors.secondaryElement,
    this.borderColor,
    required this.onPressed,
    required this.child,
  });

  final Color backgroundColor;
  final Color overlayColor;
  final Color? borderColor;
  final void Function() onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(const Size(135, 52)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          side: MaterialStateProperty.all(
            BorderSide(
              color: borderColor ?? backgroundColor,
              width: 1.5,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          overlayColor: MaterialStateProperty.all(overlayColor),
        ),
        child: child,
      ),
    );
  }
}
