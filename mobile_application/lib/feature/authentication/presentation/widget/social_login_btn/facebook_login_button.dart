import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/authentication/presentation/widget/social_login_button.dart';

class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialLoginButton(
      btnText: 'Login with Facebook',
      btnIcon: Icons.facebook_outlined,
      btnBackgroundColor: AppColors.primaryWhite,
      borderSide: const BorderSide(
        color: Colors.blue,
      ),
      onPressed: () {},
    );
  }
}
