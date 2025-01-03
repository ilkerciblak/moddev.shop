import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/_theme.dart';

class CommonErrorBuilder extends StatelessWidget {
  final Exception exception;
  final void Function() onRetry;
  const CommonErrorBuilder({
    super.key,
    required this.exception,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline_sharp,
          size: 50,
          color: AppColors.secondaryWhite,
        ),
        AppSpacing.verticalGapMd,
        Text(
          exception.toString(),
        ),
        TextButton(
          onPressed: onRetry,
          child: const Text('Please Try Again'),
        )
      ],
    );
  }
}
