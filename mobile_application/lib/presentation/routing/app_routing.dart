import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_application/presentation/_presentation.dart';
import 'package:mobile_application/presentation/authentication/authentication_route_registrar.dart';
import 'package:mobile_application/presentation/catalog/catalog_route_registrar.dart';
import 'package:mobile_application/presentation/user/user_route_registrar.dart';

@immutable
final class AppRouting {
  static final GoRouter appRouteConfig = GoRouter(
    initialLocation: '/login',
    routes: [
      PresentationRouteRegistrar.homeRoute,
      PresentationRouteRegistrar.splashRoute,
      AuthenticationRouteRegistrar.loginRoute,
      UserRouteRegistrar.signUpScreen,
      CatalogRouteRegistrar.productDetailRoute,
    ],
  );
}
