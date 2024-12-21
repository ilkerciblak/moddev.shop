import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_application/common/_common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with _SplashScreenAutoLoginAction, _SplashScreenVersionCheckAction {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initApplication();
    });

    super.initState();
  }

  void initApplication() async {
    FutureHelper.chainFutureMethods([
      checkApplicationVersion,
      autoAuth,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: const Color(0xFF344C64),
      child: Image.asset(
        'lib/common/asset/image/logo.png',
        fit: BoxFit.cover,
      ),
    ));
  }
}

mixin _SplashScreenAutoLoginAction on State<SplashScreen> {
  final IAuthenticationRepository _authenticationRepository =
      GetIt.instance<IAuthenticationRepository>();
  final EncryptedSecureStorageService _storageService =
      GetIt.instance<EncryptedSecureStorageService>();

  Future<ActionResult<void>> autoAuth() async {
    var username = await _storageService.getString(key: 'username');
    var password = await _storageService.getString(key: 'password');

    var response = await _authenticationRepository
        .login(username: username, password: password)
        .run();

    response.fold(
      (l) {
        context.replaceNamed('login-screen');
      },
      (r) {
        context.replaceNamed('shop-screen');
      },
    );
    return const Success();
  }
}

mixin _SplashScreenVersionCheckAction on State<SplashScreen> {
  Future<ActionResult<void>> checkApplicationVersion() async {
    // unawaited(
    //   await showAdaptiveDialog(
    //     context: context,
    //     builder: (context) => const AlertDialog.adaptive(
    //       title: Text('Version Check'),
    //       content: Text('Checking Application Version'),
    //     ),
    //     barrierDismissible: true,
    //   ),
    // );

    return const Success();
  }
}
