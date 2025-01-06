import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/authentication/presentation/widget/_widget.dart';

class SocialLoginContent extends StatelessWidget {
  const SocialLoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Or You Can Continue with Social Accounts',
          style: context.textTheme.bodySmall,
        ),
        ...[
          const FacebookLoginButton(),
          const AppleLoginButton(),
          const GmailLoginButton(),
        ].map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 21),
            child: Row(
              children: [Expanded(child: e)],
            ),
          ),
        ),
      ],
    );
  }
}
