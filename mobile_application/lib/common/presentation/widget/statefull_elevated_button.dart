import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';

class ElevatedStatefullButton extends StatelessWidget {
  final String btnText;
  final void Function()? onTap;
  final ActionResult _actionResult;
  final Color? backgroundColor;
  final TextStyle? btnTextStyle;

  const ElevatedStatefullButton({
    super.key,
    required this.btnText,
    required ActionResult actionResult,
    this.onTap,
    this.backgroundColor,
    this.btnTextStyle,
  }) : _actionResult = actionResult;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !_actionResult.isLoading ? onTap : null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: backgroundColor?.withOpacity(0.5) ??
            AppColors.primaryPurple.withOpacity(0.6),
        backgroundColor: backgroundColor ?? AppColors.primaryPurple,
        // surfaceTintColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: !_actionResult.isLoading
          ? Text(
              btnText,
              style: btnTextStyle ?? context.textTheme.titleLarge,
            )
          : const CircularProgressIndicator.adaptive(),
    );
  }
}
