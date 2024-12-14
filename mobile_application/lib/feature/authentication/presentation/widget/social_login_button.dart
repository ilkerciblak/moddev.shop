import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';

class SocialLoginButton extends StatelessWidget {
  final Color iconColor;
  final Color btnBackgroundColor;
  final void Function() onPressed;
  final IconData btnIcon;
  final Color btnIconColor;
  final BorderSide borderSide;
  final String btnText;
  // final TextStyle btnTextStyle;
  const SocialLoginButton({
    super.key,
    this.iconColor = AppColors.primaryWhite,
    this.btnBackgroundColor = AppColors.primaryWhite,
    this.borderSide = BorderSide.none,
    this.onPressed = DoNothingAction.new,
    // this.btnTextStyle = AppFontStyles.boldBlack13,
    this.btnIconColor = AppColors.primaryBlack,
    required this.btnText,
    required this.btnIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: IconAlignment.start,
      style: ElevatedButton.styleFrom(
        iconColor: iconColor,
        // backgroundColor: btnBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: borderSide,
        ),
      ),
      onPressed: onPressed,
      label: Text(
        btnText,
        // style: btnTextStyle,
      ),
      icon: Icon(
        btnIcon,
        color: btnIconColor,
      ),
    );
  }
}
