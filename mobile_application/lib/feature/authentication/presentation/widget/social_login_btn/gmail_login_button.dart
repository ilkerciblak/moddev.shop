import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/authentication/presentation/widget/social_login_button.dart';

class GmailLoginButton extends StatelessWidget {
  const GmailLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialLoginButton(
      btnText: 'Login with Google',
      btnIcon: Icons.g_mobiledata,
      btnBackgroundColor: AppColors.primarySilver,
      iconColor: Colors.orange,
      onPressed: () {},
    );
  }
}
