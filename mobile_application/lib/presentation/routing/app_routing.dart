import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_application/feature/_feature.dart';
import 'package:mobile_application/presentation/_presentation.dart';

@immutable
final class AppRouting {
  static final GoRouter appRouteConfig = GoRouter(
    initialLocation: '/login',
    routes: [
      PresentationRouteRegistrar.homeRoute,
      PresentationRouteRegistrar.splashRoute,
      AuthenticationRouteRegistrar.loginRoute,
      UserRouteRegistrar.signUpScreen,
    ],
  );
}
