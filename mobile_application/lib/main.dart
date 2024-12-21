import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Modular Shop',
      routerConfig: AppRouting.appRouteConfig,
      theme: AppTheme.appLightTheme,
      darkTheme: AppTheme.appDarkTheme,
    );
  }
}
