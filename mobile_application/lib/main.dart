import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/common/routing/app_routing.dart';
import 'package:mobile_application/common/theme/input_decoration/input_decoration.dart';
import 'package:mobile_application/feature/_feature.dart';
import 'package:mobile_application/feature/user/presentation/user_route_registrar.dart';
import 'package:mobile_application/presentation/_presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initProjectDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: AppRouting.gorouter([
        AuthenticationRouteRegistrar.loginRoute,
        PresentationRouteRegistrar.homeRoute,
      ]),
      theme: ThemeData(
        textTheme: AppTextStyles.textTheme,
        scaffoldBackgroundColor: AppColors.secondaryWhite,
        inputDecorationTheme: AppFormTheme().inputDecorationThemeLight,
      ),
      darkTheme: ThemeData(
        textTheme: AppTextStylesDark.darkTextTheme,
        scaffoldBackgroundColor: AppColors.primaryBlack,
        inputDecorationTheme: AppFormTheme().inputDecorationThemeDark,
      ),
    );
  }
}
