import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/authentication/presentation/widget/social_login_button.dart';

class AppleLoginButton extends StatelessWidget {
  const AppleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialLoginButton(
      btnText: 'Login With Apple',
      btnIcon: Icons.apple,
      btnBackgroundColor: AppColors.primaryWhite,
      onPressed: () {},
    );
  }
}
